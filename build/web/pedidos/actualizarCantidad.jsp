<%-- 
    Document   : actualizarCantidad
    Created on : 12/12/2015, 10:51:05 PM
    Author     : freddhy
--%>

<%@page import="java.util.HashMap"%>
<%@page import="dto.Producto"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    /**
     * Permite actualizar por parte del cliente la cantidad de un producto 
     * que esta en el carro de compras.
     */
    Map<String, Producto> carro = null;
    Object obj = session.getAttribute("carro");

    String codigoProducto = request.getParameter("codigo");
    String cantidad = request.getParameter("cantidad");

    try {
        if (cantidad != null && codigoProducto != null) {
            int cantidadNueva = Integer.parseInt(cantidad);

            if (obj != null) {
                carro = (HashMap<String, Producto>) obj;
                Producto p = carro.get(codigoProducto);

                //Actualizado la cantidad
                int cantidadAnterior = p.getCantidad();
                p.setCantidad(cantidadNueva);

                //Diferencia de la cantidad
                int dCantidad = cantidadNueva - cantidadAnterior;

                //Actualizando valores del carro
                double total = (Double) session.getAttribute("totalVenta");
                int numProductos = (Integer) session.getAttribute("numProductos");

                session.setAttribute("totalVenta", (total + (p.getPrecio_venta() * dCantidad)));
                session.setAttribute("numProductos", (numProductos + (dCantidad)));

                //Actualizacion exitosa
                out.print(1);
                return;
            }
        }

    } catch (NumberFormatException ne) {

    }
    
     out.print(2);

%>