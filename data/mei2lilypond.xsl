<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:m="http://www.music-encoding.org/ns/mei"
	       xmlns:exsl="http://exslt.org/common"
	       xmlns:math="http://exslt.org/math"
               extension-element-prefixes="exsl math"
	       version="1.0">

  <xsl:output method="text"
	      media-type="text/plain;charset=UTF-8"
	      indent="no"
	      encoding="UTF-8"/>

  <xsl:param name="tempo"  select="'120'" />
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

<xsl:template match="m:score">
<!-- #(set-paper-size "a4landscape") -->
\paper {
paper-height = 130\mm
paper-width  = 297\mm 
top-margin = 0\mm
bottom-margin = 0\mm
ragged-last-bottom = ##f
last-bottom-spacing #'basic-distance = #0 
}

\header {
  tagline = ""  % removed
} 

%
% get it as <xsl:value-of select="$getitas" />
%
<xsl:call-template name="get-voice">
<xsl:with-param name="voicename">righthand</xsl:with-param>
<xsl:with-param name="voicenumber">1</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="get-voice">
<xsl:with-param name="voicename">lefthand</xsl:with-param>
<xsl:with-param name="voicenumber">2</xsl:with-param>
</xsl:call-template>

\score {
\new PianoStaff
    &lt;&lt;
    \set PianoStaff.instrumentName = #"" 
    \righthand
    \lefthand
    >>
  \layout {}
}

