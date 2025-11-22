<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/portfolio">
        <html>
        <head>
            <title>Neshren's Portfolio</title>
            <style>
                body {
                    font-family: "Garamond", "Georgia", serif;
                    background-color: #0c0b0b;
                    color: #e4dfd7;
                    padding: 50px 200px;
                    margin: 0;
                    background-image: radial-gradient(circle at top, #1a1717, #0c0b0b 70%);
                }

                .container {
                    width: 80%;
                    margin: auto;
                    background: #161515;
                    padding: 35px;
                    border-radius: 12px;
                    border: 1px solid #3d3535;
                    box-shadow:
                        0 0 25px rgba(0,0,0,0.9),
                        0 0 10px #2a0f12 inset;
                }

                h1 {
                    text-align: center;
                    color: #b79a78;
                    margin-bottom: 30px;
                    font-size: 42px;
                    letter-spacing: 3px;
                    text-shadow: 0 0 10px rgba(129, 46, 46, 0.5);
                }

                h2 {
                    color: #b79a78;
                    border-bottom: 1px solid #4d3c3c;
                    padding-bottom: 8px;
                    margin-bottom: 10px;
                    font-size: 22px;
                    letter-spacing: 1px;
                }

                .box {
                    background: #1e1c1c;
                    padding: 20px;
                    border: 1px solid #4a3f3f;
                    border-radius: 8px;
                    margin-bottom: 30px;
                    box-shadow:
                        0 0 10px rgba(0,0,0,0.6),
                        0 0 10px rgba(80, 21, 21, 0.4) inset;
                }

                p, li {
                    font-size: 17px;
                    line-height: 1.6;
                }

                li {
                    margin-bottom: 6px;
                }

                ul {
                    margin-left: 20px;
                }
            </style>
        </head>

        <body>
        <div class="container">

            <h1>Neshren Sultan</h1>

            <div class="box">
                <h2>Contact</h2>
                <p><b>Phone: </b> <xsl:value-of select="basicInfo/phone"/></p>
                <p><b>Email: </b> <xsl:value-of select="basicInfo/email"/></p>
                <p><b>Instagram: </b> <xsl:value-of select="basicInfo/instagram"/></p>
            </div>

            <div class="box">
                <h2>About Me</h2>
                <p><xsl:value-of select="aboutMe"/></p>
            </div>

            <div class="box">
                <h2>Technical Skills</h2>
                <ul>
                    <xsl:for-each select="technicalSkills/skill">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </div>

            <div class="box">
                <h2>Soft Skills</h2>
                <ul>
                    <xsl:for-each select="softSkills/skill">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </div>

        </div>
        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
