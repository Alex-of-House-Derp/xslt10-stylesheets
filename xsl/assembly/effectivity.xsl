<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:exsl="http://exslt.org/common"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns="http://docbook.org/ns/docbook"
  exclude-result-prefixes="exsl d xlink d"
  version="1.0">

<xsl:include href="../profiling/profile-mode.xsl"/>
<xsl:include href="../common/addns.xsl"/>
  
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
  <xsl:param name="effectivity.separator" />

  <xsl:param name="profile.arch" select="$effectivity.arch"/>
  <xsl:param name="profile.audience" select="$effectivity.audience"/>
  <xsl:param name="profile.condition" select="$effectivity.condition" />
  <xsl:param name="profile.conformance" select="$effectivity.conformance"/>
  <xsl:param name="profile.os" select="$effectivity.os"/>
  <xsl:param name="profile.outputformat" select="$effectivity.outputformat"/>
  <xsl:param name="profile.revision" select="$effectivity.revision"/>
  <xsl:param name="profile.security" select="$effectivity.security"/>
  <xsl:param name="profile.userlevel" select="$effectivity.userlevel"/>
  <xsl:param name="profile.vendor" select="$effectivity.vendor"/>
  <xsl:param name="profile.wordsize" select="$effectivity.wordsize"/>
  <xsl:param name="profile.lang"/>
  <xsl:param name="profile.revisionflag"/>
  <xsl:param name="profile.role"/>
  <xsl:param name="profile.status"/>
  <xsl:param name="profile.attribute"/>
  <xsl:param name="profile.value"/>
  <xsl:param name="profile.separator" select="$effectivity.separator" />



  <xsl:template match="d:module[@resourceref] | d:structure[@resourceref]" mode="evaluate.effectivity">
    <xsl:apply-templates mode="evaluate.effectivity" />
  </xsl:template>
  
  <xsl:template match="d:filterout" mode="evaluate.effectivity">
    <xsl:message>INFO: I'm inside the filterout template!</xsl:message>
    
    <xsl:variable name="effectivity.match.arch">
      <xsl:message>INFO: The value of effectivity.arch as passed in is <xsl:value-of select="$effectivity.arch" /> ... </xsl:message>
      <xsl:message>INFO: The value of @arch as read from the XML file is <xsl:value-of select="@arch" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.arch" />
        <xsl:with-param name="b" select="@arch" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:message>INFO: The value of effectivity.match.arch is <xsl:value-of select="$effectivity.match.arch"/> ... </xsl:message>

    <xsl:variable name="effectivity.match.audience">
      <xsl:message>INFO: The value of effectivity.audience as passed in is <xsl:value-of select="$effectivity.audience" /> ... </xsl:message>
      <xsl:message>INFO: The value of @audience as read from the XML file is <xsl:value-of select="@audience" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.audience" />
        <xsl:with-param name="b" select="@audience" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.condition">
      <xsl:message>INFO: The value of effectivity.condition as passed in is <xsl:value-of select="$effectivity.condition" /> ... </xsl:message>
      <xsl:message>INFO: The value of @condition as read from the XML file is <xsl:value-of select="@condition" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.condition" />
        <xsl:with-param name="b" select="@condition" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.conformance">
      <xsl:message>INFO: The value of effectivity.conformance as passed in is <xsl:value-of select="$effectivity.conformance" /> ... </xsl:message>
      <xsl:message>INFO: The value of @conformance as read from the XML file is <xsl:value-of select="@conformance" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.conformance" />
        <xsl:with-param name="b" select="@conformance" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.os">
      <xsl:message>INFO: The value of effectivity.os as passed in is <xsl:value-of select="$effectivity.os" /> ... </xsl:message>
      <xsl:message>INFO: The value of @os as read from the XML file is <xsl:value-of select="@os" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.os" />
        <xsl:with-param name="b" select="@os" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.outputformat">
      <xsl:message>INFO: The value of effectivity.outputformat as passed in is <xsl:value-of select="$effectivity.outputformat" /> ... </xsl:message>
      <xsl:message>INFO: The value of @outputformat as read from the XML file is <xsl:value-of select="@outputformat" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.outputformat" />
        <xsl:with-param name="b" select="@outputformat" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.revision">
      <xsl:message>INFO: The value of effectivity.revision as passed in is <xsl:value-of select="$effectivity.revision" /> ... </xsl:message>
      <xsl:message>INFO: The value of @revision as read from the XML file is <xsl:value-of select="@revision" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.revision" />
        <xsl:with-param name="b" select="@revision" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.security">
      <xsl:message>INFO: The value of effectivity.security as passed in is <xsl:value-of select="$effectivity.security" /> ... </xsl:message>
      <xsl:message>INFO: The value of @security as read from the XML file is <xsl:value-of select="@security" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.security" />
        <xsl:with-param name="b" select="@security" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.userlevel">
      <xsl:message>INFO: The value of effectivity.userlevel as passed in is <xsl:value-of select="$effectivity.userlevel" /> ... </xsl:message>
      <xsl:message>INFO: The value of @userlevel as read from the XML file is <xsl:value-of select="@userlevel" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.userlevel" />
        <xsl:with-param name="b" select="@userlevel" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.vendor">
      <xsl:message>INFO: The value of effectivity.vendor as passed in is <xsl:value-of select="$effectivity.vendor" /> ... </xsl:message>
      <xsl:message>INFO: The value of @vendor as read from the XML file is <xsl:value-of select="@vendor" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.vendor" />
        <xsl:with-param name="b" select="@vendor" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.wordsize">
      <xsl:message>INFO: The value of effectivity.wordsize as passed in is <xsl:value-of select="$effectivity.wordsize" /> ... </xsl:message>
      <xsl:message>INFO: The value of @wordize as read from the XML file is <xsl:value-of select="@wordsize" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.wordsize" />
        <xsl:with-param name="b" select="@wordsize" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:choose>
      <!-- <xsl:when test="$effectivity.attribute.arch = $effectivity.arch"> -->
      <!-- <xsl:when test="effectivity.match.arch != '' "> -->
      <xsl:when test="$effectivity.match.arch != ''">
        <xsl:text>exclude</xsl:text>        
        <xsl:message>INFO: filtering out a module or structure because the arch attribute value is set to <xsl:value-of select="$effectivity.match.arch" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.audience != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the audience attribute value is set to <xsl:value-of select="$effectivity.match.audience" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.condition != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the condition attribute value is set to <xsl:value-of select="$effectivity.match.condition" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.conformance != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the conformance attribute value is set to <xsl:value-of select="$effectivity.match.conformance" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.os != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the os attribute value is set to <xsl:value-of select="$effectivity.match.os" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.outputformat != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the outputformat attribute value is set to <xsl:value-of select="$effectivity.match.outputformat" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.revision != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the revision attribute value is set to <xsl:value-of select="$effectivity.match.revision" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.security != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the security attribute value is set to <xsl:value-of select="$effectivity.match.security" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.userlevel != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the userlevel attribute value is set to <xsl:value-of select="$effectivity.match.userlevel" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.vendor != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the vendor attribute value is set to <xsl:value-of select="$effectivity.match.vendor" />.</xsl:message>
      </xsl:when>

      <xsl:when test="$effectivity.match.wordsize != ''">
        <xsl:text>exclude</xsl:text>
        <xsl:message>INFO: filtering out a module or structure because the wordsize attribute value is set to <xsl:value-of select="$effectivity.attribute.wordsize" />.</xsl:message>
      </xsl:when>
      
      <xsl:otherwise>
        <xsl:message>INFO: no filterout attributes matched.</xsl:message>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>
  
  <!-- filterin logic -->
  <xsl:template match="d:filterin" mode="evaluate.effectivity">
    <xsl:message>INFO: I'm inside the filterout template!</xsl:message>

    <xsl:variable name="effectivity.match.arch">
      <xsl:message>INFO (filterin): The value of effectivity.arch as passed in is <xsl:value-of select="$effectivity.arch" /> ... </xsl:message>
      <xsl:message>INFO (filterin): The value of @arch as read from the XML file is <xsl:value-of select="@arch" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.arch" />
        <xsl:with-param name="b" select="@arch" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="effectivity.attribute.audience" select="@audience" />
    <xsl:variable name="effectivity.attribute.condition" select="@condition" />
    <xsl:variable name="effectivity.attribute.conformance" select="@conformance" />
    <xsl:variable name="effectivity.attribute.os" select="@os" />

    <xsl:variable name="effectivity.attribute.outputformat">
      <xsl:message>INFO (filterin): The value of effectivity.outputformat as passed in is <xsl:value-of select="$effectivity.outputformat" /> ... </xsl:message>
      <xsl:message>INFO (filterin): The value of @outputformat as read from the XML file is <xsl:value-of select="@outputformat" /> ... </xsl:message>
      <xsl:call-template name="cross.compare">
        <xsl:with-param name="a" select="$effectivity.outputformat" />
        <xsl:with-param name="b" select="@outputformat" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="effectivity.attribute.revision" select="@revision" />
    <xsl:variable name="effectivity.attribute.security" select="@security" />
    <xsl:variable name="effectivity.attribute.userlevel" select="@userlevel" />
    <xsl:variable name="effectivity.attribute.vendor" select="@vendor" />
    <xsl:variable name="effectivity.attribute.wordsize" select="@wordsize" />

    <xsl:choose>
      <xsl:when test="$effectivity.match.arch != ''">
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


  <!-- Returns non-empty string if list in $b contains one ore more values from list $a --> 
 <!-- Commenting out the copied cross.compare template 
<xsl:template name="cross.compare">

  <xsl:param name="a"/>
  <xsl:param name="b"/>
  <xsl:param name="sep" select="$profile.separator"/>
  <xsl:variable name="head" select="substring-before(concat($a, $sep), $sep)"/>
  <xsl:variable name="tail" select="substring-after($a, $sep)"/> 
-->
<!-- <xsl:message> -->
<!-- a="<xsl:value-of select="$a"/>" -->
<!-- a="<xsl:value-of select="normalize-space($a)"/>" -->
<!-- head="<xsl:value-of select="$head"/>" -->
<!-- tail="<xsl:value-of select="$tail"/>" -->
<!-- </xsl:message> -->
<!--
  <xsl:message>INFO: My profile separator character is <xsl:value-of select="$profile.separator"/> ...</xsl:message>
  <xsl:if test="contains(concat($sep, $b, $sep), concat($sep, $head, $sep)) or normalize-space($a) = '' ">1</xsl:if>
  <xsl:if test="$tail">
    <xsl:call-template name="cross.compare">
      <xsl:with-param name="a" select="$tail"/>
      <xsl:with-param name="b" select="$b"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template> -->

</xsl:stylesheet>
