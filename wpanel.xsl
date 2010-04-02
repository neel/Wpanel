<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="xml" version="1.0" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" indent="yes"/>
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

	<xsl:template match="window">
		<div class="x-panel-window">
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
				<div class="x-panel-titlebar">
					<div class="x-panel-_lsub">
						<div class="x-panel-_rsub">
							<div class="x-panel-_msub">
								<xsl:if test="@minimizable='on' or @maximizable='on' or @closable='on'">
									<div class="x-panel-_csub">
										<xsl:if test="@closable='on'">
											<div class="x-panel-_cntrl x-panel-_ccl"></div>
										</xsl:if>
										<xsl:if test="@maximizable='on'">
											<div class="x-panel-_cntrl x-panel-_cmx"></div>
										</xsl:if>
										<xsl:if test="@minimizable='on'">
											<div class="x-panel-_cntrl x-panel-_cmn"></div>
										</xsl:if>
										<xsl:value-of select="@title" />
									</div>
								</xsl:if>
							</div>
						</div>
					</div>
				</div>
			</xsl:if>
			<div class="x-panel-viewport">
				<xsl:attribute name="style">
					height: <xsl:value-of select="$windowHeight - 29" />px;
					<xsl:value-of select="$windowStyle" />
				</xsl:attribute>
				<xsl:apply-templates />
			</div>
		</div>
	</xsl:template>

	<xsl:template match="layout">
		<div>
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
		</div>
	</xsl:template>

	<xsl:template match="QButton">
		<div class="x-panel-widget x-panel-widget-button">
			<xsl:value-of select="@text" />
		</div>
	</xsl:template>

	<xsl:template match="QLineEdit">
		<input type="text" class="x-panel-widget x-panel-widget-lineedit">
			<xsl:attribute name="value">
				<xsl:value-of select="@value" />
			</xsl:attribute>
		</input>
	</xsl:template>

	<xsl:template match="QLabel">
		<div class="x-panel-widget x-panel-widget-label">
			<xsl:apply-templates />
		</div>
	</xsl:template>

</xsl:stylesheet>
