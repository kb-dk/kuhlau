<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns="http://www.music-encoding.org/ns/mei"
	       xmlns:mei="http://www.music-encoding.org/ns/mei"
	       extension-element-prefixes="mei xsl"
	       version="1.0">

  <xsl:template match="mei:note[@pname='e']">
    <xsl:element name="note">
      <xsl:attribute name="accid">n</xsl:attribute>
      <xsl:apply-templates select="@*" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>


</xsl:transform>
