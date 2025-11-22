<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/portfolio">
        <html>
        <head>
            <title>Rodrigueza Portfolio</title>
            <meta charset="UTF-8"/>
            <style>
                body {
                    font-family: 'Segoe UI', Arial, sans-serif;
                    background: linear-gradient(135deg, #141E30, #243B55);
                    color: #fff;
                    padding: 40px;
                    margin: 0;
                }
                .container {
                    max-width: 900px;
                    margin: auto;
                    background: rgba(255,255,255,0.1);
                    padding: 30px;
                    border-radius: 15px;
                    backdrop-filter: blur(10px);
                    box-shadow: 0 0 20px rgba(0,0,0,0.3);
                }
                h1, h2 {
                    border-bottom: 2px solid #00c6ff;
                    padding-bottom: 10px;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                }
                .card {
                    background: rgba(255,255,255,0.15);
                    padding: 20px;
                    border-radius: 10px;
                    margin-bottom: 15px;
                }
                .tagline {
                    font-style: italic;
                    font-size: 1.2em;
                    margin-bottom: 20px;
                }
                .skill-badge {
                    display: inline-block;
                    padding: 8px 12px;
                    margin: 5px;
                    background: #00c6ff;
                    color: #000;
                    border-radius: 20px;
                    font-weight: bold;
                }
            </style>
        </head>

        <body>
            <div class="container">

                <h1>
                    <xsl:value-of select="profile/firstname"/> 
                    <xsl:text> </xsl:text> 
                    <xsl:value-of select="profile/lastname"/>
                </h1>

                <div class="tagline">
                    🌟 <xsl:value-of select="profile/tagline"/> 🌟
                </div>

                <div class="card">
                    <h2>Profile</h2>
                    <p><strong>ID:</strong> <xsl:value-of select="profile/studentID"/></p>
                    <p><strong>Program:</strong> <xsl:value-of select="profile/program"/></p>
                    <p><strong>Year Level:</strong> <xsl:value-of select="profile/yearLevel"/></p>
                    <p><strong>Email:</strong> <xsl:value-of select="profile/contact/email"/></p>
                </div>

                <div class="card">
                    <h2>Showcase Projects</h2>
                    <xsl:for-each select="showcase/project">
                        <div style="margin-bottom: 20px;">
                            <h3>🚀 <xsl:value-of select="title"/></h3>
                            <p><xsl:value-of select="summary"/></p>
                            <p><strong>Year:</strong> <xsl:value-of select="year"/></p>
                        </div>
                    </xsl:for-each>
                </div>

                <div class="card">
                    <h2>Skills</h2>
                    <xsl:for-each select="skills/skill">
                        <span class="skill-badge">
                            <xsl:value-of select="."/> — <xsl:value-of select="@level"/>
                        </span>
                    </xsl:for-each>
                </div>

                <div class="card">
                    <h2>Academic Background</h2>
                    <xsl:for-each select="academicBackground/education">
                        <p>
                            🎓 <strong><xsl:value-of select="@level"/></strong><br/>
                            <strong>School:</strong> <xsl:value-of select="school"/><br/>
                            <strong>Years:</strong> 
                            <xsl:value-of select="yearStart"/> - <xsl:value-of select="yearEnd"/><br/>

                            <xsl:if test="program">
                                <strong>Program:</strong> <xsl:value-of select="program"/><br/>
                            </xsl:if>

                            <xsl:if test="strand">
                                <strong>Strand:</strong> <xsl:value-of select="strand"/><br/>
                            </xsl:if>
                        </p>
                    </xsl:for-each>
                </div>

            </div>
        </body>

        </html>
    </xsl:template>

</xsl:stylesheet>
