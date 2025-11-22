<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Castro Activity 2</title>
      </head>
      <body>
        <h1>Student Portfolio</h1>
        <h2>
          <xsl:value-of select="studentPortfolio/student/name/firstName"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="studentPortfolio/student/name/secondName"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="studentPortfolio/student/name/lastName"/>
        </h2>
        <p><b>Student Number: </b> <xsl:value-of select="studentPortfolio/student/studentNumber"/></p>
        <p><b>Email: </b> <xsl:value-of select="studentPortfolio/student/studentEmail"/></p>
        <h3>Course Details</h3>
        <ul>
          <li><b>Program: </b> <xsl:value-of select="studentPortfolio/student/course/program"/></li>
          <li><b>Major: </b> <xsl:value-of select="studentPortfolio/student/course/major"/></li>
          <li><b>Year: </b> <xsl:value-of select="studentPortfolio/student/course/year"/></li>
          <li><b>Section: </b> <xsl:value-of select="studentPortfolio/student/course/section"/></li>
        </ul>
        <h3>Achievements</h3>
          <ul>
            <li><b>Certificate: </b> <xsl:value-of select="studentPortfolio/student/achievements/cert"/></li>
            <xsl:for-each select="studentPortfolio/student/achievements/award">
            <li><b>Award: </b> <xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

