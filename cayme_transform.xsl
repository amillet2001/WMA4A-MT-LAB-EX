<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/studentPortfolio">
    <html>
      <head>
        <meta charset="utf-8"/>

        <title>
          <xsl:value-of select="student/name/first"/> 
          <xsl:text> </xsl:text>
          <xsl:value-of select="student/name/last"/> Portfolio
        </title>
        <style>
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            margin: 40px; 
            background-color: #f4f7fa; 
            color: #333; 
            line-height: 1.6; 
        }
        header { 
            background-color: #007bff; 
            color: white; 
            padding: 20px; 
            border-radius: 8px; 
            margin-bottom: 20px; 
        }
        h1 { 
            margin: 0; 
            font-size: 32px; 
            font-weight: bold; 
        }
        .contact { 
            margin-top: 8px; 
            font-size: 16px; 
        }
        .studentID { 
            margin-top: 10px; 
            font-weight: bold; 
        }
        .summary { 
            margin-top: 15px; 
            font-style: italic; 
        }
        section { 
            margin-top: 30px; 
            background-color: white; 
            padding: 20px; 
            border-radius: 8px; 
            box-shadow: 0 2px 5px rgba(0,0,0,0.1); 
        }
        h2 { 
            color: #007bff; 
            border-bottom: 2px solid #007bff; 
            padding-bottom: 5px; 
        }
        .skills { 
            display: flex; 
            flex-wrap: wrap; 
            gap: 10px; 
        }
        .skills span { 
            background-color: #28a745; 
            color: white; 
            padding: 8px 12px; 
            border-radius: 20px; 
            font-size: 14px; 
            font-weight: bold; 
        }
        .skills span:hover { 
            background-color: #218838; 
        }
        </style>
      </head>

      <body>

        <header>
          <h1>
            <xsl:value-of select="student/name/first"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="student/name/last"/>
          </h1>

          <div class="contact">
            <xsl:value-of select="student/contact/email"/> |
            <xsl:value-of select="student/contact/phone"/>
          </div>

          <div class="studentID">
            <strong>Student ID:</strong> 
            <xsl:value-of select="student/studentID/studID"/>
          </div>

          <div class="summary" style="margin-top:10px;">
            <xsl:value-of select="student/summary"/>
          </div>
        </header>

        <section id="education">
          <h2>Education</h2>
          <xsl:for-each select="student/education/degree">
            <div>
              <strong><xsl:value-of select="level"/></strong><br/>
              <xsl:value-of select="school"/>
            </div>
          </xsl:for-each>
        </section>

        <section id="skills">
          <h2>Skills</h2>
          <div class="skills">
            <xsl:for-each select="student/skills/skill">
              <span><xsl:value-of select="."/></span>
            </xsl:for-each>
          </div>
        </section>

        <section id="awards">
          <h2>Awards</h2>
          <xsl:for-each select="student/awards/award">
            <div>
              <strong><xsl:value-of select="title"/></strong><br/>
              <xsl:if test="issuer">Issued by: <xsl:value-of select="issuer"/></xsl:if>
              <xsl:if test="year"> | <xsl:value-of select="year"/></xsl:if>
            </div>
          </xsl:for-each>
        </section>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
