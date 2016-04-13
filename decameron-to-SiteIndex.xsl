<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <!--2016-04-13 ebb: I built up the personography data that Matt Burch was pulling into a TEI document, and pulled a set of listRelations, too, since there was a lot of detailed information on Decameron characters. We should show the listRelations in the output to Prof. Triplette to see if they look right, and we can experiment with plotting network graph(s) from it to help visualize some relationships. 
        WHAT NEEDS WORK: 
        Keep working on extracting place data: there are some useful standard place names in the attributes of ListPersonsPlaces.xml file that aren't being represented here that would help us to map the mappable locations.-->    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Site Index of Named Entities in Bocaccio's Decameron</title>
                    
                        <author>Obdurodon (Pittsburgh) Decameron Project Team</author>
                        <author>Newtfire (Greeensburg) Decameron Project Team</author>
                       
                    </titleStmt>
                    <publicationStmt>
                        <p>Born digital.</p>
                        <p>This is part of a digital edition repurposed by Jessica Milewski, Matthew Burch, Lauren
                            McGuigan, and Megan Mills of Pitt-Greensburg Digital Humanities class of Spring 2015
                            from <ref target="http://decameron.obdurodon.org">Women of Boccaccio’s
                                Decameron</ref> project, 2014, a project by Mia Bencivenga and Karla Lopez. 
                  </p><p>The conversion and repurposing is
                            licensed under a <ref
                                target="http://creativecommons.org/licenses/by-sa/4.0/deed.en_US">Creative Commons
                                Attribution-ShareAlike 4.0 International License</ref>.</p>
                        <p>Elisa Beshero-Bondar transformed an XML of the English text produced by Bencivenga
                            and Lopez into TEI P5, 15 March 2016.</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>data compiled by Oakland project team in 2014.</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
          <text><body> 
              <listPerson>
           <xsl:apply-templates select=".//listPerson" mode="personography"/>
                  <listRelation>
                      <xsl:apply-templates select=".//listPerson" mode="relationsList"/>
                  </listRelation>
       </listPerson>
              
            
    <listPlace type="imaginary">
        <xsl:apply-templates select=".//listPlace" mode="imaginaryPlace"/>
    </listPlace>
              
              <listPlace type="real">
                  <xsl:apply-templates select=".//listPlace" mode="realPlace"/>
              </listPlace>
              
          </body>
          </text>
            
        </TEI>
    </xsl:template>
    <xsl:template match="person" mode="personography">
        
            <person xml:id="{@id}">
                <persName>
                    <xsl:apply-templates select="text()"/>
                </persName>
                <xsl:if test="@brigata='yes'">
                    <state type="frameCharacter"/>
                </xsl:if>
                
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
            </person>
    </xsl:template>
    <xsl:template match="person" mode="relationsList">

      <xsl:for-each select="rel"> 
          <relation type="{@type}">
          <xsl:attribute name="mutual">
              <xsl:text>#</xsl:text>
              <xsl:value-of select="current()/parent::person/@id"/>
              <xsl:text> </xsl:text>
              <xsl:for-each select="tokenize(@whom, ' ')">
                  <xsl:text>#</xsl:text>
                  <xsl:value-of select="current()"/>
                  <xsl:text> </xsl:text>
              </xsl:for-each>
          </xsl:attribute>
          </relation>
      </xsl:for-each>
        
    </xsl:template>
 
<xsl:template match="place" mode="imaginaryPlace">
<xsl:if test="@imaginary"><place xml:id="{@id}">
    <placeName>
        <xsl:apply-templates select="text()"/>
    </placeName>
</place></xsl:if>
</xsl:template>
    <xsl:template match="place" mode="realPlace">
        <xsl:if test="not(@imaginary)"><place xml:id="{@id}">
            <placeName>
                <xsl:apply-templates select="text()"/>
            </placeName>
        </place></xsl:if>
    </xsl:template>
</xsl:stylesheet>