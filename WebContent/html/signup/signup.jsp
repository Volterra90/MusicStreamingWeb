<%@page import="com.musicstreaming.streaming.web.controller.AttributeNames"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.musicstreaming.streaming.web.controller.ParameterNames, java.util.*, com.musicstreaming.streaming.web.util.*"%>

<c:set var="error_nome" value="${requestScope.error_first_name_empty}" scope="page" />
<c:set var="error_apelido" value="${requestScope.error_last_name_empty}" scope="page" />
<c:set var="error_nick" value="${requestScope.error_nick}" scope="page" />
<c:set var="error_email" value="${requestScope.error_email}" scope="page" />
<c:set var="error_password" value="${requestScope.error_password}" scope="page" />
<c:set var="error_fecha" value="${requestScope.error_date}" scope="page" />
<c:set var="error_xenero" value="${requestScope.error_gender}" scope="page" />
<c:set var="error" value="${requestScope.error}" scope="page" />

<c:set var="nome" value="${requestScope.nome}" scope="page" />
<c:set var="apelido" value="${requestScope.apelido}" scope="page" />
<c:set var="nick" value="${requestScope.nick}" scope="page" />
<c:set var="email" value="${requestScope.email}" scope="page" />
<c:set var="fecha" value="${requestScope.fecha}" scope="page" />

<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>MusicStreaming - Life's Music</title>
        <link rel="stylesheet" type="text/css" href="/MusicStreamingWeb/css/css_rexistro.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    </head>
    <body>
        <div id="contenedor">
            <header>
                <img src="/MusicStreamingWeb/img/logo.png"/>
            </header>
            <section>
            	<p class="error"><c:if test="${not empty error}"><fmt:message key="${error}" bundle="${messages}"/></c:if></p>
                <form action="/MusicStreamingWeb/UserServlet" method="POST">
                	<legend class="dos_cols"><strong></strong></legend>
                	<input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.SIGNUP%>"/>
                    <label for="nome"><fmt:message key="Nome" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.NOME%>" id="nome" value="<c:out value="${nome}"/>"/>
                    <p class="error dos_cols"><c:if test="${not empty error_nome}"><fmt:message key="${error_nome}" bundle="${messages}"/></c:if></p>
                    <label for="apelidos"><fmt:message key="Apelidos" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.APELIDOS%>" id="apelidos" value="<c:out value="${apelido}"/>"/>
                    <p class="error dos_cols"><c:if test="${not empty error_apelido}"><fmt:message key="${error_apelido}" bundle="${messages}"/></c:if></p>
                    <label for="nome_usuario"><fmt:message key="Nome_usuario" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.NICK%>" id="nome_usuario" value="<c:out value="${nick}"/>"/>
                    <p class="error dos_cols"><c:if test="${not empty error_nick}"><fmt:message key="${error_nick}" bundle="${messages}"/></c:if></p>
                    <label for="email"><fmt:message key="Correo_electronico" bundle="${messages}"/></label>
                    <input type="email" name="<%=ParameterNames.EMAIL %>" id="email" value="<c:out value="${email}"/>"/>
                    <p class="error dos_cols"><c:if test="${not empty error_email}"><fmt:message key="${error_email}" bundle="${messages}"/></c:if></p>                                   
                    <label for="contrasinal"><fmt:message key="Contrasinal" bundle="${messages}"/></label>
                    <input type="password" name="<%=ParameterNames.PASSWORD%>" id="contrasinal"/> 
                    <p class="error dos_cols"><c:if test="${not empty error_password}"><fmt:message key="${error_password}" bundle="${messages}"/></c:if></p>  
                    <label for="fecha_nacemento"><fmt:message key="Fecha_nacemento" bundle="${messages}"/></label>
                    <input type="date" name="<%=ParameterNames.FECHA%>" id="fecha_nacemento" value="<c:out value="${fecha}"/>""/>
                    <p class="error dos_cols"><c:if test="${not empty error_fecha}"><fmt:message key="${error_fecha}" bundle="${messages}"/></c:if></p>  
                    <label for="xénero"></label>
                    <div class="dos_cols">
                        <p><fmt:message key="Xenero" bundle="${messages}"/></p>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="H"> <fmt:message key="Home" bundle="${messages}"/>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="M"> <fmt:message key="Muller" bundle="${messages}"/>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="O"> <fmt:message key="Outro" bundle="${messages}"/>
                    </div>
                    <p class="error error_xenero"><c:if test="${not empty error_xenero}"><fmt:message key="${error_xenero}" bundle="${messages}"/></c:if></p>   
                    <input type="submit" class="dos_cols" value="<fmt:message key="Rexistrarse" bundle="${messages}"/>"/>                                 
                </form>
            </section>
        </div>
    </body>
</html>