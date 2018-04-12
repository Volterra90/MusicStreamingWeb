<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="com.musicstreaming.streaming.web.controller.ParameterNames, java.util.*, com.musicstreaming.streaming.web.util.*"%>

<fmt:setLocale value='${sessionScope["user-locale"]}' scope="session"/>
<fmt:setBundle basename = "resources.Messages" var = "messages" scope="session"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>MusicStreaming - Life's Music</title>
        <link rel="stylesheet" type="text/css" href="../../css/css_rexistro.css">
    </head>
    <body>
        <div id="contenedor">
            <header>
                <img src="../../img/logo.png"/>
            </header>
            <section>
                <form action="/MusicStreamingWeb/UserServlet" method="POST">
                	<legend class="dos_cols"><strong></strong></legend>
                	<input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.SIGNUP%>"/>
                    <label for="nome"><fmt:message key="Nome" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.NOME%>" id="nome"/>
                    <label for="apelidos"><fmt:message key="Apelidos" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.APELIDOS%>" id="apelidos"/>
                    <label for="nome_usuario"><fmt:message key="Nome_usuario" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.NICK%>" id="nome_usuario"/>
                    <label for="email"><fmt:message key="Correo_electronico" bundle="${messages}"/></label>
                    <input type="text" name="<%=ParameterNames.EMAIL %>" id="email"/>                   
                    <label for="confirmar_correo"><fmt:message key="Confirmar_correo" bundle="${messages}"/></label>
                    <input type="text" name="confirmar_correo" id="confirmar_correo"/>                  
                    <label for="contrasinal"><fmt:message key="Contrasinal" bundle="${messages}"/></label>
                    <input type="password" name="<%=ParameterNames.PASSWORD%>" id="contrasinal"/>  
                    <label for="confirmar_contrasinal"><fmt:message key="Confirmar_contrasinal" bundle="${messages}"/></label>
                    <input type="password" name="confirmar_contrasinal" id="confirmar_contrasinal"/>
                    <label for="fecha_nacemento"><fmt:message key="Fecha_nacemento" bundle="${messages}"/></label>
                    <input type="date" name="<%=ParameterNames.FECHA%>" id="fecha_nacemento"/>
                    <label for="xénero"></label>
                    <div class="dos_cols">
                        <p><fmt:message key="Xenero" bundle="${messages}"/></p>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="H"> <fmt:message key="Home" bundle="${messages}"/>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="M"> <fmt:message key="Muller" bundle="${messages}"/>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="O"> <fmt:message key="Outro" bundle="${messages}"/>
                    </div>   
                    <input type="submit" value="<fmt:message key="Rexistrarse" bundle="${messages}"/>"/>                                 
                </form>
            </section>
        </div>
    </body>
</html>