<%-- 
    Document   : pagosAdmin
    Created on : 18 abr 2023, 17:28:06
    Author     : Alan Franco
--%>

<%@page import="com.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    Admin admin = (Admin) sesion.getAttribute("adminSesion");
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Colegiaturas admin</title>
    </head>
    <body>
        <h1>Hola <%=admin.getNombre()%></h1>
    </body>
</html>
