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
}
