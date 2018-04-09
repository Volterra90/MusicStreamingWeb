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
                    <label for="nome"><fmt:message key="Nome" bundle="${messages}"/>:</label>
                    <input type="text" name="<%=ParameterNames.NOME%>" id="nome"/>
                    <label for="apelidos">Apelidos:</label>
                    <input type="text" name="<%=ParameterNames.APELIDOS%>" id="apelidos"/>
                    <label for="nome_usuario">Nome de usuario:</label>
                    <input type="text" name="<%=ParameterNames.NICK%>" id="nome_usuario"/>
                    <label for="email">Correo electrónico:</label>
                    <input type="text" name="<%=ParameterNames.EMAIL %>" id="email"/>                   
                    <label for="confirmar_correo">Confirma o correo electrónico:</label>
                    <input type="text" name="confirmar_correo" id="confirmar_correo"/>                  
                    <label for="contrasinal">Introduzca a contrasinal:</label>
                    <input type="password" name="<%=ParameterNames.PASSWORD%>" id="contrasinal"/>  
                    <label for="confirmar_contrasinal">Confirme a contrasinal:</label>
                    <input type="password" name="confirmar_contrasinal" id="confirmar_contrasinal"/>
                    <label for="fecha_nacemento">Fecha de nacemento:</label>
                    <input type="date" name="<%=ParameterNames.FECHA%>" id="fecha_nacemento"/>
                    <label for="xénero"></label>
                    <div class="dos_cols">
                        <p>Xénero:</p>
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="H"> Home
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="M"> Muller
                        <input type="radio" name="<%=ParameterNames.XENERO%>" value="O"> Outro
                    </div>                                    
                    <input type="submit" value="Rexistrarse" class="dos_cols">
                </form>
            </section>
        </div>
    </body>
</html>