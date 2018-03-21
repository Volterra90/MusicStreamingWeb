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
                <form>
                    <legend><strong>LOG IN</strong></legend>
                    <label for="nome">Nome de usuario/correo electrónico:</label>
                    <input type="text" name="nome" id="nome"/>
                    <label for="contrasinal">Contrasinal:</label>
                    <input type="text" name="contrasinal" id="contrasinal"/>
                    <div>
                        <input type="checkbox" id="recordar_usuario"/>
                        <label for="recordar_usuario" class="dos_columnas">Recordar usuario</label>
                    </div>
                    <input type="button" value="LOG IN" class="center"/>
                    <p class="center"><strong>Aínda non es usuario? Rexístrate!</strong></p>
                    <input type="button" value="REXISTRARSE" class="center"/>
                </form>
            </section>
        </div>
    </body>
</html>