<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Student Portfolio</title>
            </head>
            <body>
                <h1>Student Portfolio</h1>

                <h2>Student Information</h2>
                <p><b>Name: </b>
                <xsl:value-of select="/portfolio/student/firstname"/> 
                <xsl:text> </xsl:text>
                <xsl:value-of select="/portfolio/student/lastname"/></p>

                <p><b>Course: </b> <xsl:value-of select="/portfolio/student/course"/></p>
                <p><b>Graduation Year: </b> <xsl:value-of select="/portfolio/student/year"/></p>

                <h2>Skills: </h2>
                <ul>
                    <xsl:for-each select="/portfolio/skills/skill">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>

                <h2>Projects</h2>
                <xsl:for-each select="/portfolio/projects/project">
                    <div>
                        <h3><xsl:value-of select="title"/></h3>
                        <p><xsl:value-of select="description"/></p>
                        <small>Year: <xsl:value-of select="year"/></small>
                    </div>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
