<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="person">
            <persName xml:id="{@id}" >
                <surname>
                    <xsl:apply-templates select="text()"/>
                </surname>
                
                <sex>
                    <xsl:apply-templates select="@sex"/>
                </sex>
                
                <age>
                    <xsl:apply-templates select="@age"/>
                </age>
                
                <occupation>
                    <xsl:apply-templates select="@role"/>
                </occupation>
                
                <birth>
                    <xsl:apply-templates select="@origin"/>
                </birth>
                
                <faith>
                    <xsl:apply-templates select="@religion"/>
                </faith>
                
                <socecStatus>
                    <xsl:apply-templates select="@estate"/>
                </socecStatus>
            </persName>
    </xsl:template>
<xsl:template match="place">
<place xml:id="@id">
    <placeName>
        <xsl:apply-templates select="text()"></xsl:apply-templates>
    </placeName>
</place>
</xsl:template>
</xsl:stylesheet>