package negocio.proveedor;

import dao.ProveedorDAO;
import dto.Proveedor;
import java.util.List;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:39:19 a.m.
 */
public class GestionProveedor {

    public GestionProveedor() {

    }

    /**
     *
     * @param nombre
     * @param direccion
     * @param email
     * @return
     */
    public boolean registrarProveedor(String nombre, String direccion, String email) throws Exception{
        Proveedor dto = new Proveedor(nombre, email, direccion);
        ProveedorDAO dao = new ProveedorDAO();
        return dao.registrar(dto);
    }

    /**
     *
     * @param nombre
     * @param direccion
     * @param email
     * @return
     */
    public boolean actualizarProveedor(String nombre, String direccion, String email) throws Exception{
        Proveedor dto = new Proveedor(nombre, email, direccion);
        ProveedorDAO dao = new ProveedorDAO();
        return dao.actualizar(dto);
    }

    /**
     *
     * @param nombre
     * @return
     */
    public Proveedor consultarProveedor(String nombre) throws Exception {
        Proveedor p = new Proveedor();
        p.setNombre(nombre);
        ProveedorDAO dao = new ProveedorDAO();
        return dao.get(p);
    }

    /**
     *
     * @return
     */
    public List<Proveedor> listarProveedores() throws Exception{
        ProveedorDAO dao = new ProveedorDAO();
        return dao.getAll();
    }
}//end GestionProveedor
