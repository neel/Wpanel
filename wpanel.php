<?php
	header("Content-Type: application/xhtml+xml");
?>
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xml" href="wpanel.xsl" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
			xmlns:bong="http://bong/glob/wpanel"
			xml:lang="en"
			lang="en">
	<head>
		<title> Transitional DTD XHTML Example </title>
		<link rel="stylesheet" type="text/css" href="wpanel.css" />
	</head>

	<body>
		<b>Hallo World</b>
		<bong:window closable="on" minimizable="on" maximizable="on" width="300" height="150" title="Hallo World" titlebar="on" draggable="true" style="left: 0px;top: 0px">
			<bong:layout type="vbox">
				<bong:layout type="hbox">
					<bong:QLabel>Name</bong:QLabel>
					<bong:QLineEdit value="Neel Basu"></bong:QLineEdit>
				</bong:layout>
				<bong:layout type="hbox">
					<bong:QLabel>Age</bong:QLabel>
					<bong:QLineEdit value="22"></bong:QLineEdit>
				</bong:layout>
				<bong:layout type="hbox">
					<bong:QButton text="Submit"></bong:QButton>
					<bong:QButton text="Reset"></bong:QButton>
				</bong:layout>
			</bong:layout>
		</bong:window>
		<div class="x-panel-viewport"></div>
	</body>
</html>