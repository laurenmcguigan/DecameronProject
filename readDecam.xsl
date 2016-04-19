<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
            <head><title>Decameron</title></head>
            <body>
                
                <h1>The Decameron</h1>
                <h2>Table of Contents</h2>
                <ul>
                    <xsl:apply-templates select="//div[@type='Day']/head" mode="toc"/>
                </ul>
                <hr/>
                
                <div id="main">
                    <xsl:apply-templates select="//text"/>
                    
                </div>
                
            </body>
            
        </html>
        
    </xsl:template>
    
    <xsl:template match="text">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="p">
        <p n="{count(preceding::p) + 1}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="div[@type='Day']//head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="div[@type='Day']//head" mode="toc">
        <li style="font-size:20pt"> 
            <a href="#">
                <xsl:apply-templates/>
            </a>
        </li> <br/>
    </xsl:template>
    
    <xsl:template match="div[@type='Day']/head">
        <h1 id="">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    <xsl:template match="div[@type='novella']//head">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    <xsl:template match="div[@type='introduction']//head">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    
</xsl:stylesheet>