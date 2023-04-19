/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Alan Franco
 */
public class DBCon {
    private String nombreBD = "pagocolegiatura";
    private String user = "root";
    private String pass = "admin";
    private String url = "jdbc:mysql://localhost:3306/"+nombreBD+"?useUnicode=true"
            + "&useJDBCCompliantTimeZoneShift=true&useLegacyDateTimeCode=false"
            + "&serverTimezone=UTC";
    
    Connection con = null;
    Statement st;
    ResultSet rs;
    String query = "";
    
    public DBCon() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
            this.st = con.createStatement();
            if(con!=null)
                System.out.println("Conexion exitosa");
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.toString());
        }
    }

    public List<Alumno> ObtenerAlumno() throws SQLException{
        List<Alumno> alumnos = new ArrayList<>();
        query = "SELECT * FROM Alumno";
        rs = st.executeQuery(query);
        
        while(rs.next()){
            int matricula = rs.getInt("Matricula");
            String nombre = rs.getString("Nombre");
            String pass = rs.getString("Pass");
            
            alumnos.add(new Alumno(matricula, nombre, pass));
        }
        rs.close();
        return alumnos;
    }

    public List<Admin> ObtenerAdmin() throws SQLException{
        List<Admin> admins = new ArrayList<>();
        query = "SELECT * FROM Administrador";
        rs = st.executeQuery(query);
        
        while(rs.next()){
            String usuario = rs.getString("Usuario");
            String nombre = rs.getString("Nombre");
            String pass = rs.getString("Pass");
            
            admins.add(new Admin(usuario, nombre, pass));
        }
        rs.close();
        return admins;
    }

    public List<Transaccion> ObtenerTransaccion() throws SQLException{
        List<Transaccion> transacciones = new ArrayList<>();
        query = "SELECT * FROM Transaccion";
        rs = st.executeQuery(query);
        
        while(rs.next()){
            int id = rs.getInt("IdTransferencia");
            int matricula = rs.getInt("Matricula");
            String nombre = rs.getString("Nombre");
            String fecha = rs.getString("Fecha");
            String tipopago = rs.getString("TipoPago");
            double monto = rs.getDouble("Monto");
            
            transacciones.add(new Transaccion(id, matricula, nombre, fecha, tipopago, monto));
        }
        rs.close();
        return transacciones;
    }
    
    public void NuevaTransaccion(Transaccion t) throws SQLException{
        query = "INSERT INTO Transaccion(Matricula, Nombre, Fecha, TipoPago, Monto) VALUES("
                + "" + t.getMatricula() + ", "
                + "\"" + t.getNombre() + "\", "
                + "\"" + t.getFecha() + "\", "
                + "\"" + t.getTipopago() + "\", "
                + "" + t.getMonto()
                + ");";
        st.executeUpdate(query);        
    }
    
    public void ActualizarTransaccion(Transaccion t) throws SQLException{
        query = "UPDATE Transaccion SET "
                + "IdTransferencia = " + t.getId() + ", "
                + "Matricula = " + t.getMatricula() + ", "
                + "Nombre = \"" + t.getNombre() + "\", "
                + "Fecha = \"" + t.getFecha() + "\", "
                + "TipoPago = \"" + t.getTipopago() + "\", "
                + "Monto = " + t.getMonto()+ " "
                + "WHERE IdTransferencia = " + t.getId() + ";";
        st.executeUpdate(query);
    }
}
