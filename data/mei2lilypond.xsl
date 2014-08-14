<xsl:transform xmlns:math="http://exslt.org/math" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:m="http://www.music-encoding.org/ns/mei" xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl math" version="1.0">
    <xsl:output method="text" media-type="text/plain;charset=UTF-8" indent="no" encoding="UTF-8"/>
    <xsl:param name="tempo" select="'120'"/>
    <xsl:param name="getitas" select="'pdf'"/>
    <xsl:param name="lily-pitch-in" select="document('pitch-crosswalk.xml')"/>
    <xsl:param name="lily-pitch" select="exsl:node-set($lily-pitch-in)"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/m:mei">
        <xsl:apply-templates select="m:music"/>
    </xsl:template>
    <xsl:template match="/m:music">
        <xsl:apply-templates select="m:body"/>
    </xsl:template>
    <xsl:template match="m:body">
        <xsl:apply-templates select="m:mdiv"/>
    </xsl:template>
    <xsl:template match="m:mdiv">
        <xsl:apply-templates select="m:score"/>
    </xsl:template>
    <xsl:template match="m:score"><xsl:text>\paper {
paper-height = 150\mm
paper-width  = 280\mm 
top-margin = 0\mm
bottom-margin = 0\mm
left-margin = 3\mm
right-margin = 2\mm
ragged-last-bottom = ##f
last-bottom-spacing #'basic-distance = #0 
}

\header {
tagline = ""  % removed
} 

%
% get it as 
% </xsl:text><xsl:value-of select="$getitas"/><xsl:text>
    
</xsl:text> 
        <xsl:call-template name="get-voice">
            <xsl:with-param name="voicename">righthand</xsl:with-param>
            <xsl:with-param name="voicenumber">1</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="get-voice">
            <xsl:with-param name="voicename">lefthand</xsl:with-param>
            <xsl:with-param name="voicenumber">2</xsl:with-param>
        </xsl:call-template>\score { 
\new PianoStaff 
    &lt;&lt; 
    \set PianoStaff.instrumentName = #""
    \righthand 
    \lefthand 
    &gt;&gt; 
    \layout {} 
} 

