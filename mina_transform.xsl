<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Student Portfolio</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background: #f2f4f7;
                        margin: 0;
                        padding: 20px;
                    }

                    .header {
                        background: #211ee5ff;
                        color: white;
                        padding: 20px;
                        text-align: center;
                        font-size: 28px;
                        font-weight: bold;
                        border-radius: 10px;
                        margin-bottom: 30px;
                    }

                    .card {
                        background: white;
                        padding: 25px;
                        border-radius: 12px;
                        box-shadow: 0 6px 12px rgba(0,0,0,0.1);
                        margin-bottom: 30px;
                        width: 65%;
                        margin-left: auto;
                        margin-right: auto;
                    }

                    .card h2 {
                        color: #1e88e5;
                        margin-top: 0;
                        border-left: 4px solid #1e88e5;
                        padding-left: 10px;
                    }

                    .subcard {
                        background: #fafafa;
                        border: 1px solid #ddd;
                        padding: 15px;
                        border-radius: 8px;
                        margin-bottom: 12px;
                        box-shadow: 0 2px 5px rgba(0,0,0,0.08);
                        font-size: 18px;
                    }

                    .label {
                        font-weight: bold;
                        color: #444;
                    }

                </style>
            </head>

            <body>
                <div class="header">Student Portfolio</div>

                <div class="card">
                    <h2>Basic Information</h2>

                    <div class="subcard"><span class="label">Name:</span> <xsl:value-of select="student/fullname"/></div>
                    <div class="subcard"><span class="label">Age:</span> <xsl:value-of select="student/age"/></div>
                    <div class="subcard"><span class="label">Address:</span> <xsl:value-of select="student/address"/></div>
                    <div class="subcard"><span class="label">Course:</span> <xsl:value-of select="student/course"/></div>
                    <div class="subcard"><span class="label">Year Level:</span> <xsl:value-of select="student/yearlevel"/></div>
                    <div class="subcard"><span class="label">Student Number:</span> <xsl:value-of select="student/studentID"/></div>
                    <div class="subcard"><span class="label">Phone:</span> <xsl:value-of select="student/phone"/></div>
                    <div class="subcard"><span class="label">Email:</span> <xsl:value-of select="student/email"/></div>
                    
                </div>

                <div class="card">
                    <h2>Skills</h2>
                    <xsl:for-each select="student/skills/skill">
                        <div class="subcard">
                            <xsl:value-of select="." />
                        </div>
                    </xsl:for-each>
                </div>

                <div class="card">
                    <h2>Hobbies</h2>
                    <xsl:for-each select="student/hobbies/hobby">
                        <div class="subcard">
                            <xsl:value-of select="." />
                        </div>
                    </xsl:for-each>
                </div>

                <div class="card">
                    <h2>Motto</h2>
                    <div class="subcard">
                        <xsl:value-of select="student/motto" />
                    </div>
                </div>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
