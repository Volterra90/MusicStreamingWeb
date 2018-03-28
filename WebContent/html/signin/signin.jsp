<%@page import="com.musicstreaming.streaming.web.controller.ParameterNames"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                    <legend><strong>LOG IN</strong></legend>
                    <input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ParameterNames.SIGNIN%>"/>
                    <label for="nome">Nome de usuario/correo electrónico:</label>
                    <input type="text" name="<%=ParameterNames.NOME%>" id="nome"/>
                    <label for="contrasinal">Contrasinal:</label>
                    <input type="password" name="<%=ParameterNames.PASSWORD%>" id="contrasinal"/>
                    <div>
                        <input type="checkbox" id="recordar_usuario"/>
                        <label for="recordar_usuario" class="dos_columnas">Recordar usuario</label>
                    </div>
                    <input type="submit" value="Entrar" class="center"/>
                 	<p class="center"><strong>Aínda non es usuario? Rexístrate!</strong></p>
                    <a href="../signup/signup.jsp"><input type="button" value="Rexistrarse" class="center"/></a>
                </form>
            </section>
        </div>
    </body>
</html>