\score { 
\new PianoStaff 
    \unfoldRepeats 
    &lt;&lt;
    \set PianoStaff.instrumentName = #"" 
    \righthand 
    \lefthand 
    &gt;&gt; 
    \midi { 
    midiMinimumVolume = #0.5 
    midiMaximumVolume = #0.9 
    }
}
    </xsl:template>
    
    <xsl:template match="m:layer">
        <xsl:apply-templates select="m:clef|m:chord|m:beam|m:note|m:rest|m:space"/>
    </xsl:template>
    <xsl:template match="m:chord">
        <xsl:if test="@stem.dir='up' and not(@grace)">
            <xsl:text> \once \stemUp </xsl:text>
        </xsl:if>
        <xsl:if test="@stem.dir='down' and not(@grace)">
            <xsl:text> \once \stemDown </xsl:text>
        </xsl:if>
        <xsl:text> &lt; </xsl:text>
        <xsl:apply-templates select="m:note"/>
        <xsl:text> &gt;</xsl:text>
        <xsl:value-of select="@dur"/>
        <xsl:call-template name="dots">
            <xsl:with-param name="dots" select="@dots"/>
        </xsl:call-template>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="m:beam[m:note|m:chord|m:rest|m:space|m:clef]">
        <xsl:call-template name="beam-like"/>
    </xsl:template>
    <xsl:template name="beam-like">
        <xsl:for-each select="m:note|m:chord|m:rest|m:space|m:clef">
            <xsl:if test="@grace and not(preceding-sibling::m:note[1]/@grace)">
                <xsl:choose>
                    <xsl:when test="@grace = 'unacc'">
                        <xsl:text> \acciaccatura {</xsl:text>
                    </xsl:when>
                    <xsl:when test="@grace = 'acc'">
                        <xsl:text> \appoggiatura {</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="preceding-sibling::m:note[1]/@grace and not(@grace)">} </xsl:if>
            <xsl:choose>
                <xsl:when test="position()=1">
                    <xsl:apply-templates select="."/>[</xsl:when>
                <xsl:when test="position()&gt;1">
                    <xsl:apply-templates select="."/>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="position()=last()">] </xsl:if>
            <xsl:if test="@grace and position()=last()">} </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="dots">
        <xsl:param name="dots" select="'1'"/>
        <xsl:choose>
            <xsl:when test="$dots='1'">.</xsl:when>
            <xsl:when test="$dots='2'">..</xsl:when>
            <xsl:when test="$dots='3'">...</xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="m:beam[m:tuplet]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="m:tuplet">
        <!--tuplet dur="4" num.place="below" num.format="count" num="3"/-->
        <!-- this seem to work for triols and pentols -->
        <xsl:value-of select="concat('\times ',m:note[1]/@dur div @dur,'/',@num)"/>
        <xsl:text> { </xsl:text>
        <xsl:call-template name="beam-like"/> } </xsl:template>
    <xsl:template match="m:dir">
        <!-- this would be better than using \mark - but requires the markup to be placed after a note... -->
        <!--<xsl:choose>
      <xsl:when test="@place='above'">
        <xsl:text>^</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>_</xsl:text>
      </xsl:otherwise>
    </xsl:choose>-->
        <xsl:choose>
            <xsl:when test="@type='card_no'">
                <xsl:text>\mark \markup { \smaller \rounded-box "</xsl:text>
                <xsl:value-of select="translate(.,'.','')"/>
                <xsl:text>"} </xsl:text>
            </xsl:when>
            <xsl:when test="@type='repeat'">
                <!-- used for the "D.C." directive -->
                <xsl:text>\once \override Score.RehearsalMark #'direction = #down
\once \override Score.RehearsalMark #'font-size = #1         
\mark \markup { "</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>"} </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>\mark \markup {"</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>"} </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="m:fermata">
        <xsl:text>\once \override Score.RehearsalMark #'padding = #0
\once \override Score.RehearsalMark #'self-alignment-X = #CENTER
\mark \markup { \musicglyph #"scripts.ufermata" } </xsl:text>
    </xsl:template>
    <xsl:template match="m:note">
        <xsl:if test="not(ancestor::m:chord)">
            <xsl:choose>
                <xsl:when test="@staff">
                    <xsl:text>\change Staff = "</xsl:text>
                    <xsl:value-of select="@staff"/>
                    <xsl:text>" </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="preceding-sibling::m:note[1]/@staff">
                        <xsl:text>\change Staff = "</xsl:text>
                        <xsl:value-of select="ancestor::m:staff/@n"/>
                        <xsl:text>" </xsl:text>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="@grace and not(ancestor::m:beam)">
            <xsl:choose>
                <xsl:when test="@grace = 'unacc'">
                    <xsl:text> \acciaccatura </xsl:text>
                </xsl:when>
                <xsl:when test="@grace = 'acc'">
                    <xsl:text> \appoggiatura </xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="@stem.dir='up' and not(@grace)">
            <xsl:text> \once \stemUp </xsl:text>
        </xsl:if>
        <xsl:if test="@stem.dir='down' and not(@grace)">
            <xsl:text> \once \stemDown </xsl:text>
        </xsl:if>
        <xsl:variable name="pname" select="@pname"/>
        <xsl:variable name="oct" select="@oct"/>
        <xsl:variable name="ancestor" select="generate-id(ancestor::m:staff)"/>
        <xsl:variable name="accid">
            <xsl:choose>
                <xsl:when test="@accid">
                    <xsl:value-of select="@accid"/>
                </xsl:when>
                <xsl:when
                    test="preceding::m:note[@pname=$pname and generate-id(ancestor::m:staff) = $ancestor and @accid]/@accid">
                    <xsl:value-of
                        select="preceding::m:note[@pname=$pname and generate-id(ancestor::m:staff) = $ancestor and @accid]/@accid"
                    />
                </xsl:when>
                <xsl:otherwise>none</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="get-lily-pitch">
            <xsl:with-param name="pname" select="@pname"/>
            <xsl:with-param name="accid" select="$accid"/>
        </xsl:call-template>
        <xsl:choose>
            <xsl:when test="@oct=0">,,,</xsl:when>
            <xsl:when test="@oct=1">,,</xsl:when>
            <xsl:when test="@oct=2">,</xsl:when>
            <xsl:when test="@oct=4">'</xsl:when>
            <xsl:when test="@oct=5">''</xsl:when>
            <xsl:when test="@oct=6">'''</xsl:when>
            <xsl:when test="@oct=7">''''</xsl:when>
        </xsl:choose>
        <xsl:value-of select="normalize-space(@dur)"/>
        <xsl:call-template name="dots">
            <xsl:with-param name="dots" select="@dots"/>
        </xsl:call-template>
        <xsl:choose>
            <xsl:when test="@artic = 'stacc'">-.</xsl:when>
            <xsl:when test="@artic = 'acc'"> \accent </xsl:when>
        </xsl:choose>

        <!-- other articulation stuff:
has shorthand in lilypond:
marcato,stopped, tenuto, staccatissimo, accent, staccato, and portato
From mei schema:
"acc"
"stacc" 
"ten"
"stacciss"
"marc"
"marc-stacc"
"spicc"
"doit"
"rip"
"plop"
"fall"
"bend"
"flip"
"smear"
"dnbow"
"upbow"
"harm"
"snap"
"fingernail"
"ten-stacc"
"damp"
"dampall"
"open"
"stop"
"dbltongue"
"trpltongue"
"heel"
"toe"
"tap"
"lhpizz"
"dot"
"stroke" -->
        <xsl:if test="@xml:id">
            <xsl:variable name="me_id" select="@xml:id"/>
            <xsl:if test="//m:tie/@startid = $me_id">
                <xsl:text>~</xsl:text>
            </xsl:if>
            <xsl:if test="//m:slur/@startid = $me_id">
                <xsl:text>( </xsl:text>
            </xsl:if>
            <xsl:if test="//m:slur/@endid = $me_id">
                <xsl:text>) </xsl:text>
            </xsl:if>
            <xsl:if test="//m:hairpin/@startid = $me_id">
                <xsl:text>\&gt; </xsl:text>
            </xsl:if>
            <xsl:if test="//m:hairpin/@endid = $me_id">
                <xsl:text>\! </xsl:text>
            </xsl:if>
        </xsl:if>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="m:rest">
        <xsl:text> r</xsl:text>
        <xsl:value-of select="normalize-space(@dur)"/>
        <xsl:call-template name="dots">
            <xsl:with-param name="dots" select="@dots"/>
        </xsl:call-template>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="m:space">
        <xsl:text> s</xsl:text>
        <xsl:value-of select="normalize-space(@dur)"/>
        <xsl:call-template name="dots">
            <xsl:with-param name="dots" select="@dots"/>
        </xsl:call-template>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="m:clef">
        <xsl:choose>
            <xsl:when test="@shape='G'">
                <xsl:text>
\clef "treble" </xsl:text>
            </xsl:when>
            <xsl:when test="@shape='F'">
                <xsl:text>
\clef "bass" </xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="partial">
        <xsl:variable name="notes">
            <notes>
                <xsl:for-each
                    select="//m:measure[@n=0]//m:staff[@n=1]//m:chord |
                    //m:measure[@n=0]//m:staff[@n=1]//m:beam/m:note[not(@grace)]|
                    //m:measure[@n=0]//m:staff[@n=1]//m:layer/m:note[not(@grace)]|
                    //m:measure[@n=0]//m:staff[@n=1]//m:rest|
                    //m:measure[@n=0]//m:staff[@n=1]//m:space">
                    <xsl:choose>
                        <xsl:when test="@dots &gt;= 1">
                            <dur>
                                <xsl:value-of
                                    select="(1 div  @dur ) * ( 2 - 1 div math:power( 2, @dots ))"/>
                            </dur>
                        </xsl:when>
                        <xsl:otherwise>
                            <dur>
                                <xsl:value-of select="1 div @dur"/>
                            </dur>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </notes>
        </xsl:variable>
        <xsl:variable name="durations" select="exsl:node-set($notes)//dur"/> \partial <xsl:value-of
            select="1 div sum($durations)"/>
        <xsl:text> 
  </xsl:text>
    </xsl:template>
    <xsl:template name="get-voice">
        <xsl:param name="voicename" select="'voice'"/>
        <xsl:param name="voicenumber" select="'1'"/>
        <xsl:value-of select="$voicename"/>
        <xsl:text> = \new Staff =
"</xsl:text>
        <xsl:value-of select="$voicenumber"/>
        <xsl:text>" {
\time </xsl:text>
        <xsl:value-of select="concat(m:scoreDef/@meter.count,'/',m:scoreDef/@meter.unit)"/>
        <xsl:if test="$voicenumber=1">
            <xsl:text>
\set Score.tempoHideNote = ##t
\tempo 4 = </xsl:text>
            <xsl:value-of select="$tempo"/>
        </xsl:if>
        <xsl:call-template name="get-clef">
            <xsl:with-param name="voicenumber" select="$voicenumber"/>
        </xsl:call-template>
        <xsl:call-template name="partial"/>
        <xsl:for-each select="m:section">
            <xsl:if test="m:scoreDef/@key.sig">
                <xsl:call-template name="get-key-sig"/>
            </xsl:if>
            <xsl:if test="position()=1">
                <!--<xsl:call-template name="start-repeat"/>-->
                <xsl:text>s64 
\override Score.RehearsalMark #'self-alignment-X = #LEFT 
\override Score.RehearsalMark #'font-size = #0.4
\override Score.RehearsalMark #'padding = #3 </xsl:text>
            </xsl:if>

            <!-- start repeat? -->
            <xsl:call-template name="repeat-start">
                <xsl:with-param name="voicenumber" select="$voicenumber"/>
            </xsl:call-template>

            <xsl:for-each select="m:measure">

                <xsl:apply-templates select="m:dir[@staff=$voicenumber]"/>
                <xsl:for-each select="m:staff[@n=$voicenumber]">
                    <xsl:variable name="layer_test">
                        <xsl:value-of select="count(m:layer)"/>
                    </xsl:variable>
                    <xsl:if test="$layer_test&gt;1">&lt;&lt;</xsl:if>
                    <xsl:for-each select="m:layer">
                        <xsl:if test="position()&gt;1"> \\ </xsl:if>
                        <xsl:if test="$layer_test&gt;1">{</xsl:if>
                        <xsl:apply-templates select="."/>
                        <xsl:if test="$layer_test&gt;1">}</xsl:if>
                    </xsl:for-each>
                    <xsl:if test="$layer_test&gt;1">&gt;&gt;</xsl:if>
                    <xsl:text> |
</xsl:text>
                </xsl:for-each>
                <xsl:apply-templates select="m:fermata"/>
            </xsl:for-each>

            <!-- end repeat? -->
            <xsl:call-template name="repeat-end">
                <xsl:with-param name="voicenumber" select="$voicenumber"/>
            </xsl:call-template>

        </xsl:for-each>
        <xsl:text>}
</xsl:text>
    </xsl:template>
    
    
    <xsl:template name="repeat-start">
        <xsl:param name="voicenumber"/>
        <xsl:if test="$voicenumber=1">
            <xsl:choose>
                <xsl:when test="m:measure[1]/@left='rptboth'">
                    <xsl:text> \break \bar ":|.|:" </xsl:text>
                </xsl:when>
                <xsl:when test="m:measure[1]/@left='rptstart'">
                    <xsl:choose>
                        <xsl:when test="preceding-sibling::m:section[1]//m:measure[last()]/@right='rptend'">
                            <xsl:text> \break \bar ":|.|:" </xsl:text>
                        </xsl:when>
                        <xsl:when test="preceding-sibling::m:section[1]//m:measure[last()]/@right='dbl'">
                                <xsl:text> \break \bar ".|:-||" </xsl:text>
                            <!-- This doesn't work on the server for some reason.
                                It actually works as expected in the desktop version of Lilypond v.2.18. 
                                See documentation: http://www.lilypond.org/doc/v2.18/Documentation/notation/bars#bar-lines 
                                Some changes to barline handling appear to have been made in version 2.18: 
                                http://www.lilypond.org/doc/v2.18/Documentation/changes/index.html
                                We could force double repeat instead, using
                                <xsl:text> \break \bar ":|.|:" </xsl:text>-->
                        </xsl:when>
                        <xsl:when test="preceding-sibling::m:section[1]//m:measure[last()]/@right='rptboth'">
                            <!-- do nothing - taken care of in the following bar -->
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text> \bar ".|:" </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="repeat-end">
        <xsl:param name="voicenumber"/>
        <xsl:if test="$voicenumber=1">
            <xsl:choose>
                <xsl:when test="m:measure[count(../m:measure)]/@right='rptboth'">
                    <xsl:text> \break \bar ":|.|:" </xsl:text>
                </xsl:when>
                <xsl:when test="m:measure[count(../m:measure)]/@right='rptend'">
                    <xsl:choose>
                        <xsl:when
                            test="following-sibling::m:section[1]//m:measure[1]/@left='rptstart'">
                            <!-- do nothing - already taken care of in preceding bar -->
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text> \bar ":|.|:" </xsl:text>
                            <!-- Really should be
                            <xsl:text> \bar ":|." </xsl:text>
                            but the server doesn't get that. Works in desktop Lilypond v.2.18, though... -->
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="m:measure[count(../m:measure)]/@right='dbl'">
                    <xsl:choose>
                        <xsl:when
                            test="following-sibling::m:section[1]//m:measure[1]/@left='rptstart'">
                            <!-- do nothing - taken care of in the following bar -->
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text> \bar "||" </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>




    <xsl:template name="get-key-sig">
        <xsl:text>\key </xsl:text>
        <xsl:call-template name="get-lily-pitch">
            <xsl:with-param name="sig" select="m:scoreDef/@key.sig"/>
            <xsl:with-param name="pname" select="m:scoreDef/@key.pname"/>
            <xsl:with-param name="accid" select="m:scoreDef/@key.accid"/>
        </xsl:call-template>
        <xsl:choose>
            <xsl:when test="m:scoreDef/@key.mode">
                <xsl:choose>
                    <xsl:when test="m:scoreDef/@key.mode='major'"> \major </xsl:when>
                    <xsl:when test="m:scoreDef/@key.mode='minor'"> \minor </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise> \major </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="get-lily-pitch">
        <xsl:param name="sig" select="preceding::m:scoreDef[1]/@key.sig"/>
        <xsl:param name="accid" select="''"/>
        <xsl:param name="pname" select="'c'"/>
        <xsl:choose>
            <xsl:when test="$accid">
                <xsl:value-of
                    select="$lily-pitch//key[@signature=$sig]/note[@pname=$pname]/name[@accid = $accid]"
                />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of
                    select="$lily-pitch//key[@signature=$sig]/note[@pname=$pname]/name[@accid = 'none']"
                />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="get-clef">
        <xsl:param name="voicenumber" select="'1'"/>
        <xsl:choose>
            <xsl:when test="m:scoreDef/m:staffGrp/m:staffDef[@n=$voicenumber]/@clef.shape='G'">
                <xsl:text>
\clef "treble"</xsl:text>
            </xsl:when>
            <xsl:when test="m:scoreDef/m:staffGrp/m:staffDef[@n=$voicenumber]/@clef.shape='F'">
                <xsl:text>
\clef "bass"</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="start-repeat">
        <xsl:choose>
            <xsl:when test="contains($getitas,'mid')"> % s64 </xsl:when>
            <xsl:otherwise> % start repeat \repeat volta 2 { % s64 </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="restart-repeat">
        <xsl:call-template name="end-repeat"/>
        <xsl:call-template name="start-repeat"/>
    </xsl:template>
    <xsl:template name="end-repeat">
        <xsl:choose>
            <xsl:when test="contains($getitas,'mid')"/>
            <xsl:otherwise> } % ending repeat </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:transform>
