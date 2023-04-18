<%-- 
    Document   : pagosAlumno
    Created on : 18 abr 2023, 17:27:13
    Author     : Alan Franco
--%>

<%@page import="com.model.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    Alumno alumno = (Alumno) sesion.getAttribute("alumnoSesion");
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Colegiaturas alumno</title>
    </head>
    <body>
        <h1>Hola <%=alumno.getNombre()%></h1>
    </body>
</html>
