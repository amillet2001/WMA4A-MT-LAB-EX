<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Ligsay Activity 2</title>
        <style>
          table{
            border-collapse: collapse;
            width: 60%;
            margin-bottom: 20px;
          }
          th, td{
            border: 1px solid black;
            padding: 8px;
          }
          th{
            background-color: #eee;
            text-align: left;
          }
        </style>
      </head>

      <body>
        <h1>Student Portfolio</h1>

        <h3>Student Information</h3>
        <table>
          <tr>
            <th>Name</th>
            <td>
              <h2>
                <xsl:value-of select="studentPortfolio/student/name/firstName"/> 
                <xsl:text> </xsl:text>
                <xsl:value-of select="studentPortfolio/student/name/secondName"/> 
                <xsl:text> </xsl:text>
                <xsl:value-of select="studentPortfolio/student/name/middleName"/> 
                <xsl:text> </xsl:text>
                <xsl:value-of select="studentPortfolio/student/name/lastName"/>
              </h2>
            </td>
          </tr>
          <tr>
            <th>Student Number</th>
            <td><xsl:value-of select="studentPortfolio/student/studentNumber"/></td>
          </tr>
          <tr>
            <th>Email</th>
            <td><xsl:value-of select="studentPortfolio/student/studentEmail"/></td>
          </tr>
        </table>

        <h3>Course Details</h3>
        <table>
          <tr>
            <th>Program</th>
            <td><xsl:value-of select="studentPortfolio/student/course/program"/></td>
          </tr>
          <tr>
            <th>Major</th>
            <td><xsl:value-of select="studentPortfolio/student/course/major"/></td>
          </tr>
          <tr>
            <th>Year</th>
            <td><xsl:value-of select="studentPortfolio/student/course/year"/></td>
          </tr>
          <tr>
            <th>Section</th>
            <td><xsl:value-of select="studentPortfolio/student/course/section"/></td>
          </tr>
        </table>

        <h3>Skills</h3>
        <table>
          <tr>
            <th>Skill</th>
          </tr>
          <xsl:for-each select="studentPortfolio/student/skills/skill">
            <tr>
              <td><xsl:value-of select="."/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h3>Achievements</h3>
        <table>
          <tr>
            <th>Certificate</th>
            <td><xsl:value-of select="studentPortfolio/student/achievements/certificate"/></td>
          </tr>
        </table>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
