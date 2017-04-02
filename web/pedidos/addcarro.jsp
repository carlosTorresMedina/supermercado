<%-- 
    Document   : addcarro
    Created on : 9/11/2015, 10:23:10 PM
    Author     : Freddhy
--%>

<%@page import="facade.Fachada"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Producto"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    /**
     * Permite agregar por parte del cliente un producto y su cantidad al carro
     * de compras
     */
    double total = 0.0;
    int numProductos = 0;
    Map<String, Producto> carro = null;
    Object obj = session.getAttribute("carro");

    //Obteniendo los datos 
    String codigo = request.getParameter("codigo");
    String cantidad = request.getParameter("cantidad");

    //Validación de las entradas
    if (codigo != null && cantidad != null) {

        Fachada f = new Fachada();
        Producto p = f.consultarProducto(codigo);

        if (p != null) {
            //Cantidad de productos a comprar
            int cant = Integer.parseInt(cantidad);
            //Cantidad de productos en inventario
            int cantidadDisponible = p.getCantidad();
            //Se actualiza en productos la cantidad del mismo que se desea comprar
            p.setCantidad(cant);

            //Validaciín de la existencia del carro de compras
            if (obj != null) {
                carro = (HashMap<String, Producto>) obj;
                total = (Double) session.getAttribute("totalVenta");
                numProductos = (Integer) session.getAttribute("numProductos");
            } else {
                //Sino existe el carro, se crea
                carro = new HashMap<String, Producto>();

                session.setAttribute("carro", carro);
                session.setAttribute("totalVenta", 0.0);
                session.setAttribute("numProductos", 0);
            }
            //Valida si ya existe el producto en el carro
            Producto producto = carro.get(codigo);
            if (producto != null) {
                //Si ya existe el producto se le suman las nuevas cantidades
                producto.setCantidad(producto.getCantidad() + p.getCantidad());

                //Validación de existencia de la cantidad requerida
                if (producto.getCantidad() > cantidadDisponible) {
                    out.print(200);
                    return;
                }

            } else {
                //Se agrega un nuevo producto al carro
                carro.put(codigo, p);
            }

            double valor = p.getPrecio_venta() * cant;
            //Actualización de los datos
            session.setAttribute("totalVenta", (total + valor));
            session.setAttribute("numProductos", (numProductos + cant));

            //Actualización del HTML
            out.print("<span id='cantidad-productos'>" + (numProductos + cant) + "</span><span> Productos</span><br>");
            out.print("$ <span id='total'>" + (total + valor) + "</span>");
        }
    } else {
        out.print(100);
    }


%>