<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
<!--    
<xsl:mode on-no-match="shallow-copy"/>-->
    
    <!--2016-04-13 ebb: This isn't working (sigh). -->
    
    <xsl:variable name="SI" select="doc('decameronSi.xml')"/>
    
    <xsl:variable name="SINamesList">
        <xsl:value-of select="string-join($SI//persName, '|')"/>
    </xsl:variable>
    
<xsl:template match="/">
        <xsl:value-of select="$SINamesList"/>
    </xsl:template>
    
    
<!--<xsl:template match="body//text()[not(parent::persName)]">
    <xsl:analyze-string select="." regex="$SINamesList">
      <xsl:matching-substring>
           <persName><xsl:value-of select="."/></persName>
        </xsl:matching-substring>
        <xsl:non-matching-substring>
            <xsl:value-of select="."/>
        </xsl:non-matching-substring>
        
    </xsl:analyze-string>
</xsl:template>-->

</xsl:stylesheet>
    