\score {
\new PianoStaff
    \unfoldRepeats
    &lt;&lt;
    \set PianoStaff.instrumentName = #"" 
    \righthand
    \lefthand
    >>
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
    <xsl:apply-templates select="m:note"/><xsl:text> &gt;</xsl:text><xsl:value-of
    select="@dur"/><xsl:call-template name="dots"><xsl:with-param name="dots" select="@dots"/></xsl:call-template><xsl:text> </xsl:text>
    <!-- get timestamp -->
    <!--
      <xsl:if test="@dur">
      <xsl:variable name="timestamp">
      <xsl:call-template name="get_timestamp"/>
      </xsl:variable>
      <xsl:text>^\markup {\tiny "</xsl:text><xsl:value-of select="$timestamp"/><xsl:text>"}</xsl:text>
      </xsl:if>
    -->
    <!-- end get timestamp -->
  </xsl:template>

  <xsl:template match="m:beam[m:note|m:chord|m:rest|m:space|m:clef]">
    <xsl:call-template name="beam-like"/>
  </xsl:template>

  <xsl:template name="beam-like">
    <xsl:for-each select="m:note|m:chord|m:rest|m:space|m:clef">
      <xsl:if test="@grace and not(preceding-sibling::m:note[1]/@grace)">
	<xsl:choose>
	  <xsl:when test="@grace =
			  'unacc'"><xsl:text> \acciaccatura {</xsl:text></xsl:when>
	  <xsl:when test="@grace =
			  'acc'"><xsl:text> \appoggiatura {</xsl:text></xsl:when>
	</xsl:choose>
      </xsl:if>
      <xsl:if test="preceding-sibling::m:note[1]/@grace 
		    and not(@grace)">} </xsl:if>
      <xsl:choose>
	<xsl:when test="position()=1"><xsl:apply-templates select="."/>[</xsl:when>
	<xsl:when test="position()&gt;1"><xsl:apply-templates select="."/></xsl:when>
	</xsl:choose><xsl:if test="position()=last()">] </xsl:if>
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
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="m:tuplet">
    <!--tuplet dur="4" num.place="below" num.format="count" num="3"/-->
    <!-- this seem to work for triols and pentols -->
    <xsl:value-of select="concat('\times ',m:note[1]/@dur div @dur,'/',@num)"/>
    <xsl:text> { </xsl:text> <xsl:call-template name="beam-like"/>  }
  </xsl:template>

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
        <xsl:text>\mark \markup { \smaller \rounded-box "</xsl:text><xsl:value-of 
          select="translate(.,'.','')"/><xsl:text>"} </xsl:text>
      </xsl:when>
      <xsl:when test="@type='repeat'"><!-- used for the "D.C." directive -->
        <xsl:text>\once \override Score.RehearsalMark #'direction = #down
\once \override Score.RehearsalMark #'font-size = #1         
\mark \markup { "</xsl:text><xsl:value-of select="."/><xsl:text>"} </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\mark \markup {"</xsl:text><xsl:value-of select="."/><xsl:text>"} </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    
  </xsl:template>
  
  <xsl:template match="m:fermata">
    <!-- this template is not called anywhere yet ... -->
    <xsl:text>\once \override Score.RehearsalMark #'padding = #0
\once \override Score.RehearsalMark #'self-alignment-X = #CENTER
\mark \markup { \musicglyph #"scripts.ufermata" } </xsl:text>
  </xsl:template>
  
  <xsl:template match="m:note">
    <xsl:if test="not(ancestor::m:chord)">
      <xsl:choose>
	<xsl:when test="@staff">
	  <xsl:text>\change Staff = "</xsl:text><xsl:value-of
	  select="@staff"/><xsl:text>" </xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:if test="preceding-sibling::m:note[1]/@staff">
	    <xsl:text>\change Staff = "</xsl:text><xsl:value-of
	    select="ancestor::m:staff/@n"/><xsl:text>" </xsl:text>
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
	<xsl:when test="preceding::m:note[@pname=$pname and
		      generate-id(ancestor::m:staff) = $ancestor and
			      @accid]/@accid">
	  <xsl:value-of 
	      select="preceding::m:note[@pname=$pname and
		      generate-id(ancestor::m:staff) = $ancestor and
			      @accid]/@accid"/>
	</xsl:when>
	<xsl:otherwise>none</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="get-lily-pitch">
      <xsl:with-param name="pname" select="@pname"/>
      <xsl:with-param name="accid" 
		      select="$accid"/>
      </xsl:call-template><xsl:choose>
  <xsl:when test="@oct=0">,,,</xsl:when>
  <xsl:when test="@oct=1">,,</xsl:when>
  <xsl:when test="@oct=2">,</xsl:when>
  <xsl:when test="@oct=4">'</xsl:when>
  <xsl:when test="@oct=5">''</xsl:when>
  <xsl:when test="@oct=6">'''</xsl:when>
  <xsl:when test="@oct=7">''''</xsl:when></xsl:choose><xsl:value-of
  select="normalize-space(@dur)"/><xsl:call-template
  name="dots"><xsl:with-param name="dots" select="@dots"/></xsl:call-template>
    <xsl:choose>
      <xsl:when test="@artic = 'stacc'">-.</xsl:when>
      <xsl:when test="@artic = 'acc'"> \accent </xsl:when>
    </xsl:choose>
    
    <!-- get timestamp -->
    <!--
    <xsl:if test="@dur">
      <xsl:variable name="timestamp">
        <xsl:call-template name="get_timestamp"/>
      </xsl:variable>
      <xsl:text>^\markup {\tiny "</xsl:text><xsl:value-of select="$timestamp"/><xsl:text>"}</xsl:text>
    </xsl:if>
    -->
    <!-- end get timestamp -->
    
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
    <xsl:if test="//m:tie/@startid = $me_id"><xsl:text>~</xsl:text></xsl:if>
    <xsl:if test="//m:slur/@startid = $me_id"><xsl:text>( </xsl:text></xsl:if>
    <xsl:if test="//m:slur/@endid = $me_id"><xsl:text>) </xsl:text></xsl:if>
    <xsl:if test="//m:hairpin/@startid = $me_id"><xsl:text>\&gt; </xsl:text></xsl:if>
    <xsl:if test="//m:hairpin/@endid = $me_id"><xsl:text>\! </xsl:text></xsl:if>
  </xsl:if>
  <xsl:text> </xsl:text></xsl:template>

  <xsl:template name="get_timestamp">
    <xsl:param name="sum" select="0"/>
    <xsl:choose>
      <!-- to do: also look for element with a duration one level up or down 
        (to include notes inside/outside beams) -->
      <xsl:when test="preceding-sibling::*[not(@grace)]/@dur">
        <xsl:for-each select="preceding-sibling::*[not(@grace)][@dur][position()=1]">
          <xsl:choose>
            <xsl:when test="@dots">
              <xsl:call-template name="get_timestamp">
                <!-- the following does not take into accout double dotting (in lack of power function) -->
                <xsl:with-param name="sum" select="$sum + (4 div @dur)*(1+@dots*0.5)"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="get_timestamp">
                <xsl:with-param name="sum" select="$sum + (4 div @dur)"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="@dots">
            <xsl:value-of select="$sum + (4 div @dur)*(1+@dots*0.5)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$sum + (4 div @dur)"/>
          </xsl:otherwise>
        </xsl:choose>        
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="m:rest">
    <xsl:text> r</xsl:text><xsl:value-of
  select="normalize-space(@dur)"/><xsl:call-template
  name="dots"><xsl:with-param name="dots" select="@dots"/></xsl:call-template><xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="m:space">
    <xsl:text> s</xsl:text><xsl:value-of
  select="normalize-space(@dur)"/><xsl:call-template
  name="dots"><xsl:with-param name="dots" select="@dots"/></xsl:call-template><xsl:text> </xsl:text>
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
	<xsl:for-each select="//m:measure[@n=0]//m:staff[@n=1]//m:chord|
			      //m:measure[@n=0]//m:staff[@n=1]//m:beam/m:note[not(@grace)]|
			      //m:measure[@n=0]//m:staff[@n=1]//m:layer/m:note[not(@grace)]|
			      //m:measure[@n=0]//m:staff[@n=1]//m:rest|
			      //m:measure[@n=0]//m:staff[@n=1]//m:space">
	  <xsl:choose>
	    <xsl:when test="@dots &gt;= 1">
	      <dur><xsl:value-of 
	      select="(1 div  @dur ) * ( 2 - 1 div math:power( 2, @dots ))"/></dur>
	    </xsl:when>
	    <xsl:otherwise>
	      <dur><xsl:value-of select="1 div @dur"/></dur>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:for-each>
      </notes>
    </xsl:variable>
    <xsl:variable name="durations" select="exsl:node-set($notes)//dur"/>
    \partial <xsl:value-of
    select="1 div sum($durations)"/><xsl:text> 
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
        <xsl:call-template name="start-repeat"/> s64 
\override Score.RehearsalMark #'self-alignment-X = #LEFT
\override Score.RehearsalMark #'font-size = #0.4
\override Score.RehearsalMark #'padding = #3
      </xsl:if>

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
      <xsl:choose>
        <xsl:when test="m:measure/@right='rptend'">
          <xsl:call-template name="end-repeat"/>
        </xsl:when>
        <xsl:when test="m:measure/@right='rptboth'">
          <xsl:call-template name="restart-repeat"/>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:text>}
