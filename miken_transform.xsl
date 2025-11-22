<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/studentPortfolio">
    <html>
      <head>
        <title>
          <xsl:value-of select="personal/firstName"/> <xsl:value-of select="personal/lastName"/> — Portfolio
        </title>
        <meta charset="utf-8"/>
        <style>
          body { font-family: Arial, Helvetica, sans-serif; margin: 24px; }
          header { border-bottom: 2px solid #444; padding-bottom: 10px; margin-bottom: 18px; }
          h1 { margin: 0; }
          .section { margin-bottom: 18px; }
          .sub { color: #666; font-size: 0.95em; margin-bottom: 8px; }
          .card { border: 1px solid #ddd; padding: 12px; border-radius: 6px; margin-bottom: 8px; }
          .small { font-size: 0.9em; color:#333; }
          .tech { font-style: italic; }
          a { color: #1a59b8; text-decoration: none; }
        </style>
      </head>
      <body>
        <header>
          <h1><xsl:value-of select="personal/firstName"/> <xsl:value-of select="personal/lastName"/></h1>
          <div class="sub">
            <xsl:value-of select="personal/email"/> |
            <xsl:value-of select="personal/phone"/>
          </div>
          <div class="small"><xsl:value-of select="personal/summary"/></div>
        </header>

        <div class="section">
          <h2>Education</h2>
          <xsl:for-each select="education/degree">
            <div class="card">
              <strong><xsl:value-of select="level"/></strong> — <xsl:value-of select="institution"/>
              <div class="small">
                <xsl:if test="startDate">
                  <xsl:value-of select="startDate"/>
                </xsl:if>
                <xsl:if test="endDate">
                  <span> — </span><xsl:value-of select="endDate"/>
                </xsl:if>
                <xsl:if test="gpa">
                  <span> | GPA: <xsl:value-of select="gpa"/></span>
                </xsl:if>
              </div>
            </div>
          </xsl:for-each>
        </div>

        <div class="section">
          <h2>Courses</h2>
          <ul>
            <xsl:for-each select="courses/course">
              <li><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
        </div>

        <div class="section">
          <h2>Projects</h2>
          <xsl:for-each select="projects/project">
            <div class="card">
              <strong><xsl:value-of select="title"/></strong>
              <div class="small"><xsl:value-of select="description"/></div>
              <div class="small tech">
                <xsl:if test="technologies">Tech: <xsl:value-of select="technologies"/></xsl:if>
                <xsl:if test="year"> | <xsl:value-of select="year"/></xsl:if>
              </div>
              <div>
                <xsl:if test="link">
                  <a href="{link}" target="_blank">Project link</a>
                </xsl:if>
              </div>
            </div>
          </xsl:for-each>
        </div>

        <div class="section">
          <h2>Skills</h2>
          <xsl:for-each select="skills/skill">
            <span class="card small" style="display:inline-block; margin-right:8px;">
              <strong><xsl:value-of select="."/></strong>
              <xsl:if test="@level"> (<xsl:value-of select="@level"/>)</xsl:if>
            </span>
          </xsl:for-each>
        </div>

        <div class="section">
          <h2>Awards</h2>
          <xsl:for-each select="awards/award">
            <div class="card">
              <strong><xsl:value-of select="title"/></strong>
              <div class="small">
                <xsl:if test="year">Year: <xsl:value-of select="year"/></xsl:if>
                <div><xsl:value-of select="description"/></div>
              </div>
            </div>
          </xsl:for-each>
        </div>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
