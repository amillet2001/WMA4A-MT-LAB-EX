<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Student Portfolio</title>
                <style>
                    body { 
                        font-family: Poppins, sans-serif; 
                        margin: 0; 
                        padding: 0; 
                        background-color: #001524; 
                    }

                    .container {
                        max-width: 1000px;
                        margin: 40px auto;
                        background: #FFECD1;
                        padding: 40px;
                        border-radius: 10px;
                        box-shadow: 0 2px 10px rgba(245, 193, 170, 1);
                    }

                    h1 {
                        color: #15616D;
                        margin-bottom: 20px;
                        text-align: center;
                        border-bottom: 4px solid #FF7D00;
                        padding-bottom: 10px;
                    }

                    .section-title {
                        color: #15616D;
                        margin-top: 35px;
                        font-size: 22px;
                        border-left: 6px solid #FF7D00;
                        padding-left: 10px;
                    }

                    .two-column {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 20px;
                        margin-top: 20px;
                    }

                    .info-item { 
                        margin: 8px 0; 
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 15px;
                        background: white;
                    }

                    th, td {
                        padding: 12px;
                        border: 1px solid #ddd;
                        vertical-align: top;
                        text-align: center;
                    }

                    th {
                        background-color: #FF7D00;
                        color: #fff;
                    }

                    .project {
                        margin: 15px 0;
                        padding: 15px;
                        background: #fff;
                        border-left: 4px solid #FF7D00;
                        border-radius: 5px;
                    }

                </style>
            </head>

            <body>
                <div class="container">
                    <h1>Student Portfolio</h1>
                    <xsl:apply-templates select="studentPortfolio/student"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="student">

        <h2 class="section-title">Personal Information</h2>
        <div class="two-column">
            <div>
                <div class="info-item"><strong>Name:</strong> <xsl:value-of select="personalInfo/name"/></div>
                <div class="info-item"><strong>Student ID:</strong> <xsl:value-of select="personalInfo/studentID"/></div>
                <div class="info-item"><strong>Email:</strong> <xsl:value-of select="personalInfo/email"/></div>
            </div>

            <div>
                <div class="info-item"><strong>Program:</strong> <xsl:value-of select="personalInfo/program"/></div>
                <div class="info-item"><strong>Year:</strong> <xsl:value-of select="personalInfo/year"/></div>
            </div>
        </div>

        <h2 class="section-title">About Me</h2>
        <xsl:for-each select="personalInfo/about">
            <p><xsl:value-of select="."/></p>
        </xsl:for-each>

        <h2 class="section-title">Programming Languages</h2>
        <ul>
            <xsl:for-each select="skills/prog_lang/program">
                <li><xsl:value-of select="."/></li>
            </xsl:for-each>
        </ul>

        <h2 class="section-title">Skills</h2>
        <table>

            <tr>
                <th>Technical Skills</th>
            </tr>

            <xsl:for-each select="skills/technical/tech">
                <tr>
                    <td><xsl:value-of select="."/></td>
                </tr>
            </xsl:for-each>

            <tr>
                <th>Soft Skills</th>
            </tr>

            <xsl:for-each select="skills/softskills/soft">
                <tr>
                    <td><xsl:value-of select="."/></td>
                </tr>
            </xsl:for-each>

        </table>

        <h2 class="section-title">Projects</h2>
        <xsl:for-each select="projects/project">
            <div class="project">
                <h3><xsl:value-of select="title"/></h3>
                <p><xsl:value-of select="description"/></p>
                <p><em><xsl:value-of select="date"/></em></p>
            </div>
        </xsl:for-each>

        <h2 class="section-title">Contact</h2>
        <div class="info-item"><strong>Email:</strong> <xsl:value-of select="contact/personalemail"/></div>
        <div class="info-item"><strong>Contact Number:</strong> <xsl:value-of select="contact/contactnum"/></div>

        <h3>Socials</h3>
        <div class="info-item"><strong>Facebook:</strong> <xsl:value-of select="contact/socials/facebook"/></div>
        <div class="info-item"><strong>GitHub:</strong> <xsl:value-of select="contact/socials/github"/></div>

    </xsl:template>

</xsl:stylesheet>
