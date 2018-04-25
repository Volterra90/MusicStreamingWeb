<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>
<c:set var="usuario" value="${sessionScope.user}" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicStreaming - Life's Music</title>
<link rel="stylesheet" type="text/css"
	href="<c:out value="${pageContext.servletContext.contextPath}" />/css/css_index_usuario_rexistrado.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}" />/css/fontawesome-stars.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

<script>

	$(document).ready(function() {
		$('.votacion').change(function(event) {
			var nota = this.value;
			console.log(nota);
			idContido = $(this).attr('id');
			var idUsuario = '<c:out value="${usuario.idUsuario}"/>';
			console.log(idUsuario);
			$.post('VoteSongServlet', {
				"nota" : nota,
				"idContido" : idContido,
				"idUsuario" : idUsuario
			}, function(responseText) {
				$('#media'+idContido).html(responseText);
			});
		});
	});
</script>
</head>
<body>
	<div id="contenedor">
		<header>
			<div>
				<a href="<c:out value="${pageContext.servletContext.contextPath}" />/IndexServlet"><img
					src="<c:out value="${pageContext.servletContext.contextPath}" />/img/home-icon.png" id="home" /></a> 
			</div>
			<div></div>
			<div></div>
			<div>
				<%@include file="/html/user/user-profile.jsp"%>
				<a href="<c:out value="${pageContext.servletContext.contextPath}" />/SignOutServlet"> <img
					src="<c:out value="${pageContext.servletContext.contextPath}" />/img/logout.png" id="signout-logo" />
				</a>
				<%@include file="/html/user/languages.jsp"%>
			</div>
		</header>
		<nav>
			<%@include file="/html/content/content-search.jsp"%>
		</nav>
		<section>
		<p class="error"><c:if test="${not empty error}"><fmt:message key="${error}" bundle="${messages}"/></c:if></p>