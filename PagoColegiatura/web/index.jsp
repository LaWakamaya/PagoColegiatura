<%-- 
    Document   : index
    Created on : 18 abr 2023, 14:47:14
    Author     : Alan Franco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesion</title>
    </head>
    <body style="font-family:verdana;">
        <form action="PagoServlet.do" method="post">
            <input type="submit" name="accion" value="Administrador" style="font-size:80%; float:right;">
            <h1 style="font-size:300%;">Inicia sesion, alumno</h1>
            <label>Matricula: &nbsp;&nbsp;</label>
            <input type="text" name="matricula"><br>
            <label>Contraseña:</label>
            <input type="password" name="pass"><br><br>
            <input type="submit" name="accion" value="Inicia sesion">
        </form>
    </body>
</html>
