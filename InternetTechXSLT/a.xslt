<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Список сотрудников с занимаемыми позициями</title>
      </head>
      <body>
        <h1>Список сотрудников с занимаемыми позициями</h1>
        <ol>
          <xsl:for-each select="//person">
            <xsl:sort select="@name"/>
            <li>
              <xsl:value-of select="@name"/>
              <ul>
                <xsl:for-each select="employee/position">
                  <li><xsl:value-of select="."/></li>
                </xsl:for-each>
              </ul>
            </li>
          </xsl:for-each>
        </ol>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
