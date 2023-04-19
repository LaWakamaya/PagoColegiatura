<%-- 
    Document   : pagosAlumno
    Created on : 18 abr 2023, 17:27:13
    Author     : Alan Franco
--%>

<%@page import="java.util.List"%>
<%@page import="com.model.Transaccion"%>
<%@page import="com.model.Transaccion"%>
<%@page import="com.model.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    Alumno alumno = (Alumno) sesion.getAttribute("alumnoSesion");
    List<Transaccion> trans = (List<Transaccion>) request.getAttribute("transacciones");
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Colegiaturas alumno</title>
    </head>
    <body style="font-family:verdana;">
        <form action="PagoServlet.do" method="post">
            <h1>Hola alumno <%=alumno.getNombre()%></h1>
            
            <h1 style="font-size: 150%">Realizar pago</h1></br>
            
            <label>Monto:</label></br>
            <input type="text" name="monto" size="30"><br>
            
            <label>Nombre en tarjeta:</label></br>
            <input type="text" name="nombre" size="30"><br>
            
            <label>No. tarjeta:</label></br>
            <input type="text" name="tarjeta" size="30"><br>
            
            <label>Exp:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <label>CVV:</label><br>
            <input type="text" name="exp" size="11">&nbsp;&nbsp;
            <input type="text" name="cvv" size="11"><br>
            
            <input type="submit" name="accion" value="Realizar pago" style="font-size:100%; float:right;"></br>
            
            
            
            <hr>
            <h1 style="font-size: 150%">Historial de pagos</h1></br>
            <table border = 1 style="width: 80%; margin-left:auto;margin-right:auto;">
                <tr>
                    <th style="width: 16%">Id pago</th>
                    <th style="width: 16%">Matricula</th>
                    <th style="width: 16%">Nombre</th>
                    <th style="width: 16%">Fecha</th>
                    <th style="width: 16%">Tipo pago</th>
                    <th style="width: 16%">Cantidad</th>
                    
                </tr>
                <%
                    for (int i = 0; i < trans.size(); i++) {
                        if(alumno.getMatricula() == trans.get(i).getMatricula()){
                    %>
                <tr>
                    <th style="width: 16%"><%= trans.get(i).getId()%></th>
                    <th style="width: 16%"><%= trans.get(i).getMatricula()%></th>
                    <th style="width: 16%"><%= trans.get(i).getNombre()%></th>
                    <th style="width: 16%"><%= trans.get(i).getFecha()%></th>
                    <th style="width: 16%"><%= trans.get(i).getTipopago()%></th>
                    <th style="width: 16%">$<%= trans.get(i).getMonto()%> MXN</th>
               </tr>
                <%
                        }
                    }
                    %>

        </form>
    </body>
</html>
