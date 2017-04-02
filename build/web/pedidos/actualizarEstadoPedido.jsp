<%-- 
    Document   : actualizarEstadoPedido
    Created on : 13/12/2015, 08:11:16 PM
    Author     : freddhy
--%>

<%@page import="facade.Fachada"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /**
     * Permite por parte del administrador cambiar el estado de un pedido, los
     * estados son 2 -> Despachado, 3 -> Entregado
     */
    String tipo = String.valueOf(session.getAttribute("tipo"));

    if (tipo != null && tipo.equalsIgnoreCase("administrador")) {
        JSONObject json = new JSONObject();

        Fachada fachada = new Fachada();

        try {
            json.put("estado", fachada.actualizarEstadoProducto(
                    Integer.parseInt(request.getParameter("id")), Integer.parseInt(request.getParameter("estado"))));

        } catch (NumberFormatException ne) {
            json.put("estado", false);
            json.put("msg", "Error al intentar pasar a entero");
        }

        out.print(json);
        out.flush();
    } else {
        response.sendRedirect("../index.jsp");
    }

%>