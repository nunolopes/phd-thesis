<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <xsl:template match="member">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="bands">
      <xsl:apply-templates select="//band[@name='Nightwish']/members"/>
  </xsl:template>

</xsl:stylesheet>
