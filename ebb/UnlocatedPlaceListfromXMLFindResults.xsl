<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.oxygenxml.com/ns/report"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text" encoding="utf-8"/> 
   <!--2016-04-15 ebb: This stylesheet can be adapted for use when you save search results from an oXygen Find & Replace in XML format, and
   you want to output the results as plain text. I wrote this for the Decameron project when we needed to remove 
   some unlocated places from a CSV list we'd pulled. I wrote a Find to find them all quickly, but then realized we might want to store all 
   those hits in a separate CSV file to see if we could look them up later.--> 
    
    <xsl:template match="/">
        <xsl:apply-templates select="//description"/>
    </xsl:template>
    
    <xsl:template match="description">
<xsl:apply-templates/><xsl:text>&#10;</xsl:text>
<!--ebb: linefeed (or hard return) character-->        
        
    </xsl:template>
    
</xsl:stylesheet>