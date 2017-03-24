<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    exclude-result-prefixes="xs uuid xi ev madsrdf relators dcterms m21rdf00X cwb owl bf rdf rdfs xf skos"
    version="2.0"
    xmlns:bf="http://bibframe.org/vocab/"
    xmlns:cwb="http://libserv6.princeton.edu/cwb/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:ev="http://www.w3.org/2001/xml-events"
    xmlns:m21rdf00X="http://marc21rdf.info/elements/00X/"
    xmlns:madsrdf="http://www.loc.gov/mads/rdf/v1#"
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:relators="http://id.loc.gov/vocabulary/relators/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:uuid="java.util.UUID"
    xmlns:xf="http://www.w3.org/2002/xforms"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output
        indent="yes"/>
    <xsl:preserve-space
        elements="*"/>

    <xsl:param
        name="cutterTable">
        <cutter>
            <part2
                consonants="b, c, d, f, g, h, j, k, l, m, n, p, q, r, t, v, w, x, y, z">
                <letters
                    num="3">a, b, c, d</letters>
                <letters
                    num="4">e, f, g, h</letters>
                <letters
                    num="5">i, j, k, l, m, n</letters>
                <letters
                    num="6">o, p, q</letters>
                <letters
                    num="7">r, s, t</letters>
                <letters
                    num="8">u, v, w, x</letters>
                <letters
                    num="9">y, z</letters>
            </part2>
            <part2
                digraph="qu">
                <letters
                    num="3">a, b, c, d</letters>
                <letters
                    num="4">e, f, g, h</letters>
                <letters
                    num="5">i, j, k, l, m, n</letters>
                <letters
                    num="6">o, p, q</letters>
                <letters
                    num="7">r, s, t</letters>
                <letters
                    num="8">u, v, w, x</letters>
                <letters
                    num="9">y, z</letters>
            </part2>
            <part2
                consonants="s">
                <letters
                    num="2">a, b, ca, cb, cc, cd, ce, cf, cg</letters>
                <letters
                    num="3">ch, ci, cj, ck, cl, cm, cn, co, cp, cq, cr, cs, ct, cu, cv, cw, cx, cy, cz, d</letters>
                <letters
                    num="4">e, f, g</letters>
                <letters
                    num="5">h, i, j, k, l</letters>
                <letters
                    num="6">m, n, o, p</letters>
                <letters
                    num="7">r, s</letters>
                <letters
                    num="8">t</letters>
                <letters
                    num="9">u, v, w, x, y, z</letters>
            </part2>
            <part2
                vowels="a, e, i, o, u">
                <letters
                    num="2">a, b, c</letters>
                <letters
                    num="3">d, e, f, g, h, i, j, k</letters>
                <letters
                    num="4">l, m</letters>
                <letters
                    num="5">n, o</letters>
                <letters
                    num="6">p, q</letters>
                <letters
                    num="7">r</letters>
                <letters
                    num="8">s, t</letters>
                <letters
                    num="9">u, v, w, x, y, z</letters>
            </part2>
            <part3>
                <letters
                    num="2">a, b, c, d</letters>
                <letters
                    num="3">e, f, g, h</letters>
                <letters
                    num="4">i, j, k, l</letters>
                <letters
                    num="5">m</letters>
                <letters
                    num="6">n, o, p, q</letters>
                <letters
                    num="7">r, s, t</letters>
                <letters
                    num="8">u, v, w</letters>
                <letters
                    num="9">x, y, z</letters>
            </part3>
        </cutter>
    </xsl:param>

    <xsl:template
        match="/">

        <marc:collection
            xmlns:marc="http://www.loc.gov/MARC21/slim"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">

            <marc:record
                type="Bibliographic">
                <marc:leader>
                    <xsl:sequence
                        select="cwb:build-leader(rdf:RDF)"/>
                    <!--<xsl:sequence select="uuid:randomUUID()">
                        <!-\- for $c in /*, $p in //*/position() return sum(string-to-codepoints($c)) -\->
                        <!-\- ((xs:dateTime(current-date()) - xs:dateTime('1970-01-01T00:00:00')) div xs:dayTimeDuration('PT1S')) -\->                      
                    </xsl:sequence>-->
                </marc:leader>
                <marc:controlfield
                    tag="001"/>
                <marc:controlfield
                    tag="005">
                    <xsl:sequence
                        select="
                            if (rdf:RDF/bf:Annotation[1]/bf:changeDate[normalize-space(.)]) then
                                cwb:format-date(rdf:RDF/bf:Annotation[1]/bf:changeDate)
                            else
                                cwb:format-date(rdf:RDF/bf:Annotation[1]/bf:creationDate)"/>
                </marc:controlfield>
                <marc:controlfield
                    tag="008">
                    <xsl:sequence
                        select="cwb:build-008(rdf:RDF)"/>
                </marc:controlfield>
                <marc:datafield
                    ind1=" "
                    ind2=" "
                    tag="040">
                    <marc:subfield
                        code="a">NjP</marc:subfield>
                    <marc:subfield
                        code="b">eng</marc:subfield>
                    <marc:subfield
                        code="e">rda</marc:subfield>
                    <marc:subfield
                        code="d">NjP</marc:subfield>
                </marc:datafield>
                <xsl:if
                    test="rdf:RDF/bf:Work/bf:subject[@rdf:resource[normalize-space(.)]]">
                    <marc:datafield
                        ind1=" "
                        ind2=" "
                        tag="043">
                        <marc:subfield
                            code="a">
                            <xsl:value-of
                                select="concat(cwb:parse-uri(rdf:RDF/bf:Work/bf:subject/@rdf:resource), '---')"/>
                        </marc:subfield>
                    </marc:datafield>
                </xsl:if>
                <xsl:if
                    test="rdf:RDF/bf:Work/bf:classificationLcc[@rdf:resource[normalize-space(.)]]">
                    <marc:datafield
                        ind1=" "
                        ind2="4"
                        tag="050">
                        <marc:subfield
                            code="a">
                            <xsl:value-of
                                select="cwb:parse-uri(rdf:RDF/bf:Work/bf:classificationLcc/@rdf:resource)"/>
                        </marc:subfield>
                        <marc:subfield
                            code="b">
                            <xsl:variable
                                as="xs:string"
                                name="cutter1"
                                select="substring(rdf:RDF/bf:Work/bf:workTitle/bf:Title/bf:titleValue, 1, 1)"/>
                            <xsl:variable
                                as="xs:string"
                                name="cutter2"
                                select="substring(rdf:RDF/bf:Work/bf:workTitle/bf:Title/bf:titleValue, 2, 1)"/>
                            <xsl:variable
                                as="xs:string"
                                name="cutter3"
                                select="substring(rdf:RDF/bf:Work/bf:workTitle/bf:Title/bf:titleValue, 3, 1)"/>
                            <xsl:variable
                                name="cutterS"
                                select="
                                    if (lower-case($cutter1) eq 's' and lower-case($cutter2) eq 'c') then
                                        lower-case(concat($cutter2, $cutter3))
                                    else
                                        ()"/>
                            <xsl:value-of
                                select="concat('.', $cutter1)"/>
                            <xsl:for-each
                                select="$cutterTable/*/part2">
                                <xsl:choose>
                                    <xsl:when
                                        test="lower-case($cutter1) = 's'">
                                        <xsl:variable
                                            name="cutterS"
                                            select="
                                                if (lower-case($cutter2) eq 'c') then
                                                    lower-case(concat($cutter2, $cutter3))
                                                else
                                                    $cutter2"/>

                                        <xsl:value-of
                                            select="letters[tokenize(., ', ') = lower-case($cutterS)]/@num"/>

                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if
                                            test="lower-case($cutter1) = tokenize(@*, ', ')">
                                            <xsl:value-of
                                                select="letters[tokenize(., ', ') = lower-case($cutter2)]/@num"/>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>

                            </xsl:for-each>
                            <!--    <xsl:for-each select="$cutterTable/*/part3/letters"></xsl:for-each>-->
                            <xsl:sequence
                                select="
                                    for $c in $cutterTable/*/part3/letters
                                    return
                                        if (tokenize($c, ', ') = lower-case($cutter3)) then
                                            data($c/@num)
                                        else
                                            ()"/>
                        </marc:subfield>
                    </marc:datafield>
                </xsl:if>

                <marc:datafield
                    ind1="0"
                    tag="245">
                    <xsl:attribute
                        name="ind2">
                        <xsl:sequence
                            select="
                                if ($instanceTitle gt $workTitle) then
                                    $instanceTitle - $workTitle
                                else
                                    0"/>
                    </xsl:attribute>
                    <marc:subfield
                        code="a">
                        <xsl:value-of
                            select="rdf:RDF/bf:Instance/bf:instanceTitle/bf:Title/bf:titleValue"/>
                        <xsl:choose>
                            <xsl:when
                                test="rdf:RDF/bf:Instance/bf:instanceTitle/bf:Title/bf:subtitle[normalize-space(.)]">
                                <xsl:value-of
                                    select="' :'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>.</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </marc:subfield>
                    <xsl:if
                        test="rdf:RDF/bf:Instance/bf:instanceTitle/bf:Title/bf:subtitle[normalize-space(.)]">
                        <marc:subfield
                            code="b">
                            <xsl:value-of
                                select="rdf:RDF/bf:Instance/bf:instanceTitle/bf:Title/bf:subtitle"/>
                            <xsl:text>.</xsl:text>
                        </marc:subfield>
                    </xsl:if>
                </marc:datafield>

                <marc:datafield
                    ind1=" "
                    ind2="1"
                    tag="264">
                    <marc:subfield
                        code="a">
                        <xsl:value-of
                            select="key('entityKey', rdf:RDF/bf:Instance/bf:publication/bf:Provider/bf:providerPlace/@rdf:resource)/bf:label"/>
                        <xsl:value-of
                            select="' :'"/>
                    </marc:subfield>
                    <marc:subfield
                        code="b">
                        <xsl:value-of
                            select="key('entityKey', rdf:RDF/bf:Instance/bf:publication/bf:Provider/bf:providerName/@rdf:resource)/bf:label"/>
                        <xsl:text>,</xsl:text>
                    </marc:subfield>
                    <marc:subfield
                        code="c">
                        <xsl:sequence
                            select="
                                concat(if (contains(rdf:RDF/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00807-10, 'u')) then
                                    concat('[',
                                    rdf:RDF/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00807-10, '?')
                                else
                                    concat('[', rdf:RDF/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00807-10), if (rdf:RDF/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00811-14 eq '9999') then
                                    ']-'
                                else
                                    if (contains(rdf:RDF/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00811-14, 'u')) then
                                        ']-'
                                    else
                                        if (rdf:RDF/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00811-14[normalize-space(.)]) then
                                            concat('-', rdf:RDF/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00811-14, ']')
                                        else
                                            ())"/>
                    </marc:subfield>
                </marc:datafield>

                <marc:datafield
                    ind1=" "
                    ind2=" "
                    tag="300">
                    <marc:subfield
                        code="a">
                        <xsl:text>volumes</xsl:text>
                        <xsl:choose>
                            <xsl:when
                                test="rdf:RDF/bf:Instance/bf:illustrationNote[normalize-space(.)]">
                                <xsl:value-of
                                    select="' :'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                    select="' ;'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </marc:subfield>
                    <xsl:if
                        test="rdf:RDF/bf:Instance/bf:illustrationNote[normalize-space(.)]">
                        <marc:subfield
                            code="b">
                            <xsl:value-of
                                select="rdf:RDF/bf:Instance/bf:illustrationNote"/>
                            <xsl:value-of
                                select="' ;'"/>
                        </marc:subfield>
                    </xsl:if>
                    <marc:subfield
                        code="c">
                        <xsl:value-of
                            select="
                                if (contains(rdf:RDF/bf:Instance/bf:dimensions, 'cm')) then
                                    rdf:RDF/bf:Instance/bf:dimensions
                                else
                                    concat(rdf:RDF/bf:Instance/bf:dimensions, ' cm')"/>
                    </marc:subfield>
                </marc:datafield>

                <xsl:if
                    test="rdf:RDF/bf:Instance/m21rdf00X:M008CR18[cwb:parse-uri(@rdf:resource) ne 'u']">
                    <marc:datafield
                        ind1=" "
                        ind2=" "
                        tag="310">
                        <marc:subfield
                            code="a">
                            <xsl:variable
                                name="freq"
                                select="document('http://metadataregistry.org/vocabulary/show/id/214.rdf')/*/skos:Concept[@rdf:about eq current()/rdf:RDF/bf:Instance/m21rdf00X:M008CR18/@rdf:resource]/skos:prefLabel"/>
                            <xsl:value-of
                                select="concat(upper-case(substring($freq, 1, 1)), substring($freq, 2))"/>
                        </marc:subfield>
                    </marc:datafield>
                </xsl:if>

                <marc:datafield
                    ind1=" "
                    ind2=" "
                    tag="336">
                    <marc:subfield
                        code="a">text</marc:subfield>
                    <marc:subfield
                        code="b">txt</marc:subfield>
                    <marc:subfield
                        code="2">rdacontent</marc:subfield>
                </marc:datafield>

                <marc:datafield
                    ind1=" "
                    ind2=" "
                    tag="337">
                    <marc:subfield
                        code="a">unmediated</marc:subfield>
                    <marc:subfield
                        code="b">n</marc:subfield>
                    <marc:subfield
                        code="2">rdamedia</marc:subfield>
                </marc:datafield>

                <marc:datafield
                    ind1=" "
                    ind2=" "
                    tag="338">
                    <marc:subfield
                        code="a">volume</marc:subfield>
                    <marc:subfield
                        code="b">nc</marc:subfield>
                    <marc:subfield
                        code="2">rdacarrier</marc:subfield>
                </marc:datafield>

                <marc:datafield
                    ind1=" "
                    ind2=" "
                    tag="500">
                    <marc:subfield
                        code="a">Latin American periodicals project</marc:subfield>
                    <marc:subfield
                        code="5">NjP</marc:subfield>
                </marc:datafield>

                <xsl:for-each
                    select="rdf:RDF/bf:Instance/bf:note[normalize-space(substring-after(., ':'))]">
                    <xsl:if
                        test="starts-with(., 'Description based on')">
                        <marc:datafield
                            ind1=" "
                            ind2=" "
                            tag="588">
                            <marc:subfield
                                code="a">
                                <xsl:value-of
                                    select="."/>
                                <xsl:text>.</xsl:text>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                    <xsl:if
                        test="starts-with(., 'Latest issue consulted')">
                        <marc:datafield
                            ind1=" "
                            ind2=" "
                            tag="588">
                            <marc:subfield
                                code="a">
                                <xsl:value-of
                                    select="."/>
                                <xsl:text>.</xsl:text>
                            </marc:subfield>
                        </marc:datafield>
                    </xsl:if>
                </xsl:for-each>

                <marc:datafield
                    ind1=" "
                    ind2="0"
                    tag="651">
                    <marc:subfield
                        code="a">Argentina</marc:subfield>
                    <marc:subfield
                        code="v">Periodicals.</marc:subfield>
                </marc:datafield>

                <xsl:for-each-group
                    group-by="bf:categoryValue"
                    select="rdf:RDF/bf:Work/bf:subject/bf:Category">
                    <marc:datafield
                        ind1=" "
                        ind2="0"
                        tag="650">
                        <marc:subfield
                            code="a">
                            <xsl:value-of
                                select="current-grouping-key()"/>
                        </marc:subfield>
                        <marc:subfield
                            code="v">
                            <xsl:text>Periodicals.</xsl:text>
                        </marc:subfield>
                    </marc:datafield>
                </xsl:for-each-group>

                <xsl:for-each
                    select="rdf:RDF/bf:Work/bf:subject/bf:Category/dcterms:hasPart/bf:Topic/bf:hasAuthority[normalize-space(@rdf:resource)]">
                    <xsl:if
                        test="starts-with(@rdf:resource, 'http') or string-length(translate(@rdf:resource, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', '')) lt string-length(@rdf:resource)">
                        <marc:datafield
                            ind1=" "
                            ind2="0"
                            tag="650">
                            <marc:subfield
                                code="a">
                                <xsl:sequence
                                    select="
                                        if (starts-with(@rdf:resource, 'http')) then
                                            xs:string(document(concat(@rdf:resource, '.rdf'))/*/*/madsrdf:authoritativeLabel)
                                        else
                                            xs:string(@rdf:resource)"/>
                            </marc:subfield>
                            <marc:subfield
                                code="v">
                                <xsl:text>Periodicals.</xsl:text>
                            </marc:subfield>
                            <!--<xsl:if test="starts-with(@rdf:resource, 'http')">
                                <marc:subfield code="0">
                                    <xsl:value-of select="@rdf:resource"/>
                                </marc:subfield>
                            </xsl:if>-->
                        </marc:datafield>
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each
                    select="rdf:RDF/bf:Work/relators:aut[starts-with(@rdf:resource, 'http')]">
                    <marc:datafield
                        ind1="1"
                        ind2=" "
                        tag="700">
                        <marc:subfield
                            code="a">
                            <xsl:value-of
                                select="key('entityKey', @rdf:resource)/bf:label"/>
                            <xsl:text>,</xsl:text>
                        </marc:subfield>
                        <marc:subfield
                            code="e">issuing body.</marc:subfield>
                    </marc:datafield>
                </xsl:for-each>

                <xsl:for-each
                    select="rdf:RDF/bf:Work/relators:isb[starts-with(@rdf:resource, 'http')]">
                    <marc:datafield
                        ind1="2"
                        ind2=" "
                        tag="710">
                        <marc:subfield
                            code="a">
                            <xsl:value-of
                                select="key('entityKey', @rdf:resource)/bf:label"/>
                            <xsl:text>,</xsl:text>
                        </marc:subfield>
                        <marc:subfield
                            code="e">issuing body.</marc:subfield>
                    </marc:datafield>
                </xsl:for-each>






            </marc:record>

        </marc:collection>

    </xsl:template>

    <xsl:template
        match="text()"/>

    <doc
        xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Function that builds the 24-byte MARC leader (zero based)</desc>
        <param
            name="doc">Document element</param>
    </doc>
    <xsl:function
        as="xs:string"
        name="cwb:build-leader">
        <xsl:param
            as="element()"
            name="doc"/>
        <xsl:sequence
            select="
                concat(
                if ($doc/bf:Annotation/bf:descriptionStatus[. eq 'new']) then
                    '00000n'
                else
                    if ($doc/bf:Annotation/bf:descriptionStatus[. eq 'revised']) then
                        '00000c'
                    else
                        if (not($doc/bf:Annotation/bf:descriptionStatus) or $doc/bf:Annotation/bf:descriptionStatus[not(normalize-space(.))]) then
                            if ($doc/bf:Annotation/bf:changeDate[normalize-space(.)]) then
                                '00000c'
                            else
                                '00000n'
                        else
                            '00000n',
                if ($doc/bf:Work/rdf:type/@rdf:resource[normalize-space(.)] = 'http://bibframe.org/vocab/Text') then
                    'a'
                else
                    cwb:error('type', $doc/bf:Work/rdf:type/@rdf:resource[normalize-space(.)]),
                if ($doc/bf:Instance/rdf:type/@rdf:resource[normalize-space(.)] = 'http://bibframe.org/vocab/Serial') then
                    's'
                else
                    if ($doc/bf:Instance/rdf:type/@rdf:resource[normalize-space(.)] = 'http://bibframe.org/vocab/Monograph') then
                        'm'
                    else
                        cwb:error('type', $doc/bf:Instance/rdf:type/@rdf:resource[normalize-space(.)]),
                '  ', '22', '00000', '3',
                if ($doc/bf:Annotation/bf:descriptionConventions/@rdf:resource[normalize-space(.)] = 'http://id.loc.gov/vocabulary/descriptionConventions/isbd') then
                    'i'
                else
                    (),
                ' ', '4500'
                )"/>
    </xsl:function>
    <doc
        xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Function that formats a date to conform to 005</desc>
        <param
            name="date">xs:dateTime</param>
    </doc>
    <xsl:function
        as="xs:string*"
        name="cwb:format-date">
        <xsl:param
            as="xs:string*"
            name="date"/>
        <xsl:sequence
            select="concat(translate($date, '-T:Z', ''), '.0')"/>
    </xsl:function>
    <doc
        xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <p>Function that builds the 40-byte MARC 008 field (zero based)</p>
            <p>Example: 110810d19571981sp wr p 6 0 0spa d</p>
        </desc>
        <param
            name="doc">Document element</param>
    </doc>
    <xsl:function
        as="xs:string"
        name="cwb:build-008">
        <xsl:param
            as="element()"
            name="doc"/>
        <xsl:sequence
            select="
                concat(
                substring(cwb:format-date($doc/bf:Annotation[1]/bf:creationDate), 3, 6), if ($doc/bf:Instance/m21rdf00X:M00806[normalize-space(.)]) then
                    cwb:parse-uri($doc/bf:Instance/m21rdf00X:M00806)
                else
                    'u',
                if ($doc/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00807-10[normalize-space(.)]) then
                    $doc/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00807-10
                else
                    '    ',
                
                if ($doc/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00811-14[normalize-space(.)]) then
                    $doc/bf:Instance/bf:publication/bf:Provider/m21rdf00X:M00811-14
                else
                    '    ',
                $placeOfPublication,
                if ($doc/bf:Instance/m21rdf00X:M008CR18[normalize-space(@rdf:resource)]) then
                    cwb:parse-uri($doc/bf:Instance/m21rdf00X:M008CR18/@rdf:resource)
                else
                    'u',
                if ($doc/bf:Instance/m21rdf00X:M008CR19[normalize-space(@rdf:resource)]) then
                    cwb:parse-uri($doc/bf:Instance/m21rdf00X:M008CR19/@rdf:resource)
                else
                    'u', ' ', 'p', '|', ' ', ' ', '   ', ' ', '0', '   ', ' ', '0', 'spa', ' ', 'd'
                )"/>
    </xsl:function>
    <doc
        xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Function that strips the variable part from the end of a URI</desc>
        <param
            name="uri"/>
    </doc>
    <xsl:function
        as="xs:string"
        name="cwb:parse-uri">
        <xsl:param
            as="xs:string"
            name="uri"/>
        <xsl:sequence
            select="
                if (contains($uri, '#')) then
                    cwb:parse-uri(substring-after($uri, '#'))
                else
                    if (contains($uri, '/')) then
                        cwb:parse-uri(substring-after($uri, '/'))
                    else
                        $uri"/>
    </xsl:function>

    <xsl:function
        name="cwb:error">
        <xsl:param
            as="xs:string"
            name="cwb:error-type"/>
        <xsl:param
            as="item()?"
            name="cwb:type"/>
        <xsl:if
            test="$cwb:error-type = 'type'">
            <!-- <xsl:message
                terminate="no">ERROR: value of rdf:type "<xsl:value-of select="$cwb:type"/>" is not supported by this script.</xsl:message>-->
        </xsl:if>
    </xsl:function>

</xsl:stylesheet>
