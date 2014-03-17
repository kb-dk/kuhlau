<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns="http://www.music-encoding.org/ns/mei"
	       xmlns:mei="http://www.music-encoding.org/ns/mei"
	       extension-element-prefixes="mei xsl"
	       version="1.0">

  <xsl:key name="oct0" 
	   match="mei:staff" 
	   use="generate-id(descendant::mei:note[@pname='e' and @oct='0'])" />

  <xsl:key name="oct1" 
	   match="mei:staff" 
	   use="generate-id(descendant::mei:note[@pname='e' and @oct='1'])" />

  <xsl:key name="oct2" 
	   match="mei:staff" 
	   use="generate-id(descendant::mei:note[@pname='e' and @oct='2'])" />

  <xsl:key name="oct3" 
	   match="mei:staff" 
	   use="generate-id(descendant::mei:note[@pname='e' and @oct='3'])" />

  <xsl:key name="oct4" 
	   match="mei:staff" 
	   use="generate-id(descendant::mei:note[@pname='e' and @oct='4'])" />

  <xsl:key name="oct5" 
	   match="mei:staff" 
	   use="generate-id(descendant::mei:note[@pname='e' and @oct='5'])" />

  <xsl:key name="oct6" 
	   match="mei:staff" 
	   use="generate-id(descendant::mei:note[@pname='e' and @oct='6'])" />

  <xsl:key name="oct7" 
	   match="mei:staff" 
	   use="generate-id(descendant::mei:note[@pname='e' and @oct='7'])" />

  <xsl:template match="mei:note[@pname='e']">
    <xsl:element name="note">
      <xsl:if test="key('oct0',generate-id(.))|key('oct1',generate-id(.))|key('oct2',generate-id(.))|key('oct3',generate-id(.))|key('oct4',generate-id(.))|key('oct5',generate-id(.))|key('oct6',generate-id(.))|key('oct7',generate-id(.))">
	<xsl:attribute name="accid">n</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="@*" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


</xsl:transform>
