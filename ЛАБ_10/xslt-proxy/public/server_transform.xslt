<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/hash/result">
      <div>
        <table border = "1">
          <tr>
            <th>Итерация</th>
            <th>Первое число</th>
            <th>Второе число</th>
          </tr>

          <tr>
            <th>Вы ввели</th>
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
            <th>Операция</th>
            <th>Наибольший общий делитель</th>
            <th>Наименьшее общее кратное</th>
          </tr>

          <tr>
            <th>Результат</th>
            <th><xsl:value-of select="nod"/></th>
            <th><xsl:value-of select="nok"/></th>
          </tr>
        </table>
      </div>
  </xsl:template>
  <xsl:template match="/hash/error-msg">
    <h3><xsl:value-of select="/"/></h3>
  </xsl:template>
</xsl:stylesheet>
