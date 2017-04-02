package dao;

import dto.Producto;
import dto.Proveedor;
import interfaces.IDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Conexion;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:37:14 a.m.
 */
public class ProductoDAO implements IDAO<Producto> {

    Connection conn;

    public ProductoDAO() {

    }

    @Override
    public boolean registrar(Producto obj) throws Exception {

        return false;
    }

    @Override
    public boolean eliminar(Object pk) throws Exception {

        return false;
    }

    @Override
    public boolean actualizar(Producto obj) throws Exception {

        boolean rta = false;

        conn = Conexion.crearConexion();
        PreparedStatement stmt = null;
        try {
            stmt = conn.prepareStatement("update producto set tipo_producto=?, marca=?, precio_venta=?, precio_compra=? where codigo=?");
            stmt.setString(1, obj.getTipo_producto());
            stmt.setString(2, obj.getMarca());
            stmt.setDouble(3, obj.getPrecio_venta());
            stmt.setDouble(4, obj.getPrecio_compra());
            stmt.setInt(5, obj.getCodigo());

            int total = stmt.executeUpdate();
            if (total > 0) {
                rta = true;
            }
            stmt.close();

        } catch (SQLException ex) {

            throw ex;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return rta;
    }

    @Override
    public Producto get(Object codigo) throws Exception {

        Producto producto = null;

        try {
            conn = Conexion.crearConexion();
            PreparedStatement stm = conn.prepareStatement("SELECT * FROM producto WHERE codigo=?");
            stm.setInt(1, (Integer) codigo);

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                producto = new Producto();
                producto.setCodigo(rs.getInt(1));
                producto.setNombre(rs.getString(2));
                producto.setCantidad(rs.getInt(3));
                producto.setTipo_producto(rs.getString(4));
                producto.setMarca(rs.getString(6));
                producto.setPrecio_venta(rs.getDouble("precio_venta"));
                producto.setPrecio_compra(rs.getDouble("precio_compra"));
                producto.setRutaImagen(rs.getString(9));
            }

            stm.close();
            rs.close();
            conn.close();
        } catch (SQLException sqle) {

        }
        return producto;
    }

