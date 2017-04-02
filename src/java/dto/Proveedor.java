package dto;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:38:12 a.m.
 */
public class Proveedor {

    private String nombre;
    private String email;
    private String direccion;

    public Proveedor() {

    }

    public Proveedor(String nombre, String email, String direccion) {
        this.nombre = nombre;
        this.email = email;
        this.direccion = direccion;
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

}
