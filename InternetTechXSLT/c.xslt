<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>
    
    <xsl:template match="/">
        <xsl:text>{ "staff": [</xsl:text>
        <xsl:apply-templates select="staff/person"/>
        <xsl:text>]}</xsl:text>
    </xsl:template>

    <xsl:template match="person">
        <xsl:if test="position() > 1">
            <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:text>{"name": "</xsl:text>
        <xsl:call-template name="escape-string">
            <xsl:with-param name="text" select="@name"/>
        </xsl:call-template>
        <xsl:text>",</xsl:text>
        <xsl:text>"employee": [</xsl:text>
        <xsl:apply-templates select="employee"/>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="employee">
        <xsl:if test="position() > 1">
            <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:text>{"position": "</xsl:text>
        <xsl:call-template name="escape-string">
            <xsl:with-param name="text" select="position"/>
        </xsl:call-template>
        <xsl:text>",</xsl:text>
        <xsl:text>"department": "</xsl:text>
        <xsl:call-template name="escape-string">
            <xsl:with-param name="text" select="department"/>
        </xsl:call-template>
        <xsl:text>"}</xsl:text>
    </xsl:template>

    <xsl:template name="escape-string">
        <xsl:param name="text"/>
        <xsl:choose>
            <xsl:when test="contains($text, '&quot;')">
                <xsl:value-of select="substring-before($text, '&quot;')"/>
                <xsl:text>\&quot;</xsl:text>
                <xsl:call-template name="escape-string">
                    <xsl:with-param name="text" select="substring-after($text, '&quot;')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
