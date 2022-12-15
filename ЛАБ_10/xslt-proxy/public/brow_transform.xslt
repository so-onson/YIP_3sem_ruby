<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/hash/result">
  <html>

    <body>
      <div>
        <h1>Euclid's Algorithm</h1>
      </div>
      <div>
          <div>
            <table border = "1">
              <tr>
                <th>Iteration</th>
                <th>First number</th>
                <th>Second number</th>
              </tr>

              <tr>
                <th>Initial</th>
                <th><xsl:value-of select="num1"/></th>
                <th><xsl:value-of select="num2"/></th>
              </tr>

              <xsl:for-each select="iterations/iteration">
                <tr>
                  <td><xsl:value-of select="index"/></td>
                  <td><xsl:value-of select="num1"/></td>
                  <td><xsl:value-of select="num2"/></td>
                </tr>
              </xsl:for-each>

              <tr>
                <th>Operation</th>
                <th>Greatest common denominator</th>
                <th>Least common Multiple</th>
              </tr>

              <tr>
                <th>Result</th>
                <th><xsl:value-of select="nod"/></th>
                <th><xsl:value-of select="nok"/></th>
              </tr>
            </table>
          </div>
      </div>
      <a href="/" class="link-primary"> Назад </a>
    </body>
  </html>
</xsl:template>

<xsl:template match="/hash/error-msg">
  <html>
    <head>
      <title>Rails Labs</title>
      <meta name="viewport" content="width=device-width,initial-scale=1"/>
      <link href="/bootstrap.min.css" rel="stylesheet"/>
    </head>

    <body class="container-fluid">
      <div class="row bg-primary">
        <h1 class="col-6 mt-3 text-light">Euclid's Algorithm</h1>
      </div>
      <h3 class="text-danger"><xsl:value-of select="."/></h3>
      <a href="/" class="link-primary"> Назад </a>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>