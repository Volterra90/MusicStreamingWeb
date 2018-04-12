<%@page import="com.musicstreaming.streaming.web.controller.ParameterNames"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>
  
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>MusicStreaming - Life's Music</title>
        <link rel="stylesheet" type="text/css" href="../../css/css_index_no_login.css">
    </head>
    <body id="body_index_no_login">
        <div id="contenedor">
            <header>
                <img src="../../img/logo.png"/>
            </header>
            <section>
                <form action="/MusicStreamingWeb/UserServlet" method="POST">
                    <legend><strong><fmt:message key="Iniciar_sesion" bundle="${messages}"/></strong></legend>
                    <input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.SIGNIN%>"/>
                    <label for="nome"><fmt:message key="Nome_usuario" bundle="${messages}"/>/<fmt:message key="Correo_electronico" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.NOME%>" id="nome"/>
                    <label for="contrasinal"><fmt:message key="Contrasinal" bundle="${messages}"/></label>
                    <input type="password" name="<%=ParameterNames.PASSWORD%>" id="contrasinal"/>
                    <div>
                        <input type="checkbox" id="recordar_usuario"/>
                        <label for="recordar_usuario" class="dos_columnas"><fmt:message key="Recordar_usuario" bundle="${messages}"/></label>
                    </div>
                    <input type="submit" value="<fmt:message key="Recordar_usuario" bundle="${messages}"/>" class="center"/>
                 	<p class="center"><strong><fmt:message key="Ainda_non_usuario" bundle="${messages}"/></strong></p>
                    <a href="../signup/signup.jsp"><input type="button" value="<fmt:message key="Rexistrarse" bundle="${messages}"/>" class="center"/></a>
                </form>
            </section>
        </div>
    </body>
</html>