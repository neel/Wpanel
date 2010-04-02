<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
								xmlns:xhtml="http://www.w3.org/1999/xhtml"
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:bong="http://bong/glob/wpanel"
								xmlns:fn="http://www.w3.org/2005/xpath-functions" >
<xsl:output method="xml"
						version="1.0"
						encoding="UTF-8"
						indent="yes" />
<xsl:strip-space elements="bong:*" />
<!--
	<xsl:template match="/">
		<html>
			<head>
				<title>Page Title</title>
				<link rel="stylesheet" type="text/css" href="wpanel.css" />
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
-->

  <xsl:template match="*|@*">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="processing-instruction()|comment()">
    <xsl:copy>.</xsl:copy>
  </xsl:template>

	<xsl:template match="bong:window">
		<xhtml:div class="x-panel-window">
			<xsl:attribute name="style">
				height: <xsl:value-of select="@height" />px;
				width:  <xsl:value-of select="@width" />px;
			</xsl:attribute>
			<xsl:variable name="windowHeight">
				<xsl:value-of select="@height" />
			</xsl:variable>
			<xsl:variable name="windowStyle">
				<xsl:value-of select="@style" />;
			</xsl:variable>
<!--
			<xsl:if test="matches($windowStyle, 'left\s*\:\s*(\d+)')">
				<xsl:variable name="__left_start">

				</xsl:variable>
			</xsl:if>
-->
			<xsl:if test="@titlebar='on'">
				<xhtml:div class="x-panel-titlebar">
					<xhtml:div class="x-panel-_lsub">
						<xhtml:div class="x-panel-_rsub">
							<xhtml:div class="x-panel-_msub">
								<xsl:if test="@minimizable='on' or @maximizable='on' or @closable='on'">
									<xhtml:div class="x-panel-_csub">
										<xsl:if test="@closable='on'">
											<xhtml:div class="x-panel-_cntrl x-panel-_ccl"></xhtml:div>
										</xsl:if>
										<xsl:if test="@maximizable='on'">
											<xhtml:div class="x-panel-_cntrl x-panel-_cmx"></xhtml:div>
										</xsl:if>
										<xsl:if test="@minimizable='on'">
											<xhtml:div class="x-panel-_cntrl x-panel-_cmn"></xhtml:div>
										</xsl:if>
										<xsl:value-of select="@title" />
									</xhtml:div>
								</xsl:if>
							</xhtml:div>
						</xhtml:div>
					</xhtml:div>
				</xhtml:div>
			</xsl:if>
			<xhtml:div class="x-panel-viewport">
				<xsl:attribute name="style">
					height: <xsl:value-of select="$windowHeight - 29" />px;
					<xsl:value-of select="$windowStyle" />
				</xsl:attribute>
				<xsl:apply-templates />
			</xhtml:div>
		</xhtml:div>
	</xsl:template>

	<xsl:template match="bong:layout">
		<xhtml:div>
			<xsl:attribute name="class">
				x-panel-_layout
				<xsl:choose>
					<xsl:when test="@type = 'hbox'">
						x-panel-_layout-hbox
					</xsl:when>
					<xsl:when test="@type = 'vbox'">
						x-panel-_layout-vbox
					</xsl:when>
					<xsl:when test="@type = 'absolute'">
						x-panel-_layout-absolute
					</xsl:when>
					<xsl:when test="@type = 'grid'">
						x-panel-_layout-grid
					</xsl:when>
				</xsl:choose>
			</xsl:attribute>

			<xsl:attribute name="style">
				<xsl:choose>
					<xsl:when test="@type = 'hbox'">
						height: <xsl:value-of select="@size" />px;
					</xsl:when>
					<xsl:when test="@type = 'vbox'">
						width: <xsl:value-of select="@size" />px;
					</xsl:when>
					<xsl:when test="@type = 'absolute'">
						
					</xsl:when>
					<xsl:when test="@type = 'grid'">
						
					</xsl:when>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates />
		</xhtml:div>
	</xsl:template>

	<xsl:template match="bong:QButton">
		<xhtml:div class="x-panel-widget x-panel-widget-button">
			<xsl:value-of select="@text" />
		</xhtml:div>
	</xsl:template>

	<xsl:template match="bong:QLineEdit">
		<xhtml:input type="text" class="x-panel-widget x-panel-widget-lineedit">
			<xsl:attribute name="value">
				<xsl:value-of select="@value" />
			</xsl:attribute>
		</xhtml:input>
	</xsl:template>

	<xsl:template match="bong:QLabel">
		<xhtml:div class="x-panel-widget x-panel-widget-label">
			<xsl:apply-templates />
		</xhtml:div>
	</xsl:template>

</xsl:stylesheet>
