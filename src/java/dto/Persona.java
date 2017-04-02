package dto;

import java.util.Date;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:38:12 a.m.
 */
public class Persona {

    private String documento;
    private String tipo;
    private String nombre;
    private String apellido;
    private String email;
    private double saldo_limite;
    private String direccion;
    private String password;
    private Date fecha;
    private String telefono;

    public Persona() {
        this.saldo_limite = 0.0;
        this.password="";
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getSaldo_limite() {
        return saldo_limite;
    }

    public void setSaldo_limite(double saldo_limite) {
        this.saldo_limite = saldo_limite;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public void setTelefono(String telefono) {
    this.telefono=telefono;   
    }
    
    public String getTelefono(){
    return this.telefono;
    }

}
