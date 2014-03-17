<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:m="http://www.music-encoding.org/ns/mei"
	       version="1.0">

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="m:app">
    <xsl:apply-templates select="(m:lem|m:rdg)[1]"/>
  </xsl:template>

  <xsl:template match="m:lem">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="m:rdg">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:transform>
