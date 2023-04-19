<%-- 
    Document   : editarPago
    Created on : 18 abr 2023, 21:32:00
    Author     : Alan Franco
--%>

<%@page import="java.util.List"%>
<%@page import="com.model.Transaccion"%>
<%@page import="com.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    Admin admin = (Admin) sesion.getAttribute("adminSesion");
    List<Transaccion> trans = (List<Transaccion>) request.getAttribute("transacciones");
    Transaccion transE = (Transaccion) request.getAttribute("transE");
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar pago</title>
    </head>
    <body style="font-family:verdana;">
        <form action="PagoServlet.do" method="post">
            <h1>Hola <%=admin.getNombre()%></h1>
            <h1 style="font-size: 150%">Editar pago</h1></br>
            
            <label>Id:</label></br>
            <input type="text" name="id" size="20" value="<%= transE.getId() %>" readonly><br>
            
            <label>Matricula:</label></br>
            <input type="text" name="matricula" size="20" value="<%= transE.getMatricula() %>"><br>
            
            <label>Tipo pago:</label></br>
            <input type="text" name="tipopago" size="20" value="<%= transE.getTipopago() %>" readonly><br>
            
            <label>Cantidad:</label></br>
            <input type="text" name="monto" size="20" value="<%= transE.getMonto() %>"><br><br>
            
            <input type="submit" name="accion" value="Actualizar" style="font-size:100%;"/></br></br>
            
            <hr>
            
            <input type="submit" name="accion" value="Registrar pago" style="float:right;">
            <h1 style="font-size: 150%">Historial de pagos</h1></br>
            <table border = 1 style="width: 85%; margin-left:auto;margin-right:auto;">
                <tr>
                    <th style="width: 15%">Id Pago</th>
                    <th style="width: 15%">Matricula</th>
                    <th style="width: 15%">Nombre</th>
                    <th style="width: 15%">Fecha</th>
                    <th style="width: 15%">Tipo pago</th>
                    <th style="width: 15%">Cantidad</th>
                    <th style="width: 14%">Editar</th>
                </tr>
                <tr>
                    <th style="width: 15%">
                        <input type="text" name="buscarId" size="3">
                        <input type="submit" name="accion" value="Buscar Id"/>
                    </th>
                    <th style="width: 15%">
                        <input type="text" name="buscarMat" size="3">
                        <input type="submit" name="accion" value="Buscar Matricula"/>
                    </th>
                    <th style="width: 15%">
                        <input type="text" name="buscarNom" size="3">
                        <input type="submit" name="accion" value="Buscar Nombre"/>
                    </th>
                    <th style="width: 15%">
                        <input type="text" name="buscarFecha" size="3">
                        <input type="submit" name="accion" value="Buscar Fecha"/>
                    </th>
                    <th style="width: 15%">
                        <input type="text" name="buscarTipo" size="3">
                        <input type="submit" name="accion" value="Buscar Tipo"/>
                    </th>
                    <th style="width: 15%">-</th>
                    <th style="width: 9%">-</th>
                </tr>
                
                <%
                    for (int i = trans.size()-1; i >= 0; i--) {
                    %>
                <tr>
                    <th style="width: 15%"><%= trans.get(i).getId()%></th>
                    <th style="width: 15%"><%= trans.get(i).getMatricula()%></th>
                    <th style="width: 15%"><%= trans.get(i).getNombre()%></th>
                    <th style="width: 15%"><%= trans.get(i).getFecha()%></th>
                    <th style="width: 15%"><%= trans.get(i).getTipopago()%></th>
                    <th style="width: 15%">$<%= trans.get(i).getMonto()%> MXN</th>
                    <td style="width: 14%; text-align:center">
                        <input type="submit" name="accion" value="Editar <%=trans.get(i).getId()%>"/>
                        <input type="submit" name="accion" value="Info <%=trans.get(i).getMatricula()%>"/>
                        </td>
               </tr>
                <%
                    }
                    %>
        </form>
    </body>
</html>