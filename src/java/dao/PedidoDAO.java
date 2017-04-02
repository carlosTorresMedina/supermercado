package dao;

import dto.Pedido;
import dto.Persona;
import dto.Producto;
import interfaces.IDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexion;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:37:14 a.m.
 */
public class PedidoDAO implements IDAO<Pedido> {

    private Connection conn = null;

    public PedidoDAO() {

    }

    @Override
    public boolean registrar(Pedido obj) throws Exception {

        conn = Conexion.crearConexion();

        boolean exito = false;

        try {
            conn.setAutoCommit(false);
            //Estado inicial de todo pedido es 1 (En proceso)
            int estado = 1;
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO pedido (documento, fecha, estado, tipo) values (?, ?, ?, ?)");
            stmt.setString(1, obj.getCliente().getDocumento());
            stmt.setString(2, obj.getFecha());
            stmt.setInt(3, estado);
            stmt.setInt(4, obj.getTipo());

            int total = stmt.executeUpdate();
            if (total > 0) {
                //conn.commit();
                PreparedStatement stm2 = conn.prepareStatement("SELECT max(id) id FROM pedido where documento=?");
                stm2.setString(1, obj.getCliente().getDocumento());
                ResultSet rs = stm2.executeQuery();

                if (rs.next()) {
                    int idPedido = rs.getInt("id");

                    PreparedStatement stm3 = conn.prepareStatement("INSERT INTO pedido_producto(id_pedido, codigo_producto, cantidad, precio_unitario) VALUES(?, ?, ?, ?)");

                    for (Producto producto : obj.getProductos()) {
                        stm3.setInt(1, idPedido);
                        stm3.setInt(2, producto.getCodigo());
                        stm3.setInt(3, producto.getCantidad());
                        stm3.setDouble(4, producto.getPrecio_venta());
                        stm3.executeUpdate();

                        conn.commit();
                    }

                }

                exito = true;
            }
            stmt.close();

        } catch (SQLException ex) {

            System.err.println("ERROR pedidoDAo48 -> " + ex.getMessage());
            conn.rollback();
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
    public boolean actualizar(Pedido obj) throws Exception {

        return false;
    }

    @Override
    public Pedido get(Object pk) throws Exception {

        Pedido pedido = new Pedido();
        int id = (int) pk;
        conn = Conexion.crearConexion();

        PreparedStatement stm = conn.prepareStatement("SELECT * FROM pedido where id=?");
        stm.setInt(1, id);

        ResultSet rs = stm.executeQuery();

        if (rs.next()) {
            pedido.setId(id);
            Persona p = new Persona();
            p.setDocumento(rs.getString(2));
            pedido.setCliente(p);
            pedido.setFecha(rs.getString(3));
        }

        stm.close();
        rs.close();
        conn.close();

        return pedido;
    }

    @Override
    public List<Pedido> getAll() throws Exception {

        List<Pedido> pedidos = new ArrayList<>();
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stm = conn.prepareStatement("SELECT * FROM pedido");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Pedido pedido = new Pedido();
                Persona persona = new Persona();

                pedido.setId(rs.getInt(1));
                persona.setDocumento(rs.getString(2));
                pedido.setCliente(persona);
                pedido.setFecha(rs.getString(3));
                pedido.setEstado(rs.getByte(4));
                pedido.setValor(this.getValorPedido(pedido.getId()));

                pedidos.add(pedido);
            }

            stm.close();
            rs.close();
            conn.close();

        } catch (Exception ex) {

        }

        return pedidos;
    }

    @Override
    public int count() throws Exception {

        return 0;
    }

    /**
     *
     * @param id
     * @param estado
     */
    public boolean actualizarEstado(int id, byte estado) {

        return false;
    }

    public List<Pedido> getPedidosPendientes() throws Exception {

        List<Pedido> pedidos = new ArrayList<>();
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stm = conn.prepareStatement("SELECT * FROM pedido WHERE estado<=2");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Pedido pedido = new Pedido();
                Persona persona = new Persona();

                pedido.setId(rs.getInt(1));
                persona.setDocumento(rs.getString(2));
                pedido.setCliente(persona);
                pedido.setFecha(rs.getString(3));
                pedido.setEstado(rs.getByte(4));
                pedido.setValor(this.getValorPedido(pedido.getId()));

                pedidos.add(pedido);
            }

            stm.close();
            rs.close();
            conn.close();

        } catch (Exception ex) {

        }

        return pedidos;
    }

    public List<Producto> getPedidoProductos(int id) throws Exception {

        List<Producto> productos = new ArrayList<>();
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT p.codigo, p.nombre, pp.cantidad, p.tipo_producto, p.marca, p.descripcion FROM pedido_producto pp, producto p WHERE pp.id_pedido=? AND pp.codigo_producto=p.codigo");

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setCodigo(rs.getInt(1));
                producto.setNombre(rs.getString(2));
                producto.setCantidad(rs.getInt(3));
                producto.setTipo_producto(rs.getString(4));
                producto.setMarca(rs.getString(5));
                producto.setDescripcion(rs.getString(6));

                productos.add(producto);
            }

            stmt.close();
            rs.close();

        } catch (Exception ex) {
            System.out.println("" + ex.toString());
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return productos;
    }

    public boolean actualizarEstadoProducto(int id, int estado) throws Exception {

        conn = Conexion.crearConexion();

        try {
            PreparedStatement stm = conn.prepareStatement("UPDATE pedido SET estado=? WHERE id=?");
            stm.setInt(1, estado);
            stm.setInt(2, id);

            int total = stm.executeUpdate();

            if (total > 0) {
                return true;
            }

        } catch (Exception ex) {

        }

        return false;
    }

    public int getNumPedidosPendientes() throws Exception {

        int pendientes = 0;
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stm = conn.prepareStatement("select count(*) pendientes from pedido where estado<=2");
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {

                return rs.getInt("pendientes");
            }

            stm.close();
            rs.close();
        } catch (Exception ex) {

        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return pendientes;
    }

    public List<Pedido> getPedidoPendiente(String documento) throws Exception {

        List<Pedido> pedidos = new ArrayList<>();
        conn = Conexion.crearConexion();

        try {
            PreparedStatement stm = conn.prepareStatement("select * from pedido where estado<=2 AND documento=?");
            stm.setString(1, documento);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Pedido p = new Pedido();
                p.setId(rs.getInt(1));
                Persona per = new Persona();
                per.setDocumento(rs.getString(2));
                p.setCliente(per);
                p.setFecha(rs.getString(3));
                p.setEstado(rs.getByte(4));

                pedidos.add(p);
            }
            //Obteniendo los valores del pedido
            for (Pedido p : pedidos) {
                p.setValor(this.getValorPedido(p.getId()));
            }

            stm.close();
            rs.close();
        } catch (Exception ex) {

        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return pedidos;
    }

    private double getValorPedido(int id) {

        double valor = 0.0;
        try {
            PreparedStatement stm = conn.prepareStatement("SELECT SUM(precio_unitario * cantidad) valor FROM pedido_producto WHERE id_pedido=" + id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                valor = rs.getDouble("valor");
            }
            stm.close();

        } catch (Exception ex) {

        }

        return valor;
    }

}
