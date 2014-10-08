<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" version="2.0" exclude-result-prefixes="xsl xlink">
   
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" cdata-section-elements="code" doctype-system="xmlspec.dtd" />

<!-- BBC: Run this xslt against each of the xml sources for WCAG 2.0 after a /TR/ draft has been published 

Note that depending on how many changes there are, it may be easier to do this manually.

Benefits of running this are that CDATA sections get cleaned up, but you have to do some find and replace to get rid of extra xlink and xmlns markup in the <loc> elements. Also, this sometimes screws up special characters. The other cleanup that is needed after this runs is to get rid of <phrase> elements that don't have attributes. Can't delete them altogether else you'll screw up phrase elements with xml:lang.

-->
<xsl:template match="node()|@*"><xsl:copy><xsl:apply-templates select="node()|@*[not(local-name() = 'diff')]"/></xsl:copy></xsl:template>
	
<xsl:template match="phrase[@diff and @diff != 'del' and count(@*) = 1]"><xsl:apply-templates select="node()|@*[not(local-name() = 'diff')]"/></xsl:template>

<xsl:template match="@*[namespace-uri() = 'http://www.w3.org/1999/xlink']"/>
	
<xsl:template match="*[@diff='del']" />

<xsl:template match="issue" />

</xsl:stylesheet>