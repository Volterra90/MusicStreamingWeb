<%@page import="com.musicstreaming.streaming.web.controller.AttributeNames"%>
<%@page import="com.musicstreaming.streaming.web.controller.ParameterNames"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>

<c:set var="error_user_name" value="${requestScope.error_user_name}" scope="page" />
<c:set var="error_password" value="${requestScope.error_password}" scope="page" />
<c:set var="error" value="${requestScope.error_nick}" scope="page" />
<c:set var="nome" value="${requestScope.nome}" scope="page" />
<c:set var="identification_error" value="${requestScope.identification_error}" scope="page" />
  
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>MusicStreaming - Life's Music</title>
        <link rel="stylesheet" type="text/css" href="/MusicStreamingWeb/css/css_index_no_login.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    </head>
    <body id="body_index_no_login">
        <div id="contenedor">
            <header>
                <img src="/MusicStreamingWeb/img/logo.png"/>
            </header>
            <section>
                <form action="/MusicStreamingWeb/UserServlet" method="POST">
                    <legend><strong><fmt:message key="Iniciar_sesion" bundle="${messages}"/></strong></legend>
                    <p class="error"><c:if test="${not empty identification_error}"><fmt:message key="${identification_error}" bundle="${messages}"/></c:if></p>
                    <p class="error"><c:if test="${not empty error}"><fmt:message key="${error}" bundle="${messages}"/></c:if></p>
                    <input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.SIGNIN%>"/>
                    <label for="nome"><fmt:message key="Nome_usuario" bundle="${messages}"/>/<fmt:message key="Correo_electronico" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.NOME%>" id="nome" value="<c:out value="${nome}"/>"/>
                    <p class="error"><c:if test="${not empty error_user_name}"><fmt:message key="${error_user_name}" bundle="${messages}"/></c:if></p>
                    <label for="contrasinal"><fmt:message key="Contrasinal" bundle="${messages}"/></label>
                    <input type="password" name="<%=ParameterNames.PASSWORD%>" id="contrasinal"/>
                    <p class="error"><c:if test="${not empty error_password}"><fmt:message key="${error_password}" bundle="${messages}"/></c:if></p>
                    <div>
                        <input type="checkbox" id="recordar_usuario" name="<%=ParameterNames.RECORDAR_USUARIO%>"/>
                        <label for="recordar_usuario" class="dos_columnas"><fmt:message key="Recordar_usuario" bundle="${messages}"/></label>
                    </div>
                    <input type="submit" value="<fmt:message key="Entrar" bundle="${messages}"/>" class="center"/>
                 	<p class="center"><strong><fmt:message key="Ainda_non_usuario" bundle="${messages}"/></strong></p>
                    <p class="center"><a href="../signup/signup.jsp"><input type="button" value="<fmt:message key="Rexistrarse" bundle="${messages}"/>"/></a></p>
                </form>
            </section>
        </div>
    </body>
</html>