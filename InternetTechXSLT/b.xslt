<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Таблица сотрудников</title>
      </head>
      <body>
        <h1>Таблица сотрудников</h1>
        <table border="1">
          <tr>
            <th>№</th>
            <th>ФИО</th>
            <th>Городской/местный телефон</th>
            <th>Аудитория</th>
            <th>Список замещаемых позиций</th>
          </tr>
          <xsl:for-each select="//person">
            <tr>
              <td><xsl:number/></td>
              <td><xsl:value-of select="@name"/></td>
              <td><xsl:value-of select="contact/@phonenum"/></td>
              <td><xsl:value-of select="contact/@address"/></td>
              <td>
                <xsl:for-each select="employee">
                  <xsl:value-of select="position"/>
                  <br/>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
