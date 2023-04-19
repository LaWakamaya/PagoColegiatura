/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.serv;

import com.model.Admin;
import com.model.Alumno;
import com.model.DBCon;
import com.model.Transaccion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alan Franco
 */
public class PagoServlet extends HttpServlet {
    
    DBCon con;
    List<Alumno> alumnos = new ArrayList<>();
    List<Admin> admins = new ArrayList<>();
    List<Transaccion> transacciones = new ArrayList<>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PagoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PagoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        try {
            //processRequest(request, response);
            con = new DBCon();
        }catch(Exception e) {
            System.out.println(e.toString());
        }
        if(con!=null){
            obtenerDatos();
            
            String accion = request.getParameter("accion");
            switch(accion){
                case "Administrador":{
                    RequestDispatcher view = request.getRequestDispatcher("iniciaAdmin.jsp");
                    view.forward(request, response);
                    break;
                }
                case "Alumno":{
                    RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                    view.forward(request, response);
                    break;
                }
                case "Inicia sesion":{
                    int matricula = Integer.parseInt(request.getParameter("matricula"));
                    String pass = request.getParameter("pass");
                    boolean flagSesion = false;
                    obtenerDatos();
                    
                    for (int i = 0; i < alumnos.size(); i++) {
                        if((matricula == alumnos.get(i).getMatricula()) &&
                                pass.equals(alumnos.get(i).getPass())){
                            flagSesion = true;
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("alumnoSesion", alumnos.get(i));
                            break;
                        }
                    }
                    if(flagSesion){
                        request.setAttribute("transacciones", transacciones);
                        RequestDispatcher view = request.getRequestDispatcher("pagosAlumno.jsp");
                        view.forward(request, response);
                    }else{
                        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                        view.forward(request, response);
                    }
                }
                case "Inicia admin":{
                    String usuario = request.getParameter("usuario");
                    String pass = request.getParameter("pass");
                    boolean flagSesion = false;
                    obtenerDatos();
                    
                    for (int i = 0; i < admins.size(); i++) {
                        if(usuario.equals(admins.get(i).getUsuario()) &&
                                pass.equals(admins.get(i).getPass())){
                            flagSesion = true;
                            HttpSession sesion = request.getSession(true);
                            sesion.setAttribute("adminSesion", admins.get(i));
                            break;
                        }
                    }
                    if(flagSesion){
                        request.setAttribute("transacciones", transacciones);
                        RequestDispatcher view = request.getRequestDispatcher("pagosAdmin.jsp");
                        view.forward(request, response);
                    }else{
                        RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                        view.forward(request, response);
                    }
                }
                case "Realizar pago":{
                    int monto = Integer.parseInt(request.getParameter("monto"));
                    String nombre = request.getParameter("nombre");
                    String tarjeta = request.getParameter("tarjeta");
                    String exp = request.getParameter("exp");
                    int cvv = Integer.parseInt(request.getParameter("cvv"));
                    
                    if(monto != 0 && !nombre.isEmpty() && !tarjeta.isEmpty() && !exp.isEmpty() && cvv != 0){
                        HttpSession sesion = request.getSession();
                        Alumno alumno = (Alumno) sesion.getAttribute("alumnoSesion");
                        int matriculaT = alumno.getMatricula();
                        String nombreT = alumno.getNombre();
                        Transaccion nuevaT = new Transaccion(matriculaT, nombreT, "En linea", monto);
                        
                        try {
                            con.NuevaTransaccion(nuevaT);
                        } catch (SQLException ex) {
                            Logger.getLogger(PagoServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        
                        obtenerDatos();
                        request.setAttribute("transacciones", transacciones);
                        RequestDispatcher view = request.getRequestDispatcher("pagosAlumno.jsp");
                        view.forward(request, response);
                        
                    }
                }
            }
        }
    }
    
    private void obtenerDatos(){
        try {
                alumnos = con.ObtenerAlumno();
                admins = con.ObtenerAdmin();
                transacciones = con.ObtenerTransaccion();
            } catch (SQLException ex) {
                Logger.getLogger(PagoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
