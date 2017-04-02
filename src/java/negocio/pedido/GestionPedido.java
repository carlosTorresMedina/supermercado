package negocio.pedido;

import dao.PedidoDAO;
import dto.Pedido;
import dto.Persona;
import dto.Producto;
import java.util.List;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:39:18 a.m.
 */
public class GestionPedido {

    public GestionPedido() {

    }

    /**
     * Permite registrar un pedido de un cliente
     *
     * @param persona
     * @param tipo Tipo de pedido
     * @param fecha Fecha en la que se realizo el pedido
     * @param productos Listado de productos seleccionados por el cliente
     * @return estado true para un registro existoso
     * @throws Exception
     */
    public boolean registrarPedido(Persona persona, byte tipo, String fecha, List<Producto> productos) throws Exception {

        Pedido pedido = new Pedido();
        pedido.setCliente(persona);
        pedido.setTipo(tipo);
        pedido.setFecha(fecha);
        pedido.setProductos(productos);

        PedidoDAO dao = new PedidoDAO();

        return dao.registrar(pedido);

    }

    /**
     * Permite obtener un pedido pos su identificador
     *
     * @param codigo Identificador
     */
    public Pedido consultarPedido(int codigo) {
        PedidoDAO dao = new PedidoDAO();

        try {
            return dao.get(codigo);

        } catch (Exception ex) {

        }

        return null;
    }

    /**
     * Permite obtener o listar todos los pedidos que esten pendientes por
     * despachar
     *
     * @return pedidos listado de pedidos
     * @throws Exception
     */
    public List<Pedido> listarPedidosPendientes() throws Exception {

        PedidoDAO dao = new PedidoDAO();

        return dao.getPedidosPendientes();
    }

    /**
     * Permite obtener todos los productos que hacen parte de un pedido el
     * pedido
     *
     * @param id Identificador del pedido
     * @return productos Listado de productos
     * @throws Exception
     */
    public List<Producto> listarProductosPedido(int id) throws Exception {

        PedidoDAO dao = new PedidoDAO();

        return dao.getPedidoProductos(id);
    }

    /**
     * Permite cambiar el estado del pedido a Despachado
     *
     * @param id Identificador del pedido
     * @param estado Estado nuevo del pedido
     * @return boolean
     */
    public boolean actualizarEstadoProducto(int id, int estado) {

        PedidoDAO dao = new PedidoDAO();

        try {
            return dao.actualizarEstadoProducto(id, estado);

        } catch (Exception ex) {

        }

        return false;
    }

    /**
     * Permite obtener el número de pedidos pendientes
     *
     * @return cantidad
     */
    public int getNumPedidosPendientes() {

        PedidoDAO dao = new PedidoDAO();

        try {
            return dao.getNumPedidosPendientes();

        } catch (Exception ex) {

        }

        return 0;
    }

    /**
     * Permite retornar el pedido pendiente de un cliente
     *
     * @param documento Documento de identificación de un cliente
     * @return
     */
    public List<Pedido> getPedidoPendiente(String documento) {

        PedidoDAO dao = new PedidoDAO();

        try {
            return dao.getPedidoPendiente(documento);

        } catch (Exception ex) {

        }

        return null;
    }

    /**
     * Permite validar una compra que desea hacer un cliente
     *
     * @param p Cliente
     * @param valorCompra Valor que desea comprar
     * @return String[]
     */
    public String[] validarCompra(Persona p, double valorCompra) {

        //[0] -> Estado
        //[1] -> Valor mínimo permitido
        //[2] -> Valor maximo permitido
        String[] valores = new String[3];
        valores[1] = String.valueOf(15000);

        if (p != null) {
            valores[0] = (valorCompra >= 15000 && valorCompra <= p.getSaldo_limite()) ? "1" : "0";
            valores[2] = String.valueOf(p.getSaldo_limite());
        }

        return valores;
    }

    /**
     * Permite listar todos los pedidos realizados a la fecha
     *
     * @return Listado de pedidos
     */
    public List<Pedido> listarPedidos() {

        PedidoDAO dao = new PedidoDAO();

        try {
            return dao.getAll();

        } catch (Exception ex) {

        }

        return null;

    }
}
