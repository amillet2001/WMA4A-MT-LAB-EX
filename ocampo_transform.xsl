<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
        <head>
            <title>Student Portfolio</title>

            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background: #faf8f4; /* very light coffee cream */
                    color: #3b2f2f; /* dark coffee brown */
                }

                .container {
                    max-width: 780px;
                    margin: 40px auto;
                    background: #fffdf8; 
                    padding: 30px;
                    border-radius: 10px;
                    border: 2px solid #c4a484; /* soft coffee brown */
                }

                h1 {
                    text-align: center;
                    font-size: 26px;
                    font-weight: 600;
                    margin-bottom: 25px;
                    color: #5a3e2b; /* medium coffee brown */
                }

                h2 {
                    font-size: 20px;
                    font-weight: 600;
                    border-bottom: 2px solid #c4a484; /* brown accent */
                    padding-bottom: 5px;
                    margin-top: 30px;
                    color: #4a3526;
                }

                p, li {
                    font-size: 15px;
                    line-height: 1.5;
                    color: #3b2f2f;
                }

                ul {
                    padding-left: 20px;
                    margin-top: 10px;
                }

                .project-box {
                    border: 1.8px solid #d2b48c; /* tan-light brown */
                    border-radius: 8px;
                    padding: 12px 15px;
                    margin: 10px 0;
                    background: #fffaf3; /* very light beige */
                }

                .skill-tag {
                    display: inline-block;
                    background: #f3e5d8; /* subtle coffee cream */
                    padding: 5px 12px;
                    border-radius: 12px;
                    font-size: 14px;
                    margin: 4px;
                    border: 1px solid #d2b48c; /* tan */
                    color: #4a3526;
                }

            </style>
        </head>

        <body>
            <div class="container">

                <h1>Student Portfolio</h1>

                <h2>Student Information</h2>
                <p><b>Name:</b> <xsl:value-of select="portfolio/student/firstname"/>
                   <xsl:text> </xsl:text>
                   <xsl:value-of select="portfolio/student/lastname"/></p>

                <p><b>Course:</b> <xsl:value-of select="portfolio/student/course"/></p>
                <p><b>Year:</b> <xsl:value-of select="portfolio/student/year"/></p>

                <h2>Skills</h2>
                <div>
                    <xsl:for-each select="portfolio/skills/skill">
                        <span class="skill-tag">
                            <xsl:value-of select="."/>
                        </span>
                    </xsl:for-each>
                </div>

                <h2>Projects</h2>
                <xsl:for-each select="portfolio/projects/project">
                    <div class="project-box">
                        <p><b>Title:</b> <xsl:value-of select="title"/></p>
                        <p><b>Description:</b> <xsl:value-of select="description"/></p>
                        <p><b>Year:</b> <xsl:value-of select="year"/></p>
                    </div>
                </xsl:for-each>

            </div>
        </body>

        </html>
    </xsl:template>

</xsl:stylesheet>