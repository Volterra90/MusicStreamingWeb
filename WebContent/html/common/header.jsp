<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicStreaming - Life's Music</title>
<link rel="stylesheet" type="text/css"
	href="/MusicStreamingWeb/css/css_index_usuario_rexistrado.css">
</head>
<body>
	<div id="contenedor">
		<header>
			<div>
				<a href="/MusicStreamingWeb/IndexServlet"><img src="/MusicStreamingWeb/img/home-icon.png" id="home" /></a> 
				<a href=""><fmt:message key="As_minhas_playlists" bundle="${messages}"/></a>
			</div>
			<div></div>
			<div></div>
			<div>
				<%@include file="/html/user/user-profile.jsp"%>
					<a href="/MusicStreamingWeb/SignOutServlet">
						<img src="/MusicStreamingWeb/img/logout.png" id="signout-logo"/>
					</a> 
				<%@include file="/html/user/languages.jsp"%>
			</div>
		</header>
		<nav>
			<%@include file="/html/content/content-search.jsp" %>
		</nav>
		<section>