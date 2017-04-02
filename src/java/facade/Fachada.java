package facade;

import dao.ProductoDAO;
import dao.ProveedorDAO;
import dto.Pedido;
import dto.Persona;
import dto.Producto;
import dto.Proveedor;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.pedido.GestionPedido;
import negocio.personal.GestionPersonal;
import negocio.producto.GestionProducto;

/**
 * es en la fachada donde se van a capturar las exception
 *
 * @author carlos
 */
public class Fachada {

    /**
     * iniciar sesion true: puede acceder al sistema, false: no puede acceder al
     * sistema
     *
     * @param documento
     * @param password
     * @return
     * @throws Exception
     */
    public Persona iniciarSesion(String tipo, String documento, String password) throws Exception {

        negocio.login.Login login = new negocio.login.Login();
        Persona dto = login.iniciarSesion(tipo, documento, password);
        return dto;
    }

    /**
     * registra un administrador en el sistema
     *
     * @param documento
     * @param nombre
     * @param apellido
     * @param email
     * @param password
     * @param direccion
     * @return
     */
    public String registrarAdministrador(String documento, String nombre, String apellido, String email, String password, String direccion, String telefono) {
        negocio.personal.GestionPersonal gestionPersonal = new negocio.personal.GestionPersonal();
        String x = "N";
        try {
            x = gestionPersonal.registrarAdministrador(documento, nombre, apellido, email, password, direccion, "administrador", telefono);
        } catch (Exception ex) {
            System.out.println("INFORMACION::>");
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return x;
        }
    }

    /**
     * registra un cliente en el sistema
     *
     * @param documento
     * @param nombre
     * @param apellido
     * @param email
     * @param password
     * @param direccion
     * @param saldo_limite
     * @return
     * @throws Exception
     */
    public String registrarCliente(String documento, String nombre, String apellido, String email, String password, String direccion, String saldo_limite, String telefono) {
        double saldo = Double.parseDouble(saldo_limite);
        String x = "";
        negocio.personal.GestionPersonal gestionCliente = new negocio.personal.GestionPersonal();
        try {
            x = gestionCliente.registrarCliente(documento, nombre, apellido, email, password, direccion, "cliente", saldo, telefono);
        } catch (Exception ex) {
            System.out.println("INFORMACION::>");
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return x;
        }
    }

    /**
     * actualiza la informacion de un admnistrador
     *
     * @param documento
     * @param nombre
     * @param apellido
     * @param email
     * @param password
     * @param direccion
     * @param saldo_limite
     * @return
     * @throws Exception
     */
    public boolean ActualizarCliente(String documento, String nombre, String apellido, String email, String password, String direccion, String saldo_limite, String telefono) {
        double saldo = Double.parseDouble(saldo_limite);
        negocio.personal.GestionPersonal gestionCliente = new negocio.personal.GestionPersonal();
        boolean x = false;
        try {
            x = gestionCliente.actualizarCliente(documento, nombre, apellido, email, password, direccion, saldo, telefono);
        } catch (Exception ex) {
            System.out.println("INFORMACION::>");
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return x;
        }
    }

    /**
     * actualiza la informacion de un administrador
     *
     * @param documento
     * @param nombre
     * @param apellido
     * @param email
     * @param password
     * @param direccion
     * @return
     */
    public boolean ActualizarAdministrador(String documento, String nombre, String apellido, String email, String password, String direccion, String telefono) {
        negocio.personal.GestionPersonal gestionAdministrador = new negocio.personal.GestionPersonal();
        boolean x = false;
        try {
            x = gestionAdministrador.actualizarAdministrador(documento, nombre, apellido, email, password, direccion, telefono);
        } catch (Exception ex) {

            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return x;
        }
    }

