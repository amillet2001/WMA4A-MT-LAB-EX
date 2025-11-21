<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
        <head>
            <title>SHINA YABES PORTFOLIO</title>
            <style>
                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background-color: #1c1c1c;
                    color: #f5f5f5;
                    margin: 0;
                    padding: 0;
                }

                header {
                    background-color: #b30000;
                    text-align: center;
                    padding: 50px 0;
                    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
                }

                header h1 {
                    margin: 0;
                    font-size: 38px;
                    letter-spacing: 2px;
                }

                section {
                    max-width: 900px;
                    margin: 30px auto;
                    padding: 25px 30px;
                    background-color: #2a2a2a;
                    border-radius: 12px;
                    box-shadow: 0 4px 10px rgba(0,0,0,0.4);
                    transition: transform 0.3s, box-shadow 0.3s;
                }

                section:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 8px 20px rgba(255,0,0,0.6);
                }

                h2 {
                    color: #b30000;
                    border-bottom: 2px solid #b30000;
                    padding-bottom: 5px;
                }

                ul {
                    list-style-type: square;
                    padding-left: 20px;
                }

                footer {
                    text-align: center;
                    padding: 20px;
                    background-color: #b30000;
                    margin-top: 30px;
                }

                a {
                    color: #f5f5f5;
                    text-decoration: none;
                }

                a:hover {
                    text-decoration: underline;
                }

                .personal-info p {
                    margin: 5px 0;
                }
            </style>
        </head>

        <body>
            <header>
                <h1>SHINA YABES PORTFOLIO</h1>
            </header>

            <!-- About Me Section -->
            <section>
                <h2>About Me</h2>
                <p><xsl:value-of select="studentPortfolio/student/aboutMe"/></p>
                <div class="personal-info">
                    <p><strong>Address:</strong> <xsl:value-of select="studentPortfolio/student/personalInfo/address"/></p>
                    <p><strong>Birthdate:</strong> <xsl:value-of select="studentPortfolio/student/personalInfo/birthdate"/></p>
                    <p><strong>Status:</strong> <xsl:value-of select="studentPortfolio/student/personalInfo/status"/></p>
                    <p><strong>Citizenship:</strong> <xsl:value-of select="studentPortfolio/student/personalInfo/citizenship"/></p>
                    <p><strong>Language(s):</strong> <xsl:value-of select="studentPortfolio/student/personalInfo/languages"/></p>
                </div>
            </section>

            <!-- Skills Section -->
            <section>
                <h2>Skills</h2>
                <ul>
                    <xsl:for-each select="studentPortfolio/student/skills/skill">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </section>

            <!-- Contact Section -->
            <section>
                <h2>Contact</h2>
                <p>Email: <a>
                    <xsl:attribute name="href">
                        <xsl:text>mailto:</xsl:text>
                        <xsl:value-of select="studentPortfolio/student/email"/>
                    </xsl:attribute>
                    <xsl:value-of select="studentPortfolio/student/email"/>
                </a></p>
                <p>Phone: <xsl:value-of select="studentPortfolio/student/phone"/></p>
            </section>

            <footer>
                <p>&copy; SHINA YABES PORTFOLIO</p>
            </footer>
        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
