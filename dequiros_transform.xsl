<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
        <head>
            <title>Dequiros Student Portfolio</title>
        </head>
        <body>

            <div>
                <h1>Dequiros Student Portfolio</h1>
                <table>
                    <tr>
                        <td><b>Name:</b></td>
                        <td>
                            <xsl:value-of select="student_portfolio/student/student_name/first_name"/> 
                            <xsl:value-of select="student_portfolio/student/student_name/second_name"/> 
                            <xsl:value-of select="student_portfolio/student/student_name/middle_name"/>
                            <xsl:value-of select="student_portfolio/student/student_name/last_name"/>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Student ID:</b></td>
                        <td><xsl:value-of select="student_portfolio/student/student_number"/></td>
                    </tr>
                    <tr>
                        <td><b>Email:</b></td>
                        <td><xsl:value-of select="student_portfolio/student/student_email"/></td>
                    </tr>
                    <tr>
                        <td><b>Program:</b></td>
                        <td><xsl:value-of select="student_portfolio/student/student_course/program"/></td>
                    </tr>
                    <tr>
                        <td><b>Specialization:</b></td>
                        <td><xsl:value-of select="student_portfolio/student/student_course/specialization"/></td>
                    </tr>
                      <tr>
                        <td><b>Section:</b></td>
                        <td><xsl:value-of select="student_portfolio/student/student_course/section"/></td>
                    </tr>
                    <tr>
                        <td><b>Year Level:</b></td>
                        <td><xsl:value-of select="student_portfolio/student/student_course/year"/></td>
                    </tr>
                    <tr>
                        <td><b>College:</b></td>
                        <td><xsl:value-of select="student_portfolio/student/college"/></td>
                    </tr>
                    <tr>
                        <td><b>Date of Birth:</b></td>
                        <td><xsl:value-of select="student_portfolio/student/date_of_birth"/></td>
                    </tr>
                </table>
                <br/>
                <h2><b>What I Know:</b></h2>
                <ul>
                    <xsl:for-each select="student_portfolio/student/skills/skill">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>

            </div>

        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
