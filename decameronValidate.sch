<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>   
 
    <pattern>
        <rule context="tei:TEI//@ref">
            <assert test="starts-with(., '#')">
                The @ref must begin with a hashtag.
            </assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <rule context="tei:TEI//@xml:id">
            <report test="matches(., '\s+')">
                @xml:id values may NOT contain white spaces!
            </report>        
        </rule>
    </pattern>
    
   
   
        <let name="si" value="doc('decameronSi.xml')//@xml:id"/>
    <let name="siFile" value="doc('decameronSi.xml')"/>
    <!--2016-04-13: Change this if we post it the Decameron SI XML on the project newtfire website.-->
    
    
        <pattern>
           <rule
                context="@ref">
               <let name="tokens" value="for $i in tokenize(., '\s+') return substring-after($i,'#')"/>
               <assert test="every $token in $tokens satisfies $token = $si">The attribute (after the hashtag, #) must match a defined @xml:id in the Site Index file!</assert>
                
            </rule>
    </pattern>
     
        <pattern>   
            <rule context="tei:TEI//tei:persName/@ref">
                <let name="tokens" value="for $i in tokenize(., '\s+') return substring-after($i,'#')"/>
                <assert test="every $token in $tokens satisfies $token = $siFile//tei:text//tei:listPerson//@xml:id">
                    <!--<assert test="substring-after(., '#') = $siFile//tei:text//tei:listPerson//@xml:id | $siFile//tei:text//tei:listOrg//@xml:id">-->
                    The @ref or @who on People / Characters must match an appropriate xml:id on our site index's lists of persons, fictional characters or mythical entities.
                </assert>
            </rule> 
             
            
            <rule context="tei:TEI//tei:placeName/@ref | tei:TEI//tei:rs[@type='place']/@ref">
                <let name="tokens" value="for $i in tokenize(., '\s+') return substring-after($i,'#')"/>
                <assert test="every $token in $tokens satisfies $token = $siFile//tei:text//tei:listPlace//@xml:id">
                    The @ref on Places (placeName and rs[@type="place"] must match an appropriate xml:id on our site index's lists of places.
                </assert> 
            </rule>
       
    </pattern>
    
    
</schema>