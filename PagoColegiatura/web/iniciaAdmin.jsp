<%-- 
    Document   : iniciaAdmin
    Created on : 18 abr 2023, 17:09:15
    Author     : Alan Franco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Admin</title>
    </head>
    <body style="font-family:verdana;">
        <form action="PagoServlet.do" method="post">
            <input type="submit" name="accion" value="Alumno" style="font-size:80%; float:right;">
            <h1 style="font-size:300%;">Inicia sesion, administrador</h1>
            <label>Usuario: &nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input type="text" name="usuario"><br>
            <label>Contraseña:</label>
            <input type="password" name="pass"><br><br>
            <input type="submit" name="accion" value="Inicia admin">
        </form>
    </body>
</html>