</xsl:text>
  </xsl:template>

<xsl:template name="get-key-sig">
  <xsl:text>\key </xsl:text><xsl:call-template name="get-lily-pitch">
  <xsl:with-param name="sig" select="m:scoreDef/@key.sig"/>
  <xsl:with-param name="pname" select="m:scoreDef/@key.pname"/>
  <xsl:with-param name="accid" select="m:scoreDef/@key.accid"/>
</xsl:call-template><xsl:choose>
<xsl:when test="m:scoreDef/@key.mode"><xsl:choose>
<xsl:when test="m:scoreDef/@key.mode='major'"> \major </xsl:when>
<xsl:when test="m:scoreDef/@key.mode='minor'"> \minor </xsl:when>
</xsl:choose>
</xsl:when>
<xsl:otherwise> \major </xsl:otherwise></xsl:choose>
</xsl:template>

<xsl:template name="get-lily-pitch">
  <xsl:param name="sig"   select="preceding::m:scoreDef[1]/@key.sig"/>
  <xsl:param name="accid" select="''"/>
  <xsl:param name="pname" select="'c'"/>

  <xsl:choose>
    <xsl:when test="$accid">
      <xsl:value-of 
	  select="$lily-pitch//key[@signature=$sig]/note[@pname=$pname]/name[@accid = $accid]"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of 
	  select="$lily-pitch//key[@signature=$sig]/note[@pname=$pname]/name[@accid = 'none']"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="get-clef">
  <xsl:param name="voicenumber" select="'1'"/>
  <xsl:choose>
    <xsl:when
	test="m:scoreDef/m:staffGrp/m:staffDef[@n=$voicenumber]/@clef.shape='G'">
      <xsl:text>
\clef "treble"</xsl:text>
    </xsl:when>
    <xsl:when
	test="m:scoreDef/m:staffGrp/m:staffDef[@n=$voicenumber]/@clef.shape='F'">
      <xsl:text>
\clef "bass"</xsl:text>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xsl:template name="start-repeat">
<xsl:choose>
<xsl:when test="contains($getitas,'mid')">
% s64
</xsl:when>
<xsl:otherwise>
% start repeat
\repeat volta 2 
{
% s64
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template name="restart-repeat">
<xsl:call-template name="end-repeat"/>
<xsl:call-template name="start-repeat"/>
</xsl:template>

<xsl:template name="end-repeat">
<xsl:choose>
<xsl:when test="contains($getitas,'mid')">
</xsl:when>
<xsl:otherwise>
}
% ending repeat
</xsl:otherwise>
</xsl:choose>
</xsl:template>


</xsl:transform>
