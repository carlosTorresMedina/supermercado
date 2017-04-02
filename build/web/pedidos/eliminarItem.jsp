<%-- 
    Document   : eliminarItem
    Created on : 12/12/2015, 10:05:39 PM
    Author     : freddhy
--%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Producto"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    /**
     * Permite eliminar por parte del cliente un item o producto del carro de compras
     * (Se elimina todos los n productos que existan en el carro de compras)
     */
    Map<String, Producto> carro = null;
    Object obj = session.getAttribute("carro");

    String codigoProducto = request.getParameter("codigo");

    if (codigoProducto != null && !codigoProducto.isEmpty()) {
        //Validaciín de la existencia del carro de compras
        if (obj != null) {
            carro = (HashMap<String, Producto>) obj;
            Producto p = carro.get(codigoProducto);
            carro.remove(codigoProducto);

            //Actualizando valores del carro
            double total = (Double) session.getAttribute("totalVenta");
            int numProductos = (Integer) session.getAttribute("numProductos");

            session.setAttribute("totalVenta", (total - (p.getPrecio_venta() * p.getCantidad())));
            session.setAttribute("numProductos", (numProductos - p.getCantidad()));

            //Eliminación exitosa
            out.print(1);
            return;
        }
    }
    out.print(-1);

%>