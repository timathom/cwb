<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:rdakit="http://metadataregistry.org/uri/profile/rdakit/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:reg="http://metadataregistry.org/uri/profile/regap/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:strip-space
        elements="*"/>

    <xsl:template
        match="/">
        <carrier>
            <xsl:apply-templates/>
        </carrier>
    </xsl:template>

    <xsl:template
        match="skos:prefLabel[@xml:lang eq 'en']">
        <type>
            <xsl:sequence
                select="data(.)"/>
        </type>
    </xsl:template>

    <xsl:template
        match="text()"/>

</xsl:stylesheet>
