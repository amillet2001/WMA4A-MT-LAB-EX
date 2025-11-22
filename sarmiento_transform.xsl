<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">

    <html>
      <head>
        <title>IPT2 Student Portfolio</title>

        <style>
          body {
            font-family: "Poppins", Arial, sans-serif;
            background: linear-gradient(135deg, #0a0a0f, #131327, #1d1a33);
            margin: 0;
            padding: 0;
            color: #e8e4ff;
          }

          .container {
            width: 75%;
            margin: 40px auto;
            background: rgba(32, 28, 55, 0.75);
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(157, 123, 255, 0.5);
            border: 2px solid rgba(157, 123, 255, 0.5);
          }

          h1 {
            text-align: center;
            color: #c6a6ff;
            font-size: 42px;
            text-shadow: 0 0 15px #a577ff;
            margin-bottom: 10px;
            letter-spacing: 3px;
          }

          .name-header {
            text-align: center;
            font-size: 24px;
            color: #e3d4ff;
            margin-bottom: 25px;
            text-shadow: 0 0 10px #b08cff;
            font-weight: bold;
          }

          .section-title {
            font-size: 24px;
            color: #d7c4ff;
            margin-top: 35px;
            padding-left: 10px;
            border-left: 6px solid #9d7bff;
            text-shadow: 0 0 10px #a87cff;
          }

          .card {
            background: rgba(54, 46, 88, 0.45);
            padding: 20px;
            margin-top: 15px;
            border-radius: 16px;
            border: 2px solid rgba(157, 123, 255, 0.4);
            box-shadow: 0 0 18px rgba(138, 92, 255, 0.3);
          }

          .label {
            font-weight: bold;
            color: #c8a4ff;
            text-shadow: 0 0 6px #a87cff;
          }

          ul {
            list-style: none;
            padding-left: 0;
          }

          li {
            padding: 6px 0;
          }

          .glow {
            color: #c6a6ff;
            text-shadow: 0 0 12px #b08cff;
          }
        </style>
      </head>

      <body>
        <div class="container">

          <h1>★ Student Portfolio ★</h1>

          <div class="name-header">
            <span class="glow">✦</span>
            <xsl:value-of select="studentPortfolio/student/name/firstName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="studentPortfolio/student/name/secondName"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="studentPortfolio/student/name/middlename"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="studentPortfolio/student/name/lastName"/>
            <span class="glow">✦</span>
          </div>

          <div class="card">
            <p>
              <span class="label">Student Number:</span>
              <xsl:text> </xsl:text>
              <xsl:value-of select="studentPortfolio/student/studentNumber"/>
            </p>

            <p>
              <span class="label">Email:</span>
              <xsl:text> </xsl:text>
              <xsl:value-of select="studentPortfolio/student/studentEmail"/>
            </p>
          </div>

          <h3 class="section-title">📘 Course Details</h3>
          <div class="card">
            <ul>
              <li><span class="label">Program:</span> <xsl:value-of select="studentPortfolio/student/course/program"/></li>
              <li><span class="label">Major:</span> <xsl:value-of select="studentPortfolio/student/course/major"/></li>
              <li><span class="label">Year:</span> <xsl:value-of select="studentPortfolio/student/course/year"/></li>
              <li><span class="label">Section:</span> <xsl:value-of select="studentPortfolio/student/course/section"/></li>
            </ul>
          </div>

          <h3 class="section-title">🏅 Achievements</h3>
          <div class="card">
            <p><span class="label">Certificates:</span></p>
            <ul>
              <xsl:for-each select="studentPortfolio/student/achievements/cert">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>

            <p><span class="label">Awards:</span></p>
            <ul>
              <xsl:for-each select="studentPortfolio/student/achievements/award">
                <li><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>

          <h3 class="section-title">🎴 Hobbies</h3>
          <div class="card">
            <ul>
              <xsl:for-each select="studentPortfolio/student/hobbies/hobby">
                <li><span class="label">•</span> <xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>

        </div>
      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>
