<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Student Portfolio - John Torres</title>
                <style>
                    body {
                    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
                    line-height: 1.6;
                    margin: 0;
                    padding: 20px;
                    background-color: #1a1a1a;
                    color: #f0f0f0;
                    }
                    .container {
                    max-width: 1200px;
                    margin: 0 auto;
                    background: #2c2c2c;
                    padding: 30px;
                    border-radius: 10px;
                    box-shadow: 0 0 15px rgba(0,0,0,0.5);
                    }
                    .header {
                    text-align: center;
                    background: #4b0082;
                    color: white;
                    padding: 30px;
                    border-radius: 5px;
                    margin-bottom: 30px;
                    box-shadow: 0 0 10px rgba(0,0,0,0.4);
                    }
                    .section {
                    margin-bottom: 30px;
                    padding: 20px;
                    border-left: 4px solid #9b59b6;
                    background: #333333;
                    border-radius: 5px;
                    }
                    .section h2 {
                    color: #dcdcdc;
                    border-bottom: 2px solid #9b59b6;
                    padding-bottom: 10px;
                    }
                    .personal-info {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                    gap: 15px;
                    margin-top: 15px;
                    }
                    .info-item {
                    background: #3d3d3d;
                    padding: 10px;
                    border-radius: 5px;
                    border-left: 3px solid #9b59b6;
                    }
                    .skills-grid {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 20px;
                    }
                    .skill-item {
                    background: #3d3d3d;
                    margin: 5px 0;
                    padding: 8px;
                    border-radius: 3px;
                    display: flex;
                    justify-content: space-between;
                    color: #f0f0f0;
                    }
                    .project {
                    background: #3d3d3d;
                    margin: 15px 0;
                    padding: 15px;
                    border-radius: 5px;
                    border-left: 4px solid #8e44ad;
                    }
                    .status-Completed { color: #2ecc71; font-weight: bold; }
                    .status-InProgress { color: #f1c40f; font-weight: bold; }
                    .certification {
                    background: #3d3d3d;
                    margin: 10px 0;
                    padding: 12px;
                    border-radius: 5px;
                    border-left: 4px solid #9b59b6;
                    }
                    .contact-links a {
                    display: inline-block;
                    margin: 5px 15px 5px 0;
                    padding: 8px 15px;
                    background: #9b59b6;
                    color: white;
                    text-decoration: none;
                    border-radius: 3px;
                    transition: background 0.3s;
                    }
                    .contact-links a:hover {
                    background: #6c3483;
                    }
                    .proficiency-Beginner { color: #e74c3c; }
                    .proficiency-Intermediate { color: #f39c12; }
                    .proficiency-Advanced { color: #2ecc71; }
                    .proficiency-Expert { color: #9b59b6; }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <h1>Student Portfolio</h1>
                        <h2><xsl:value-of select="student_portfolio/student_info/personal_details/name"/></h2>
                        <p><xsl:value-of select="student_portfolio/student_info/personal_details/course"/></p>
                    </div>
                    
                    <!-- Student Information Section -->
                    <div class="section">
                        <h2>Student Information</h2>
                        <div class="personal-info">
                            <div class="info-item">
                                <strong>Student Name:</strong> <xsl:value-of select="student_portfolio/student_info/personal_details/student_name"/>
                            </div>
                            <div class="info-item">
                                <strong>Year Level:</strong> <xsl:value-of select="student_portfolio/student_info/personal_details/year_level"/>
                            </div>
                            <div class="info-item">
                                <strong>Email:</strong> <xsl:value-of select="student_portfolio/student_info/personal_details/email"/>
                            </div>
                            <div class="info-item">
                                <strong>Phone:</strong> <xsl:value-of select="student_portfolio/student_info/personal_details/phone"/>
                            </div>
                            <div class="info-item">
                                <strong>Address:</strong> 
                                <xsl:value-of select="student_portfolio/student_info/personal_details/address/street"/>, 
                                <xsl:value-of select="student_portfolio/student_info/personal_details/address/city"/>, 
                                <xsl:value-of select="student_portfolio/student_info/personal_details/address/country"/>
                            </div>
                        </div>
                        
                        <h3 style="margin-top: 20px;">Academic Background</h3>
                        <div class="personal-info">
                            <div class="info-item">
                                <strong>GPA:</strong> <xsl:value-of select="student_portfolio/student_info/academic_background/gpa"/>
                            </div>
                            <div class="info-item">
                                <strong>Units Completed:</strong> <xsl:value-of select="student_portfolio/student_info/academic_background/units_completed"/>
                            </div>
                            <xsl:if test="student_portfolio/student_info/academic_background/honors">
                                <div class="info-item">
                                    <strong>Honors:</strong> <xsl:value-of select="student_portfolio/student_info/academic_background/honors"/>
                                </div>
                            </xsl:if>
                        </div>
                    </div>
                    
                    <!-- Skills Section -->
                    <div class="section">
                        <h2>Skills</h2>
                        <div class="skills-grid">
                            <div>
                                <h3>Technical Skills</h3>
                                <xsl:for-each select="student_portfolio/skills/technical_skills/tech_skill">
                                    <div class="skill-item">
                                        <span><xsl:value-of select="skill_name"/> (<xsl:value-of select="@category"/>)</span>
                                        <span class="proficiency-{translate(proficiency, ' ', '')}">
                                            <xsl:value-of select="proficiency"/>
                                        </span>
                                    </div>
                                </xsl:for-each>
                            </div>
                            <div>
                                <h3>Soft Skills</h3>
                                <xsl:for-each select="student_portfolio/skills/soft_skills/soft_skill">
                                    <div class="skill-item">
                                        <xsl:value-of select="."/>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- Projects Section -->
                    <div class="section">
                        <h2>Projects</h2>
                        <xsl:for-each select="student_portfolio/projects/project">
                            <div class="project">
                                <h3><xsl:value-of select="title"/></h3>
                                <p><xsl:value-of select="description"/></p>
                                <p><strong>Technologies:</strong> 
                                    <xsl:for-each select="technologies/technology">
                                        <xsl:value-of select="."/>
                                        <xsl:if test="position() != last()">, </xsl:if>
                                    </xsl:for-each>
                                </p>
                                <p><strong>Date Completed:</strong> <xsl:value-of select="date_completed"/></p>
                                <p>
                                    <strong>Status:</strong> 
                                    <span class="status-{translate(status, ' ', '')}">
                                        <xsl:value-of select="status"/>
                                    </span>
                                </p>
                            </div>
                        </xsl:for-each>
                    </div>
                    
                    <!-- Contact Information -->
                    <div class="section">
                        <h2>Contact Information</h2>
                        <div class="contact-links">
                            <xsl:if test="student_portfolio/contact_info/github">
                                <a href="https://{student_portfolio/contact_info/github}" target="_blank">
                                    GitHub: <xsl:value-of select="student_portfolio/contact_info/github"/>
                                </a>
                            </xsl:if>
                            <xsl:if test="student_portfolio/contact_info/linkedin">
                                <a href="https://{student_portfolio/contact_info/linkedin}" target="_blank">
                                    LinkedIn: <xsl:value-of select="student_portfolio/contact_info/linkedin"/>
                                </a>
                            </xsl:if>
                            <xsl:if test="student_portfolio/contact_info/portfolio">
                                <a href="https://{student_portfolio/contact_info/portfolio}" target="_blank">
                                    Portfolio: <xsl:value-of select="student_portfolio/contact_info/portfolio"/>
                                </a>
                            </xsl:if>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
