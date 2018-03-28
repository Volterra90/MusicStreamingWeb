<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicStreaming - Life's Music</title>
<link rel="stylesheet" type="text/css"
	href="../../css/css_index_usuario_rexistrado.css">
</head>
<body>
	<div id="contenedor">
		<header>
			<div>
				<a href="/MusicStreamingWeb/html/index/index.jsp"><img src="../../img/home-icon.png" id="home" /></a> 
				<a href="">AS MIÑAS PLAYLISTS</a>
			</div>
			<div></div>
			<div></div>
			<div>
				<%@include file="/html/user/user-profile.jsp"%>
					<a href="/MusicStreamingWeb/SignOutServlet">
						<img src="../../img/logout.png" id="signout-logo"/>
					</a> 
					<a href="">EN</a> | <a href="">GL</a>
			</div>
		</header>
		<nav>
			<%@include file="/html/content/content-search.jsp" %>
		</nav>
		<section>