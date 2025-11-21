<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>Dayao Portfolio</title>
                <style>
                    body {
                        font-family: "Trebuchet MS", Arial;
                        padding: 20px;
                        background: linear-gradient(135deg, #ffd6e8, #ffeef7);
                        color: #5a375d;
                    }

                    h1 {
                        text-align: center;
                        color: #ff5fa2;
                        font-size: 40px;
                        text-shadow: 1px 1px 2px #ffffff;
                        margin-bottom: 30px;
                    }

                    h2 {
                        color: #ff82b2;
                        border-left: 6px solid #ffb6d9;
                        padding-left: 10px;
                        margin-bottom: 10px;
                        font-size: 26px;
                    }

                    h3 {
                        color: #ff5fa2;
                        font-size: 22px;
                        margin-bottom: 5px;
                    }

                    .section {
                        background: #ffffffaa;
                        backdrop-filter: blur(8px);
                        padding: 20px;
                        border-radius: 20px;
                        box-shadow: 0 4px 10px rgba(255, 105, 180, 0.2);
                        margin-bottom: 25px;
                        transition: transform 0.3s ease;
                    }

                    .section:hover {
                        transform: scale(1.02);
                    }

                    ul {
                        padding-left: 20px;
                    }

                    li {
                        background: #ffe0ec;
                        padding: 10px;
                        margin-bottom: 8px;
                        border-radius: 12px;
                        color: #b84474;
                        font-weight: bold;
                        transition: 0.3s;
                    }

                    li:hover {
                        background: #ffbcd6;
                        transform: translateX(5px);
                    }

                    p {
                        font-size: 18px;
                        margin-bottom: 6px;
                    }

                    .card-title {
                        background: #ffbad9;
                        padding: 5px 10px;
                        display: inline-block;
                        border-radius: 10px;
                    }
                </style>
            </head>

            <body>

                <h1>DAYAO's PORTFOLIO</h1>

                <div class="section">
                    <h2>My Information</h2>
                    <p><b>Name:</b> 
                    <xsl:text> </xsl:text>
                        <span>
                            <xsl:value-of select="portfolio/student/firstname"/> 
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="portfolio/student/lastname"/>
                        </span>
                    </p>
                    <p><b>Course:</b> <xsl:text> </xsl:text> <xsl:value-of select="portfolio/student/course"/></p>
                    <p><b>Year Level:</b> <xsl:text> </xsl:text> <xsl:value-of select="portfolio/student/yearlevel"/></p>
                </div>

                <div class="section">
                    <h2>Skills</h2>
                    <ul>
                        <xsl:for-each select="portfolio/skills/skill">
                        <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </div>

                <div class="section">
                    <h2>Contact Me</h2>
                    <p><b>Email:</b> <xsl:text> </xsl:text> <xsl:value-of select="portfolio/contact/email"/></p>
                    <p><b>Phone:</b> <xsl:text> </xsl:text> <xsl:value-of select="portfolio/contact/phone"/></p>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
