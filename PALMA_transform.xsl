<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
<html>
<head>
<meta charset="UTF-8"/>
<title>
  <xsl:value-of select="portfolio/student/name/first"/> 
  <xsl:text> </xsl:text>
  <xsl:value-of select="portfolio/student/name/last"/>
</title>

<style>
    body {
        font-family: "Segoe UI", Arial, sans-serif;
        background: #f5f6fa;
        margin: 0;
        padding: 0;
    }

    .header {
        background: linear-gradient(135deg, #5a5cff, #4c00ff);
        color: white;
        padding: 40px;
        text-align: left;
        box-shadow: 0 2px 10px rgba(0,0,0,0.2);
    }

    .header h1 {
        font-size: 40px;
        margin: 0;
    }

    .container {
        width: 80%;
        margin: 30px auto;
    }

    .card {
        background: white;
        padding: 25px;
        margin-bottom: 25px;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .card h2 {
        margin-top: 0;
        border-left: 5px solid #4c00ff;
        padding-left: 10px;
        font-size: 24px;
        color: #333;
    }

    ul {
        margin: 10px 0 0 20px;
    }

    li {
        margin-bottom: 6px;
        font-size: 17px;
    }

    .info p {
        font-size: 17px;
        margin: 5px 0;
    }
</style>

</head>

<body>

<!-- HEADER SECTION -->
<div class="header">
    <h1>
        <xsl:value-of select="portfolio/student/name/first"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="portfolio/student/name/last"/>
    </h1>
</div>

<div class="container">

    <!-- Personal Information -->
    <div class="card info">
        <h2>Personal Information</h2>
        <p><strong>Email:</strong> <xsl:value-of select="portfolio/student/email"/></p>
        <p><strong>Contact:</strong> <xsl:value-of select="portfolio/student/contact"/></p>
        <p><strong>Birthday:</strong> <xsl:value-of select="portfolio/student/birthday"/></p>
        <p><strong>Citizenship:</strong> <xsl:value-of select="portfolio/student/citizenship"/></p>
        <p><strong>Address:</strong> <xsl:value-of select="portfolio/student/address"/></p>
    </div>

    <!-- Hard Skills -->
    <div class="card">
        <h2>Hard Skills</h2>
        <ul>
            <xsl:for-each select="portfolio/skills/hardSkills/skill">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
        </ul>
    </div>

    <!-- Soft Skills -->
    <div class="card">
        <h2>Soft Skills</h2>
        <ul>
            <xsl:for-each select="portfolio/skills/softSkills/skill">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
        </ul>
    </div>

    <!-- Education -->
    <div class="card">
        <h2>Education</h2>
        <p><strong><xsl:value-of select="portfolio/education/school/name"/></strong></p>
        <p>Status: <xsl:value-of select="portfolio/education/school/status"/></p>
        <p>Year Level: <xsl:value-of select="portfolio/education/school/yearLevel"/></p>
        <p>Program and Major: <xsl:value-of select="portfolio/education/school/programMajor"/></p>
    </div>

</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
