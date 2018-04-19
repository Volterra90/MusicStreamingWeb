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

<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>MusicStreaming - Life's Music</title>
        <link rel="stylesheet" type="text/css" href="/MusicStreamingWeb/css/css_rexistro.css">
    </head>
    <body>
        <div id="contenedor">
            <header>
                <img src="/MusicStreamingWeb/img/logo.png"/>
            </header>
            <section>
            	<p class="error"><c:out value="${error}" /></p>
                <form action="/MusicStreamingWeb/UserServlet" method="POST">
                	<legend class="dos_cols"><strong></strong></legend>
                	<input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.SIGNUP%>"/>
                    <label for="nome"><fmt:message key="Nome" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.NOME%>" id="nome"/>
                    <p class="error dos_cols"><c:out value="${error_nome}" /></p>
                    <label for="apelidos"><fmt:message key="Apelidos" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.APELIDOS%>" id="apelidos"/>
                    <p class="error dos_cols"><c:out value="${error_apelido}" /></p>
                    <label for="nome_usuario"><fmt:message key="Nome_usuario" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.NICK%>" id="nome_usuario"/>
                    <p class="error dos_cols"><c:out value="${error_nick}" /></p>
                    <label for="email"><fmt:message key="Correo_electronico" bundle="${messages}"/></label>
                    <input type="email" name="<%=ParameterNames.EMAIL %>" id="email"/>
                    <p class="error dos_cols"><c:out value="${error_email}" /></p>                                   
                    <label for="contrasinal"><fmt:message key="Contrasinal" bundle="${messages}"/></label>
                    <input type="password" name="<%=ParameterNames.PASSWORD%>" id="contrasinal"/> 
                    <p class="error dos_cols"><c:out value="${error_password}" /></p>  
                    <label for="fecha_nacemento"><fmt:message key="Fecha_nacemento" bundle="${messages}"/></label>
                    <input type="date" name="<%=ParameterNames.FECHA%>" id="fecha_nacemento"/>
                    <p class="error dos_cols"><c:out value="${error_fecha}" /></p>  
                    <label for="xénero"></label>
                    <div class="dos_cols">
                        <p><fmt:message key="Xenero" bundle="${messages}"/></p>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="H"> <fmt:message key="Home" bundle="${messages}"/>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="M"> <fmt:message key="Muller" bundle="${messages}"/>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="O"> <fmt:message key="Outro" bundle="${messages}"/>
                    </div>
                    <p class="error dos_cols"><c:out value="${error_xenero}" /></p>   
                    <input type="submit" class="dos_cols" value="<fmt:message key="Rexistrarse" bundle="${messages}"/>"/>                                 
                </form>
            </section>
        </div>
    </body>
</html>