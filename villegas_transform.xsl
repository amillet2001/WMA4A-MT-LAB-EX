<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:output method="html"/>
<xsl:template match="/">
    <html>
        <head>
        <title>Student Portfolio</title>
        </head>
        <body>
        <h1>Student Portfolio</h1>
        <h3>
        <xsl:value-of select="portfolio/student/firstname"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="portfolio/student/lastname"/>
        </h3>

        
        <p>Age: <xsl:value-of select="portfolio/student/age"/></p>
        <p>Course: <xsl:value-of select="portfolio/student/course"/></p>
        <p>Year Level: <xsl:value-of select="portfolio/student/yearlevel"/></p>

        <h2>Skills</h2>
        <ul>
            <xsl:for-each select="portfolio/skills/skill">
            <li><xsl:value-of select="name"/></li>
            </xsl:for-each>
        </ul>

        <h2>Hobbies</h2>
        <ul>
            <xsl:for-each select="portfolio/hobbies/hobby">
            <li><xsl:value-of select="title"/></li>
            </xsl:for-each>
        </ul>
        </body>
        </html>
        </xsl:template>
        </xsl:stylesheet>