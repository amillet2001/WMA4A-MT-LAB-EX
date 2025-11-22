<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Student Portfolio - <xsl:value-of select="portfolio/student/name"/></title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333333;
            margin: 20px;
          }
          h1 {
            color: #343a69ff;
            font-weight: bold;
            border-bottom: 2px solid #1a237e;
            padding-bottom: 5px;
          }
          h2 {
            color: #ff8400ff;
            margin-top: 25px;
          }
          p {
            margin: 5px 0;
            font-size: 18px;
          }
          table {
            border-collapse: collapse;
            width: 30%;
            margin-top: 10px;
          }
          th, td {
            border: 1px solid #ccc;
            padding: 8px 12px;
            text-align: left;
          }
          th {
            background-color: #8b7b5aff;
            color: white;
          }
          td.skill-cell {
            background-color: #e8eaf6;
            color: #333;
          }
          td.project-cell {
            background-color: #f9f3e7;
            color: #333;
          }
          .project-title {
            font-weight: bold;
            color: #ff8d1cff;
          }
        </style>
      </head>

      <body>
        <h1><xsl:value-of select="portfolio/student/name"/></h1>
        <p><b>Age:</b> <xsl:value-of select="portfolio/student/age"/></p>
        <p><b>Course:</b> <xsl:value-of select="portfolio/student/course"/></p>
        <p><b>Year:</b> <xsl:value-of select="portfolio/student/year"/></p>

        <h2>Skills</h2>
        <table>
          <tr>
            <th>Skill</th>
          </tr>
          <xsl:for-each select="portfolio/student/skills/skill">
            <tr>
              <td class="skill-cell"><xsl:value-of select="."/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>Projects</h2>
        <table>
          <tr>
            <th>Project Title</th>
            <th>Description</th>
          </tr>
          <xsl:for-each select="portfolio/student/projects/project">
            <tr>
              <td class="project-cell"><xsl:value-of select="title"/></td>
              <td class="project-cell"><xsl:value-of select="description"/></td>
            </tr>
          </xsl:for-each>
        </table>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
