<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/studentPortfolio">
    <html>
      <head>
        <meta charset="utf-8"/>
        <title>
          <xsl:value-of select="student/name/first"/> <xsl:text> </xsl:text>
          <xsl:value-of select="student/name/last"/> Portfolio
        </title>

        <style>
          body { font-family: Arial, sans-serif; margin: 24px; }
          header { margin-bottom: 18px; }
          h1 { margin: 0; font-size: 28px; }
          .contact { margin-top: 6px; color: #444; }
          section { margin-top: 18px; }
          .skills span { display: inline-block; margin-right: 8px; padding: 4px 8px; border-radius: 6px; border: 1px solid #ddd; }
          .project { margin-bottom: 12px; padding-bottom: 8px; border-bottom: 1px dashed #eee; }
          .label { font-weight: bold; }
        </style>
      </head>

      <body>
        <header>
          <h1>
            <xsl:value-of select="student/name/first"/> <xsl:text> </xsl:text>
            <xsl:value-of select="student/name/last"/>
          </h1>

          <div class="contact">
            <xsl:value-of select="student/contact/email"/> |
            <xsl:value-of select="student/contact/phone"/>
            <xsl:if test="student/contact/address">
              <xsl:text> | </xsl:text>
              <xsl:value-of select="concat(student/contact/address/city, ', ', student/contact/address/country)"/>
            </xsl:if>
          </div>

        
          <div class="studentID">
           <xsl:text> Student ID:  </xsl:text>
            <xsl:value-of select="student/studentID/studID"/>
          </div>

          <div class="summary">
          
            <xsl:value-of select="student/summary"/>
          </div>
        </header>

        <section id="education">
          <h2>Education</h2>
          <xsl:for-each select="student/education/degree">
            <div>
              <div class="label"><xsl:value-of select="level"/></div>
              <div>
                <xsl:value-of select="school"/>
                <xsl:if test="year">(<xsl:value-of select="year"/>)</xsl:if>
              </div>
            </div>
          </xsl:for-each>
        </section>

        <section id="skills">
          <h2>Skills</h2>
          <div class="skills">
            <xsl:for-each select="student/skills/skill">
              <span>
                <xsl:value-of select="."/>
                <xsl:text> </xsl:text>
                <xsl:if test="@level">(<xsl:value-of select="@level"/>)</xsl:if>
              </span>
            </xsl:for-each>
          </div>
        </section>

        <section id="projects">
          <h2>Projects</h2>
          <xsl:for-each select="student/projects/project">
            <div class="project">
              <div class="label"><xsl:value-of select="title"/></div>
              <div><xsl:value-of select="description"/></div>
              <div>
                <xsl:value-of select="role"/>
                <xsl:if test="link"> <a href="{link}" target="_blank">view</a></xsl:if>
              </div>
              <div>
                <xsl:if test="year">Year: <xsl:value-of select="year"/></xsl:if>
              </div>
            </div>
          </xsl:for-each>
        </section>

        <section id="awards">
          <h2>Awards</h2>
          <xsl:for-each select="student/awards/award">
            <div>
              <div class="label"><xsl:value-of select="title"/></div>
              <div>
                <xsl:if test="issuer">Issuer: <xsl:value-of select="issuer"/></xsl:if>
                <xsl:if test="year"> | <xsl:value-of select="year"/></xsl:if>
              </div>
            </div>
          </xsl:for-each>
        </section>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
