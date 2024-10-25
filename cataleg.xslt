<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" />

  <xsl:template name="Precio">
    <xsl:param name="price" />
    <td>
      <xsl:if test="$price &gt; 10">
        <p>&#x1F534;</p> 
      </xsl:if>
      <xsl:if test="$price &lt;= 10">
        <p>&#x1F7E2;</p>
      </xsl:if>
    </td>
  </xsl:template>

  <xsl:template match="/">
    <html> 
      <body>
        <h2>My CD Collection</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th style="text-align:left">Indicator</th>
            <th style="text-align:left">Title</th>
            <th style="text-align:left">Artist</th>
            <th style="text-align:left">Price</th>
          </tr>              

          <xsl:for-each select="catalog/cd">
            <xsl:sort select="price" data-type="number" order="ascending" />
            <tr>
              <xsl:call-template name="priceIndicator">
                <xsl:with-param name="price" select="price" />
              </xsl:call-template>
              <td><xsl:value-of select="title"/></td>
              <td><xsl:value-of select="artist"/></td>
              <td><xsl:value-of select="price"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