    /**
     * consulta el producto por el nombre
     *
     * @param nombre
     * @return
     */
    public Producto consultarProductoxNombre(String nombre) throws Exception {
        Producto producto = null;

        try {
            conn = Conexion.crearConexion();
            PreparedStatement stm = conn.prepareStatement("SELECT * FROM producto WHERE nombre=?");
            stm.setString(1, nombre);

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                producto = new Producto();
                producto.setCodigo(rs.getInt(1));
                producto.setNombre(rs.getString(2));
                producto.setCantidad(rs.getInt(3));
                producto.setTipo_producto(rs.getString(4));
                producto.setMarca(rs.getString(6));
                producto.setPrecio_venta(rs.getDouble("precio_venta"));
                producto.setPrecio_compra(rs.getDouble("precio_compra"));
                producto.setRutaImagen(rs.getString(9));
            }

            stm.close();
            rs.close();
            conn.close();
        } catch (SQLException sqle) {

        }
        return producto;
    }

    @Override
    public List<Producto> getAll() throws Exception {

        List<Producto> productos = new ArrayList<>();
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM producto");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setCodigo(rs.getInt(1));
                producto.setNombre(rs.getString(2));
                producto.setCantidad(rs.getInt(3));
                producto.setTipo_producto(rs.getString(4));
                producto.setDescripcion(rs.getString(5));
                producto.setPrecio_venta(rs.getDouble(7));
                producto.setRutaImagen(rs.getString(9));

                productos.add(producto);
            }
            stmt.close();
            rs.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return productos;
    }

    @Override
    public int count() throws Exception {

        return 0;
    }

    /**
     * lista los tipos de producctos que hay en el sistema
     *
     * @return
     * @throws Exception
     */
    public List<String> listarTipoProducto() throws Exception {
        List<String> tipos = new ArrayList<>();
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT tipo_producto FROM tipo_producto");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                tipos.add(rs.getString(1));
            }
            stmt.close();
            rs.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return tipos;
    }

    /**
     * lista los productos de unn determinado tipo
     *
     * @param tipo
     * @return
     */
    public List<Producto> listarProductoTipo(String tipo) throws Exception {
        List<Producto> productos = new ArrayList<>();
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM producto where tipo_producto='" + tipo + "'");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setCodigo(rs.getInt(1));
                producto.setNombre(rs.getString(2));
                producto.setCantidad(rs.getInt(3));
                producto.setTipo_producto(rs.getString(4));
                producto.setDescripcion(rs.getString(5));
                producto.setPrecio_venta(rs.getDouble(7));
                producto.setRutaImagen(rs.getString(9));

                productos.add(producto);
            }
            stmt.close();
            rs.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return productos;
    }

    /**
     * lista productos de un determinado proveedor
     *
     * @param nombre
     * @return
     * @throws Exception
     */
    public List<Producto> listarProductosProveedor(String nombre) throws Exception {
        List<Producto> productos = new ArrayList<>();
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT p.codigo,p.nombre,pr.cantidad,p.tipo_producto,p.descripcion,p.marca,p.precio_venta,p.precio_compra,p.marca FROM proveedor_producto pr, producto p where pr.codigo_producto=p.codigo and pr.empresa_proveedor=" + "'" + nombre + "'");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setCodigo(rs.getInt(1));
                producto.setNombre(rs.getString(2));
                producto.setCantidad(rs.getInt(3));
                producto.setTipo_producto(rs.getString(4));
                producto.setDescripcion(rs.getString(5));
                producto.setPrecio_venta(rs.getDouble(7));
                producto.setPrecio_compra(rs.getDouble(8));
                producto.setMarca(rs.getString(9));

                productos.add(producto);
            }
            stmt.close();
            rs.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return productos;
    }

    /**
     * lista las marcas registradas en el sistema
     *
     * @return
     * @throws Exception
     */
    public List<String> listarMarcaProducto() throws Exception {
        List<String> tipos = new ArrayList<>();
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT marca FROM marca");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                tipos.add(rs.getString(1));
            }
            stmt.close();
            rs.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return tipos;

    }

    /**
     * registrar unn producto en el sistema
     *
     * @param p
     * @param pr
     * @return
     * @throws Exception
     */
    public boolean registrarProducto(Producto p, Proveedor pr) throws Exception {
        conn = Conexion.crearConexion();
        boolean msg = false;
        conn.setAutoCommit(false);

        try {
            boolean x = this.registrarProductoP(p, pr);
            p.setCodigo(this.codigo(p));
            boolean y = this.registrarProductoPr(p, pr);

            msg = (x && y);

            conn.commit();
        } catch (SQLException ex) {
            conn.rollback();
            System.out.print(ex.toString());
            throw ex;
        } finally {
            if (conn != null) {
                conn.close();
            }
            return msg;
        }
    }

    /**
     * retorna el codigo del producto registrado
     *
     * @param p
     * @return
     * @throws SQLException
     */
    private int codigo(Producto p) throws SQLException {

        PreparedStatement stmt = conn.prepareStatement("SELECT codigo FROM  producto  where nombre=?");
        stmt.setString(1, p.getNombre());
        int codigo = 0;
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            codigo = rs.getInt(1);
        }
        stmt.close();
        rs.close();
        return codigo;
    }

    /**
     * registra un producto en el sistema
     *
     * @param p
     * @param pr
     * @return
     * @throws Exception
     */
    public boolean registrarProductoP(Producto p, Proveedor pr) throws SQLException {

        boolean exito = false;
        PreparedStatement stmt = null;

        stmt = conn.prepareStatement("INSERT INTO producto (nombre, cantidad, tipo_producto,marca,precio_venta,precio_compra, descripcion,imagen) values (?, ?, ?, ?, ?, ?, ?, ?)");
        stmt.setString(1, p.getNombre());
        stmt.setInt(2, p.getCantidad());
        stmt.setString(3, p.getTipo_producto());
        stmt.setString(4, p.getMarca());
        stmt.setDouble(5, p.getPrecio_venta());
        stmt.setDouble(6, p.getPrecio_compra());
        stmt.setString(7, "no tiene descripcion");
        stmt.setString(8, p.getRutaImagen());
        int total = stmt.executeUpdate();
        if (total > 0) {
            stmt.close();
            exito = true;
        }

        return exito;
    }

    /**
     * registra un producto y lo referencia al proveedor
     *
     * @param p
     * @param pr
     * @return
     * @throws Exception
     */
    public boolean registrarProductoPr(Producto p, Proveedor pr) throws Exception {

        boolean exito = false;
        PreparedStatement stmt = null;
        stmt = conn.prepareStatement("INSERT INTO proveedor_producto (empresa_proveedor, codigo_producto, cantidad,fecha) values (?, ?,?,?)");
        stmt.setString(1, pr.getNombre());
        stmt.setInt(2, p.getCodigo());
        stmt.setInt(3, p.getCantidad());
        stmt.setDate(4, new java.sql.Date(new Date().getTime()));

        int total = stmt.executeUpdate();
        if (total > 0) {
            stmt.close();
            exito = true;
        }

        return exito;
    }

    /**
     * acomoda la ruta de un determinado producto
     *
     * @param dto
     * @return
     * @throws Exception
     */
    public boolean acomodarRutaProducto(Producto dto) throws Exception {
        boolean exito = false;
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stmt = conn.prepareStatement("update producto  set imagen=? where codigo=?");
            stmt.setString(1, dto.getRutaImagen());
            stmt.setInt(2, dto.getCodigo());

            int total = stmt.executeUpdate();
            if (total > 0) {
                stmt.close();
                exito = true;
            }

            stmt.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return exito;
    }

    /**
     * verifica un proveedor y un producto en la base de datos
     *
     * @param p
     * @param pr
     * @return
     */
    private boolean verificarProductoProveedor(Producto p, Proveedor pr) throws SQLException {
        boolean valor = false;

        PreparedStatement stmt = conn.prepareStatement("SELECT empresa_proveedor,codigo_producto FROM proveedor_producto where empresa_proveedor=? and codigo_producto=?");
        stmt.setString(1, pr.getNombre());
        stmt.setInt(2, p.getCodigo());
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            valor = true;
        }
        stmt.close();
        rs.close();

        return valor;
    }

    public boolean registrarProductoExistente(Producto p, Proveedor pr) throws Exception {
        boolean exito = false;
        conn = Conexion.crearConexion();
        boolean suite = this.verificarProductoProveedor(p, pr);
        try {
            PreparedStatement stmt = null;
            if (suite) {
                stmt = conn.prepareStatement("update proveedor_producto set cantidad=cantidad+" + p.getCantidad() + " where codigo_producto=" + p.getCodigo());
                int total = stmt.executeUpdate();
                if (total > 0) {
                    exito = true;
                    this.actualizarStockProducto(p);
                }

            } else {
                System.out.println("CALROS ALFREDOT");
                System.out.println(p.getCodigo());
                System.out.println(p.getNombre());
                stmt = conn.prepareStatement("insert into proveedor_producto (empresa_proveedor,codigo_producto,cantidad) values(?,?,?)");
                stmt.setString(1, pr.getNombre());
                stmt.setInt(2, p.getCodigo());
                stmt.setInt(3, p.getCantidad());
                int total = stmt.executeUpdate();
                if (total > 0) {
                    this.actualizarStockProducto(p);
                    exito = true;
                }

            }

            stmt.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return exito;
    }

    /**
     * actualiza el stock de productos
     *
     * @param p
     * @throws SQLException
     */
    public void actualizarStockProducto(Producto p) throws SQLException {
        boolean exito = false;
        PreparedStatement stmt = conn.prepareStatement("update producto  set cantidad=cantidad+" + p.getCantidad() + " where codigo=?");
        stmt.setInt(1, p.getCodigo());
        int total = stmt.executeUpdate();
        if (total > 0) {
            stmt.close();
            exito = true;
        }
        stmt.close();
    }

}
