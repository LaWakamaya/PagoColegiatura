<%-- 
    Document   : adminBusqueda
    Created on : 18 abr 2023, 22:29:14
    Author     : Alan Franco
--%>

<%@page import="java.util.List"%>
<%@page import="com.model.Transaccion"%>
<%@page import="com.model.Transaccion"%>
<%@page import="com.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    Admin admin = (Admin) sesion.getAttribute("adminSesion");
    List<Transaccion> trans = (List<Transaccion>) request.getAttribute("transacciones");
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busqueda</title>
    </head>
    <body style="font-family:verdana;">
        <form action="PagoServlet.do" method="post">
            <h1>Hola <%=admin.getNombre()%></h1>
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
                    String tipoBusqueda = (String) request.getAttribute("tipoBusqueda");
                    switch(tipoBusqueda){
                        case "id":{
                            int id = Integer.parseInt( (String) request.getAttribute("id"));
                            for (int i = trans.size()-1; i >= 0; i--) {
                                if(id == trans.get(i).getId()){
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
                                break;
                                }
                            }
                        break;
                        }
                        case "matricula":{
                            int matricula = Integer.parseInt( (String) request.getAttribute("matricula"));
                            for (int i = trans.size()-1; i >= 0; i--) {
                                if(matricula == trans.get(i).getMatricula()){
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
                            }
                        break;
                        }
                        case "nombre":{
                            String nombre = (String) request.getAttribute("nombre");
                            for (int i = trans.size()-1; i >= 0; i--) {
                                if(trans.get(i).getNombre().contains(nombre)){
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
                            }
                        break;
                        }
                        case "fecha":{
                            String fecha = (String) request.getAttribute("fecha");
                            for (int i = trans.size()-1; i >= 0; i--) {
                                if(trans.get(i).getFecha().contains(fecha)){
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
                            }
                        break;
                        }
                        case "tipo":{
                            String tipo = (String) request.getAttribute("tipo");
                            for (int i = trans.size()-1; i >= 0; i--) {
                                if(trans.get(i).getTipopago().contains(tipo)){
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
                            }
                        break;
                        }
                    }
                    
                    %>
        </form>
    </body>
</html>
