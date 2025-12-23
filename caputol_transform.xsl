<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Caputol Activity 1</title>
        <style>
          body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1e1e2f;
            color: #f0f0f0;
            margin: 20px;
          }
          h1 {
            text-align: center;
            color: #ffcc00;
          }
          h2 {
            color: #00ccff;
            border-bottom: 2px solid #00ccff;
            padding-bottom: 5px;
          }
          h3 {
            color: #ff99cc;
            margin-top: 25px;
          }
          h4 {
            color: #99ff66;
            margin-top: 15px;
          }
          ul {
            list-style-type: square;
            margin-left: 20px;
            background-color: #2a2a3f;
            padding: 10px;
            border-radius: 8px;
          }
          li {
            padding: 3px 0;
          }
          p {
            line-height: 1.5;
          }
          .section {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #2b2b42;
            border-radius: 10px;
          }
        </style>
      </head>
      <body>
        <h1>Student Portfolio</h1>

        <div class="section">
          <h2><xsl:value-of select="studentPortfolio/student/info/fullName"/></h2>
          <p><b>Student Number:</b> <xsl:value-of select="studentPortfolio/student/info/studentNumber"/></p>
          <p><b>Email:</b> <xsl:value-of select="studentPortfolio/student/info/studentEmail"/></p>
          <p><xsl:value-of select="studentPortfolio/student/info/about"/></p>
       
        <div class="section">
          <h3>COURSE DETAILS</h3>
          <ul>
            <li><b>Program:</b> <xsl:value-of select="studentPortfolio/student/course/program"/></li>
            <li><b>Major:</b> <xsl:value-of select="studentPortfolio/student/course/major"/></li>
            <li><b>Year:</b> <xsl:value-of select="studentPortfolio/student/course/year"/></li>
            <li><b>Section:</b> <xsl:value-of select="studentPortfolio/student/course/section"/></li>
          </ul>
        </div>

        <div class="section">
          <h3>PLAYER STATISTICS</h3>
          <ul>
            <li><b>Level:</b> <xsl:value-of select="studentPortfolio/student/playerStats/level"/></li>
            <li><b>Class:</b> <xsl:value-of select="studentPortfolio/student/playerStats/class"/></li>
            <li><b>Specialization:</b> <xsl:value-of select="studentPortfolio/student/playerStats/specialization"/></li>
          </ul>

          <h4>SKILLS</h4>
          <ul>
            <xsl:for-each select="studentPortfolio/student/playerStats/skills/skill">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
        </div>
        </div>

       

        <div class="section">
          <h3>INVENTORY</h3>
          <ul>
            <xsl:for-each select="studentPortfolio/student/inventory/item">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
        </div>

        <div class="section">
          <h3>PROJECTS</h3>
          <ul>
            <xsl:for-each select="studentPortfolio/student/projects/proj">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
        </div>

        <div class="section">
          <h3>FUTURE PROJECTS</h3>
          <ul>
            <xsl:for-each select="studentPortfolio/student/futureProj/fProj">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
