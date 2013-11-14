<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns="http://www.music-encoding.org/ns/mei"
	       xmlns:mei="http://www.music-encoding.org/ns/mei"
	       extension-element-prefixes="mei xsl"
	       version="1.0">


  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@right"/>

  <xsl:template match="@xml:id">
    <xsl:variable name="val" select="."/>
    <xsl:variable name="count"
		  select="count(parent::*/preceding-sibling::*[@xml:id=$val])"/>
    <xsl:attribute name="xml:id">
      <xsl:value-of select="concat(.,$count)"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@startid">
    <xsl:variable name="val" select="."/>
    <xsl:variable name="count"
		  select="count(parent::*/preceding-sibling::*[@startid=$val])"/>
    <xsl:attribute name="startid">
      <xsl:value-of select="concat(.,$count)"/>
    </xsl:attribute>
  </xsl:template>


  <xsl:template match="@endid">
    <xsl:variable name="val" select="."/>
    <xsl:variable name="count"
		  select="count(parent::*/preceding-sibling::*[@endid=$val])"/>
    <xsl:attribute name="endid">
      <xsl:value-of select="concat(.,$count)"/>
    </xsl:attribute>
  </xsl:template>


</xsl:transform>