    /**
     * consulta un usuario del sistema ya sea administrador o cliente
     *
     * @param documento
     * @return
     * @throws Exception
     */
    public Persona consultarPersonal(String documento) {
        negocio.personal.GestionPersonal gestionPersonal = new negocio.personal.GestionPersonal();
        dto.Persona dto = null;
        try {
            dto = gestionPersonal.consultarPersonal(documento);
        } catch (Exception ex) {
            System.out.println("INFORMACION::>");
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dto;

    }

    /**
     * <<<<<<< HEAD retorna una lista con todos los clientes registrados en el
     * sistema.
     *
     * @return
     * @throws Exception
     */
    public ArrayList<dto.Persona> listarClientes() {
        ArrayList<dto.Persona> lista = new ArrayList();
        negocio.personal.GestionPersonal gestionCliente = new negocio.personal.GestionPersonal();
        try {
            lista = gestionCliente.listarClientes();
        } catch (Exception ex) {
            System.out.println("INFORMACION::>");
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    /**
     * retorna una lista con todos los administradores registrados en el sistema
     *
     * @return
     * @throws Exception
     */
    public ArrayList<dto.Persona> listarAdministradores() {
        negocio.personal.GestionPersonal gestionCliente = new negocio.personal.GestionPersonal();
        ArrayList<dto.Persona> lista = new ArrayList();
        try {
            lista = gestionCliente.listarAdministradores();
        } catch (Exception ex) {

            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }

    /**
     * metodo que registra a un amdministrador que ya encontraba como cliente o
     * viceversa el parametro val indica como se va a regisrar el usuario
     * administrador= vuelve a un administrador como cliente cliente=vuelve a un
     * cliente como administrador
     *
     * @param documento
     * @return
     */
    public boolean registroPersonal(String documento, String val, float valor) {
        negocio.personal.GestionPersonal gestionAdmin = new GestionPersonal();
        boolean x = false;
        try {
            if (val.equals("administrador")) {
                x = gestionAdmin.registroAdminCliente(documento, valor);
            }
            if (val.equals("cliente")) {
                x = gestionAdmin.registrarClienteAdmin(documento);
            }
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return x;
        }

    }

    /**
     * registra un proveedor en el sistema
     *
     * @param nombre
     * @param email
     * @param direccion
     * @return
     * @throws Exception
     */
    public boolean registrarProveedor(String nombre, String email, String direccion) throws Exception {
        Proveedor proveedor = new Proveedor(nombre, email, direccion);
        ProveedorDAO dao = new ProveedorDAO();
        return dao.registrar(proveedor);
    }

    /**
     * actualiza la informacion de un proveedor en el sistema
     *
     * @param nombre
     * @param email
     * @param direccion
     * @return
     * @throws Exception
     */
    public boolean actualizarProveedor(String nombre, String email, String direccion) throws Exception {
        Proveedor proveedor = new Proveedor(nombre, email, direccion);
        ProveedorDAO dao = new ProveedorDAO();
        return dao.actualizar(proveedor);
    }

    /**
     * lista todos los proveedores en el sistema
     *
     * @return
     * @throws Exception
     */
    public List<Proveedor> listarProveedores() throws Exception {
        ProveedorDAO dao = new ProveedorDAO();
        return dao.getAll();
    }

    /**
     * lista un determinado proveedor
     *
     * @param nombre
     * @return
     * @throws Exception
     */
    public Proveedor consultarProveedor(String nombre) throws Exception {
        negocio.proveedor.GestionProveedor proveedor = new negocio.proveedor.GestionProveedor();
        return proveedor.consultarProveedor(nombre);
    }

    /**
     * consulta un producto segun su codigo
     *
     * @param codigo
     * @return
     */
    public Producto consultarProducto(String codigo) {
        negocio.producto.GestionProducto gestionProducto = new negocio.producto.GestionProducto();
        return gestionProducto.consultarProducto(codigo);
    }

    /**
     * consulta productos segun su nombre
     *
     * @param nombre
     * @return
     */
    public Producto consultarProductoxNombre(String nombre) {
        negocio.producto.GestionProducto gestionProducto = new negocio.producto.GestionProducto();
        return gestionProducto.consultarProductoxNombre(nombre);
    }

    /**
     * lista todos los productos en el sistema
     *
     * @return
     * @throws Exception
     */
    public List<Producto> listarProductos() {
        List<Producto> lista = new ArrayList();

        negocio.producto.GestionProducto gestionProducto = new negocio.producto.GestionProducto();

        try {
            lista = gestionProducto.listarProductos();
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return lista;
        }

    }

    /**
     * lista los tipos de productos registrados en el sistema
     *
     * @return
     */
    public List<String> listarTipoProducto() {
        List<String> lista = new ArrayList();
        negocio.producto.GestionProducto gestionProducto = new negocio.producto.GestionProducto();
        try {

            lista = gestionProducto.listarTipoProducto();
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return lista;
        }
    }

    /**
     * lista los productos segun su tipo
     *
     * @param tipo
     * @return
     */
    public List<Producto> listarProductoTipo(String tipo) {
        if (tipo.equals("Todos")) {
            return this.listarProductos();
        }
        List<Producto> lista = new ArrayList();
        negocio.producto.GestionProducto gestionProducto = new negocio.producto.GestionProducto();
        try {
            lista = gestionProducto.listarProductoTipo(tipo);
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return lista;
        }
    }

    /**
     * lista los productos que provee un determinado proveedor
     *
     * @param nombre
     * @return
     */
    public List<Producto> listarProductosProveedor(String nombre) {
        List<Producto> lista = new ArrayList();
        negocio.producto.GestionProducto gestionProducto = new negocio.producto.GestionProducto();
        try {
            lista = gestionProducto.listarProductosProveedor(nombre);
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return lista;
        }
    }

    /**
     * lista las marcas que estan registradas en el sistema
     *
     * @return
     */
    public List<String> listarMarcaProducto() {
        List<String> lista = new ArrayList();
        negocio.producto.GestionProducto gestionProducto = new negocio.producto.GestionProducto();
        try {
            lista = gestionProducto.listarMarcaProducto();
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return lista;
        }
    }

    /**
     * registra un producto en el sistema
     *
     * @param proveedor
     * @param tipo
     * @param marca
     * @param nombre
     * @param cantidad
     * @param precioventa
     * @param preciocompra
     * @return
     */
    public boolean registrarProducto(String proveedor, String tipo, String marca, String nombre, String cantidad, String precioventa, String preciocompra) {

        boolean x = false;
        negocio.producto.GestionProducto gestionproducto = new GestionProducto();
        double precio_compra = Double.parseDouble(preciocompra);
        double precio_venta = Double.parseDouble(precioventa);
        int cantidads = Integer.parseInt(cantidad);
        try {
            x = gestionproducto.registrarProducto(proveedor, tipo, marca, nombre, cantidads, precio_venta, precio_compra);
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            return x;
        }

    }

    /**
     * acomoda la ruta de un determinado producto
     *
     * @param codigo
     * @param ruta
     * @return
     */
    public boolean acomodarRutaImagenProducto(String codigo, String ruta) {
        boolean rta = false;
        System.out.print("carlos alfredo torres medina" + codigo);
        int codigof = Integer.parseInt(codigo);
        negocio.producto.GestionProducto gestionproducto = new GestionProducto();
        try {
            rta = gestionproducto.acomodarRutaProducto(codigof, ruta);
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rta;
    }

    /**
     * actaliza la informacion de unn deternimado producto en base a los
     * parametros pasados en el metodo
     *
     * @param codigo
     * @param tipo
     * @param marca
     * @param precioventa
     * @param preciocompra
     * @return
     */
    public boolean actualizarProducto(String codigo, String tipo, String marca, String precioventa, String preciocompra) {
        boolean exito = false;
        double precio_venta = Double.parseDouble(precioventa);
        double precio_compra = Double.parseDouble(preciocompra);
        int codigof = Integer.parseInt(codigo);

        negocio.producto.GestionProducto gestionproducto = new GestionProducto();
        try {
            exito = gestionproducto.actualizarProducto(codigof, tipo, marca, precio_venta, precio_compra);
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return exito;
        }
    }

    public boolean registrarProductoExistente(String producto, String proveedor, String cantidad) {
        boolean valor = false;
        int cantidadf = Integer.parseInt(cantidad);
        System.out.println("FACHADA" + cantidadf);
        negocio.producto.GestionProducto gestion = new GestionProducto();

        try {
            valor = gestion.registrarProductoExistente(producto, proveedor, cantidadf);
        } catch (Exception ex) {
            Logger.getLogger(Fachada.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return valor;
        }
    }

    /**
     * Permite obtener un cliente o empleado por su número de identificación
     *
     * @param documento Número de identificación
     * @return
     */
    public Persona getPersona(String documento) {

        GestionPersonal gp = new GestionPersonal();
        Persona p = null;

        try {
            p = gp.consultarPersonal(documento);
        } catch (Exception ex) {

        }

        return p;
    }

    /**
     * Permite el registro de un pedido de un cliente
     *
     * @param documentoCliente Número de documento de identidad del cliente
     * @param productos Listado de productos solicitados por el cliente
     * @return estado
     */
    public boolean registrarPedido(String documentoCliente, Map<String, Producto> productos) {

        GestionPedido gPedido = new GestionPedido();
        GestionPersonal gPersonal = new GestionPersonal();
        byte tipo = 1;

        try {
            //Cuadrando la fecha
            DateFormat inFormat = new SimpleDateFormat("yyyy-MM-dd");
            inFormat.setTimeZone(TimeZone.getTimeZone("America/Bogota"));
            Date purchaseDate = new Date();
            String fecha = inFormat.format(purchaseDate);

            return gPedido.registrarPedido(gPersonal.consultarPersonal(documentoCliente),
                    tipo, fecha, new ArrayList<>(productos.values()));

        } catch (Exception ex) {
            System.err.println("ERROR fachada " + ex.getMessage());
        }

        return false;
    }

    /**
     * Permite listar todos los pedidos pendientes
     *
     * @return
     */
    public List<Pedido> listarPedidosPendientes() {

        try {
            GestionPedido gPedido = new GestionPedido();

            return gPedido.listarPedidosPendientes();

        } catch (Exception ex) {

        }

        return new ArrayList<Pedido>();
    }

    /**
     * Permite obtener un pedido con todos sus productos
     *
     * @param id Identificador del pedido
     * @return
     */
    public Pedido getPedidoProductos(int id) {

        try {
            GestionPedido gPedido = new GestionPedido();
            Pedido pedido = gPedido.consultarPedido(id);

            pedido.setProductos(gPedido.listarProductosPedido(id));

            return pedido;

        } catch (Exception ex) {

        }

        return null;
    }

    /**
     * Permite cambiar el estado en el que se encuentra un pedido
     *
     * @param id Identificador del pedido
     * @param estado Estado nuevo del pedido
     * @return boolean
     */
    public boolean actualizarEstadoProducto(int id, int estado) {

        GestionPedido gPedido = new GestionPedido();

        return gPedido.actualizarEstadoProducto(id, estado);
    }

    /**
     * Permite obtener el número de pedidos pendientes
     *
     * @return cantidad
     */
    public int getNumPedidosPendientes() {

        GestionPedido gPedido = new GestionPedido();

        return gPedido.getNumPedidosPendientes();
    }

    /**
     * Permite retornar el pedido pendiente de un cliente
     *
     * @param documento
     * @return
     */
    public List<Pedido> getPedidoPendiente(String documento) {

        GestionPedido gPedido = new GestionPedido();

        return gPedido.getPedidoPendiente(documento);
    }

    /**
     * Permite validar una compra que desea hacer un cliente
     *
     * @param documento
     * @param valorCompra
     * @return
     */
    public String[] validarCompra(String documento, double valorCompra) {

        try {
            GestionPersonal gPersonal = new GestionPersonal();
            GestionPedido gPedido = new GestionPedido();

            Persona persona = gPersonal.consultarPersonal(documento);

            return gPedido.validarCompra(persona, valorCompra);

        } catch (Exception ex) {

        }

        return null;
    }

    /**
     * Permite listar todos los pedidos a la fecha
     *
     * @return Listado de pedidos
     */
    public List<Pedido> listarPedidos() {

        GestionPedido gPedido = new GestionPedido();

        return gPedido.listarPedidos();
    }

}
