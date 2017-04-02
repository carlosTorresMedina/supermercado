package negocio.producto;

import dao.ProductoDAO;
import dto.Producto;
import dto.Proveedor;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:39:18 a.m.
 */
public class GestionProducto {

    public GestionProducto() {

    }

    /**
     * acomoda la ruta de la imagen de un producto
     *
     * @param codigo
     * @param ruta
     * @return
     */
    public boolean acomodarRutaProducto(int codigo, String ruta) throws Exception {
        ProductoDAO dao = new ProductoDAO();
        Producto dto = new Producto();
        dto.setCodigo(codigo);
        dto.setRutaImagen(ruta);
        boolean x = false;

        x = dao.acomodarRutaProducto(dto);

        return x;
    }

    /**
     * registra producto en el sistema
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
    public boolean registrarProducto(String proveedor, String tipo, String marca, String nombre, int cantidad, double precioventa, double preciocompra) throws Exception {
        ProductoDAO dao = new ProductoDAO();
        Producto p = new Producto();
        p.setMarca(marca);
        p.setNombre(nombre);
        p.setTipo_producto(tipo);
        p.setCantidad(cantidad);
        p.setPrecio_venta(precioventa);
        p.setPrecio_compra(preciocompra);
        p.setRutaImagen("public/img/productos/sinimagen.png");
        Proveedor pr = new Proveedor();
        pr.setNombre(proveedor);
        return dao.registrarProducto(p, pr);
    }

    /**
     *
     * @param codigo
     * @return
     */
    public Producto consultarProducto(String codigo) {

        try {
            dao.ProductoDAO dao = new ProductoDAO();

            return dao.get(new Integer(codigo));

        } catch (NumberFormatException ne) {
            ne.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Producto consultarProductoxNombre(String nombre) {
        try {
            dao.ProductoDAO dao = new ProductoDAO();

            return dao.consultarProductoxNombre(nombre);

        } catch (NumberFormatException ne) {
            ne.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Producto> listarProductos() throws Exception {

        dao.ProductoDAO dao = new ProductoDAO();

        return dao.getAll();
    }

    /**
     *
     * @param codigo
     * @param cantidad
     */
    public boolean incrementarStock(int codigo, int cantidad) {

        return false;
    }

    /**
     *
     * @param codigo
     * @param cantidad
     */
    public boolean reducirStock(int codigo, int cantidad) {

        return false;
    }

    /**
     * lista los tipos de productos que existen en el sistema
     *
     * @return
     * @throws Exception
     */
    public List<String> listarTipoProducto() throws Exception {
        dao.ProductoDAO dao = new ProductoDAO();
        return dao.listarTipoProducto();
    }

    /**
     * lista todos los productos de un determinado tipo
     *
     * @param tipo
     * @return
     */
    public List<Producto> listarProductoTipo(String tipo) throws Exception {
        dao.ProductoDAO dao = new ProductoDAO();
        return dao.listarProductoTipo(tipo);

    }

    /**
     * lista los productos de un determinado proveedor
     *
     * @param nombre
     * @return
     */
    public List<Producto> listarProductosProveedor(String nombre) throws Exception {
        dao.ProductoDAO dao = new ProductoDAO();
        return dao.listarProductosProveedor(nombre);
    }

    /**
     * lista las marcas registradas en el sistema
     *
     * @return
     * @throws Exception
     */
    public List<String> listarMarcaProducto() throws Exception {
        dao.ProductoDAO dao = new ProductoDAO();
        return dao.listarMarcaProducto();

    }

    public boolean actualizarProducto(int codigo, String tipo, String marca, double precio_venta, double precio_compra) throws Exception {
        dao.ProductoDAO dao = new ProductoDAO();
        dto.Producto dto = new Producto();
        dto.setCodigo(codigo);
        dto.setTipo_producto(tipo);
        dto.setMarca(marca);
        dto.setPrecio_venta(precio_venta);
        dto.setPrecio_compra(precio_compra);
        return dao.actualizar(dto);
    }

    public boolean registrarProductoExistente(String producto, String proveedor, int cantidad) throws Exception {
        dao.ProductoDAO dao = new ProductoDAO();
        dto.Producto p = new Producto();
        p = this.consultarProductoxNombre(producto);
        dto.Proveedor pr = new Proveedor();
        p.setCantidad(cantidad);
        pr.setNombre(proveedor);
        return dao.registrarProductoExistente(p, pr);
    }

}
