<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Maria's Portfolio</title>
            </head>

            <body>

                <h1><xsl:value-of select="portfolio/profile/name"/></h1>
                <p><em><xsl:value-of select="portfolio/profile/tagline"/></em></p>
                <p><xsl:value-of select="portfolio/profile/description"/></p>

                <div class="section">
                    <h2>Skills</h2>
                    <div class="skills">
                        <xsl:for-each select="portfolio/skills/skill">
                            <span>
                                <li><xsl:value-of select="."/></li>  
                            </span>
                        </xsl:for-each>
                    </div>
                </div>
                <hr/>
                <div class="section">
                    <h2>Leadership &amp; Project Experience</h2>
                    <h3><xsl:value-of select="portfolio/experiences/leadership/position"/></h3>
                    <p><xsl:value-of select="portfolio/experiences/leadership/institution"/><br/>
                        <xsl:value-of select="portfolio/experiences/leadership/details"/>
                    </p>

                    <h3>Projects</h3>
                    <xsl:for-each select="portfolio/experiences/leadership/projects/project">
                        <div class="project">
                            <strong><xsl:value-of select="title"/></strong><br/>
                            <em><xsl:value-of select="tech"/></em><br/>
                            <xsl:value-of select="summary"/>
                            <br/><br/>
                        </div>
                    </xsl:for-each>
                </div>
                <hr/>
                <div class="section">
                    <h2>Creative &amp; Media Experience</h2>
                    <h3><xsl:value-of select="portfolio/experiences/creative/position"/></h3>
                    <p><xsl:value-of select="portfolio/experiences/creative/institution"/> |
                        <xsl:value-of select="portfolio/experiences/creative/year"/>
                    </p>

                    <xsl:for-each select="portfolio/experiences/creative/works/work">
                        <div class="work">
                            <strong><xsl:value-of select="title"/></strong><br/>
                            <em><xsl:value-of select="software"/></em><br/>
                            <xsl:value-of select="summary"/>
                            <br/><br/>
                        </div>
                    </xsl:for-each>
                </div>
                <hr/>
                <div class="section">
                    <h2>My Learning Journey</h2>
                    <xsl:for-each select="portfolio/timeline/school">
                        <span>
                            <strong><xsl:value-of select="name"/></strong> –
                            <xsl:value-of select="level"/> |
                            <xsl:value-of select="location"/> (
                            <xsl:value-of select="years"/> )
                            <br/>
                        </span>
                    </xsl:for-each>
                </div>
                <hr/>
                <div class="section">
                    <h2>Contact</h2>
                    <p><xsl:value-of select="portfolio/contact/message"/></p>
                    <ul>
                        <xsl:for-each select="portfolio/contact/platform">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
