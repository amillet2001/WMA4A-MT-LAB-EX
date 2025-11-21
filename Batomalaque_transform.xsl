<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/portfolio">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Student Portfolio</title>

        <style>
          body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            padding: 30px;
          }

          .card {
            max-width: 750px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            display: flex;
            gap: 25px;
            flex-wrap: wrap;
          }

          .photo {
            width: 180px;
            height: 180px;
            border-radius: 12px;
            overflow: hidden;
            background: #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            color: #666;
          }
          .photo img { width:100%; height:100%; object-fit:cover; }

          .details { flex:1; min-width:260px; }

          h1 { margin-top:0; margin-bottom:8px; font-size:28px; color:#333; }

          .label { font-weight:bold; color:#555; }
          .section-title { margin-top:22px; margin-bottom:10px; font-size:20px; font-weight:600; }
          .skill {
            display:inline-block; padding:6px 10px; background:#e7f1ff; border-radius:5px; margin:4px; font-size:14px; border:1px solid #c7dcff;
          }
          .project-box {
            background:#f9f9f9; padding:12px; border-radius:8px; border:1px solid #e0e0e0; margin-top:10px;
          }

          /* CAROUSEL */
          .carousel {
            position: relative;
            width: 100%;
            max-width: 420px;
            margin: 20px auto;
            display: flex;
            justify-content: center;
          }

          input[type=radio] { display: none; }

          .slides .slide { display:none; width:100%; border-radius:8px; border:1px solid #ccc; }
          #s1:checked ~ .slides .img1,
          #s2:checked ~ .slides .img2,
          #s3:checked ~ .slides .img3 { display:block; }

          .arrow {
            cursor: pointer; font-size:26px; font-weight:bold; user-select:none;
            position:absolute; top:50%; transform:translateY(-50%); padding:6px 12px; background:#ffffffdd; border-radius:6px;
          }
          .arrow:hover { background:#fff; }
          .left { left:-40px; }
          .right { right:-40px; }

          /* Hide all arrow-sets by default */
          .arrow-set { display:none; }

          /* Show the arrow-set matching the checked radio via its id */
          #s1:checked ~ #as1 { display:block; }
          #s2:checked ~ #as2 { display:block; }
          #s3:checked ~ #as3 { display:block; }

          @media (max-width:550px){
            .left { left:-20px; } .right { right:-20px; } .carousel { max-width:300px; }
          }
        </style>

      </head>

      <body>
        <div class="card">
          <xsl:apply-templates select="student"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="student">
    <!-- PHOTO -->
    <div class="photo">
      <xsl:choose>
        <xsl:when test="contact/photo">
          <img>
            <xsl:attribute name="src"><xsl:value-of select="contact/photo"/></xsl:attribute>
          </img>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring(name/first,1,1)"/><xsl:value-of select="substring(name/last,1,1)"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>

    <!-- DETAILS -->
    <div class="details">
      <h1><xsl:value-of select="name/first"/><xsl:text> </xsl:text><xsl:value-of select="name/last"/></h1>
      <p><span class="label">ID:</span> <xsl:value-of select="@id"/></p>
      <p><span class="label">Email:</span> <xsl:value-of select="contact/email"/></p>

      <div class="section-title">Skills</div>
      <div>
        <xsl:for-each select="skills/skill[string-length(normalize-space()) > 0]">
          <span class="skill"><xsl:value-of select="."/></span>
        </xsl:for-each>
      </div>

      <div class="section-title">Project</div>
      <div class="project-box">
        <p><span class="label">Title:</span> <xsl:value-of select="project/title"/></p>
        <p><span class="label">Year:</span> <xsl:value-of select="project/year"/></p>

        <!-- CAROUSEL -->
        <div class="carousel">
          <!-- radio buttons -->
          <input type="radio" name="slide" id="s1" checked="checked"/>
          <input type="radio" name="slide" id="s2"/>
          <input type="radio" name="slide" id="s3"/>

          <!-- slides -->
          <div class="slides">
            <img class="slide img1">
              <xsl:attribute name="src"><xsl:value-of select="project/images/img[1]"/></xsl:attribute>
            </img>
            <img class="slide img2">
              <xsl:attribute name="src"><xsl:value-of select="project/images/img[2]"/></xsl:attribute>
            </img>
            <img class="slide img3">
              <xsl:attribute name="src"><xsl:value-of select="project/images/img[3]"/></xsl:attribute>
            </img>
          </div>

          <!-- arrow sets with IDs -->
          <div class="arrow-set" id="as1">
            <label for="s3" class="arrow left">&#8592;</label>
            <label for="s2" class="arrow right">&#8594;</label>
          </div>

          <div class="arrow-set" id="as2">
            <label for="s1" class="arrow left">&#8592;</label>
            <label for="s3" class="arrow right">&#8594;</label>
          </div>

          <div class="arrow-set" id="as3">
            <label for="s2" class="arrow left">&#8592;</label>
            <label for="s1" class="arrow right">&#8594;</label>
          </div>

        </div><!-- /.carousel -->

      </div><!-- /.project-box -->
    </div><!-- /.details -->
  </xsl:template>

</xsl:stylesheet>
