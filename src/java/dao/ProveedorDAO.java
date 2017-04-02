package dao;

import dto.Proveedor;
import interfaces.IDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import util.Conexion;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:37:15 a.m.
 */
public class ProveedorDAO implements IDAO<Proveedor> {

    private Connection conn = null;

    public ProveedorDAO() {
    }

    @Override
    public boolean registrar(Proveedor obj) throws Exception {
        conn = Conexion.crearConexion();
        boolean exito = false;
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("INSERT INTO proveedor (empresa_proveedor, email, direccion) values (?, ?, ?)");
            stmt.setString(1, obj.getNombre());
            stmt.setString(2, obj.getEmail());
            stmt.setString(3, obj.getDireccion());
            int total = stmt.executeUpdate();
            if (total > 0) {
                stmt.close();
                exito = true;
            }
             stmt.close();
           
        } catch (SQLException ex) {
            throw ex;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public boolean eliminar(Object pk) throws Exception {
        return false;
    }

    @Override
    public boolean actualizar(Proveedor obj) throws Exception {
        conn = Conexion.crearConexion();
        PreparedStatement stmt = null;
        boolean exito = false;
        try {
            stmt = conn.prepareStatement("UPDATE proveedor SET email=?, direccion=? WHERE empresa_proveedor=?");
            stmt.setString(3, obj.getNombre());
            stmt.setString(1, obj.getEmail());
            stmt.setString(2, obj.getDireccion());
            int total = stmt.executeUpdate();
            if (total > 0) {
                exito = true;
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return exito;
    }

    @Override
    public Proveedor get(Object pk) throws Exception {
        PreparedStatement stmt = null;
        conn = Conexion.crearConexion();
        Proveedor dto = null;
        Proveedor p = (Proveedor) pk;
        try {
            stmt = conn.prepareStatement("SELECT empresa_proveedor,email,direccion FROM proveedor WHERE empresa_proveedor=?");
            stmt.setString(1, p.getNombre());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                dto = new Proveedor();
                dto.setNombre(rs.getString(1));
                dto.setEmail(rs.getString(2));
                dto.setDireccion(rs.getString(3));
            }
            stmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            throw ex;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return dto;
    }

    @Override
    public List<Proveedor> getAll() throws Exception {
        List<Proveedor> proveedores = new ArrayList();
        PreparedStatement stmt = null;
        conn = Conexion.crearConexion();
        try {
            stmt = conn.prepareStatement("SELECT * FROM proveedor");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Proveedor p = new Proveedor(rs.getString(1), rs.getString(2), rs.getString(3));
                proveedores.add(p);
            }
            stmt.close();
            rs.close();
        } catch (SQLException ex) {
            proveedores = null;
            throw new Exception(ex);
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return proveedores;
    }

    @Override
    public int count() throws Exception {

        return 0;
    }

}
