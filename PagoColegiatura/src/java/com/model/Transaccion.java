/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Alan Franco
 */
public class Transaccion {
    
    private int id, matricula;
    private String nombre, fecha, tipopago;
    private double monto;

    public Transaccion(int id, int matricula, String nombre, String fecha, String tipopago, double monto) {
        this.id = id;
        this.matricula = matricula;
        this.nombre = nombre;
        this.fecha = fecha;
        this.tipopago = tipopago;
        this.monto = monto;
    }
    
    public Transaccion(int id, int matricula, String nombre, String tipopago, double monto) {
        this.id = id;
        this.matricula = matricula;
        this.nombre = nombre;
        this.fecha = fechaTransaccion();
        this.tipopago = tipopago;
        this.monto = monto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getTipopago() {
        return tipopago;
    }

    public void setTipopago(String tipopago) {
        this.tipopago = tipopago;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    
    private String fechaTransaccion(){
        Date date = (Date) Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
        String strDate = dateFormat.format(date);
        return strDate;
    }
    
}
