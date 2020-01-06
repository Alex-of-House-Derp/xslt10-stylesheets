<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:exsl="http://exslt.org/common"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns="http://docbook.org/ns/docbook"
  exclude-result-prefixes="exsl d xlink d"
  version="1.0">
  
<!-- NOTE: If a structure or module is filtered out due to a matching effectivity attribute, children of that structure or module cannot be filtered in using another effectivity attribute. -->

  <xsl:param name="effectivity.arch" />
  <xsl:param name="effectivity.audience" />
  <xsl:param name="effectivity.condition" />
  <xsl:param name="effectivity.conformance" />
  <xsl:param name="effectivity.os" />
  <xsl:param name="effectivity.outputformat" />
  <xsl:param name="effectivity.revision" />
  <xsl:param name="effectivity.security" />
  <xsl:param name="effectivity.userlevel" />
  <xsl:param name="effectivity.vendor" />
  <xsl:param name="effectivity.wordsize" />

  <xsl:template match="d:module[@resourceref] | d:structure[@resourceref]" mode="evaluate.effectivity">
    <xsl:apply-templates mode="evaluate.effectivity" />
  </xsl:template>
  
  <xsl:template match="d:filterout" mode="evaluate.effectivity">
    <xsl:variable name="effectivity.match.arch">
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="effectivity.arch" />
        <xsl:with-param name="b" select="@arch" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="effectivity.match.audience" select="@audience" />
    <xsl:variable name="effectivity.match.condition" select="@condition" />
    <xsl:variable name="effectivity.match.conformance" select="@conformance" />
    <xsl:variable name="effectivity.match.os" select="@os" />
    <xsl:variable name="effectivity.match.outputformat" select="@outputformat" />
    <xsl:variable name="effectivity.match.revision" select="@revision" />
    <xsl:variable name="effectivity.match.security" select="@security" />
    <xsl:variable name="effectivity.match.userlevel" select="@userlevel" />
    <xsl:variable name="effectivity.match.vendor" select="@vendor" />
    <xsl:variable name="effectivity.match.wordsize" select="@wordsize" />

    <xsl:choose>
      <!-- <xsl:when test="$effectivity.attribute.arch = $effectivity.arch"> -->
      <xsl:when test="effectivity.match.arch != ''">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the arch attribute value is set to <xsl:value-of select="$effectivity.attribute.arch" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.audience = $effectivity.audience">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the audience attribute value is set to <xsl:value-of select="$effectivity.attribute.audience" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.condition = $effectivity.condition">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the condition attribute value is set to <xsl:value-of select="$effectivity.attribute.condition" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.conformance = $effectivity.conformance">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the conformance attribute value is set to <xsl:value-of select="$effectivity.attribute.conformance" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.os = $effectivity.os">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the os attribute value is set to <xsl:value-of select="$effectivity.attribute.os" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.outputformat = $effectivity.outputformat">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the outputformat attribute value is set to <xsl:value-of select="$effectivity.attribute.outputformat" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.revision = $effectivity.revision">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the revision attribute value is set to <xsl:value-of select="$effectivity.attribute.revision" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.security = $effectivity.security">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the security attribute value is set to <xsl:value-of select="$effectivity.attribute.security" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.userlevel = $effectivity.userlevel">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the userlevel attribute value is set to <xsl:value-of select="$effectivity.attribute.userlevel" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.vendor = $effectivity.vendor">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the vendor attribute value is set to <xsl:value-of select="$effectivity.attribute.vendor" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.wordsize = $effectivity.wordsize">
        <xsl:text>exclude</xsl:text>
        <!--
        <xsl:message>INFO: filtering out a module or structure because the wordsize attribute value is set to <xsl:value-of select="$effectivity.attribute.wordsize" />.</xsl:message> -->
      </xsl:when>
      <xsl:otherwise>
        <!-- <xsl:message>INFO: no filterout attributes matched.</xsl:message> -->
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>
  
  <!-- filterin logic -->
  <xsl:template match="d:filterin" mode="evaluate.effectivity">

    <xsl:variable name="effectivity.attribute.arch" select="@arch" />
    <xsl:variable name="effectivity.attribute.audience" select="@audience" />
    <xsl:variable name="effectivity.attribute.condition" select="@condition" />
    <xsl:variable name="effectivity.attribute.conformance" select="@conformance" />
    <xsl:variable name="effectivity.attribute.os" select="@os" />
    <xsl:variable name="effectivity.attribute.outputformat" select="@outputformat" />
    <xsl:variable name="effectivity.attribute.revision" select="@revision" />
    <xsl:variable name="effectivity.attribute.security" select="@security" />
    <xsl:variable name="effectivity.attribute.userlevel" select="@userlevel" />
    <xsl:variable name="effectivity.attribute.vendor" select="@vendor" />
    <xsl:variable name="effectivity.attribute.wordsize" select="@wordsize" />

    <xsl:choose>
      <xsl:when test="$effectivity.attribute.arch = $effectivity.arch">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the arch attribute value is set to <xsl:value-of select="$effectivity.attribute.arch" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.audience = $effectivity.audience">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the audience attribute value is set to <xsl:value-of select="$effectivity.attribute.audience" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.condition = $effectivity.condition">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the condition attribute value is set to <xsl:value-of select="$effectivity.attribute.condition" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.conformance = $effectivity.conformance">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the conformance attribute value is set to <xsl:value-of select="$effectivity.attribute.conformance" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.os = $effectivity.os">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the os attribute value is set to <xsl:value-of select="$effectivity.attribute.os" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.outputformat = $effectivity.outputformat">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the outputformat attribute value is set to <xsl:value-of select="$effectivity.attribute.outputformat" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.revision = $effectivity.revision">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the revision attribute value is set to <xsl:value-of select="$effectivity.attribute.revision" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.security = $effectivity.security">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the security attribute value is set to <xsl:value-of select="$effectivity.attribute.security" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.userlevel = $effectivity.userlevel">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the userlevel attribute value is set to <xsl:value-of select="$effectivity.attribute.userlevel" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.vendor = $effectivity.vendor">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the vendor attribute value is set to <xsl:value-of select="$effectivity.attribute.vendor" />.</xsl:message> -->
      </xsl:when>
      <xsl:when test="$effectivity.attribute.wordsize = $effectivity.wordsize">
        <xsl:text>include</xsl:text>
        <!--
        <xsl:message>INFO: including a module or structure because the wordsize attribute value is set to <xsl:value-of select="$effectivity.attribute.wordsize" />.</xsl:message> -->
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>exclude</xsl:text>
        <!-- <xsl:message>INFO: No modules or structures matched attributes for inclusion.</xsl:message> -->
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

</xsl:stylesheet>
