<%-- 
    Document   : validarPedidosPendientes
    Created on : 13/12/2015, 09:40:03 PM
    Author     : freddhy
--%>

<%@page import="facade.Fachada"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /**
     * Permite obtener el número de pedidos pendientes
     */
    String tipo = String.valueOf(session.getAttribute("tipo"));

    if (tipo != null && tipo.equalsIgnoreCase("administrador")) {
        JSONObject json = new JSONObject();

        Fachada fachada = new Fachada();
        json.put("cantida", fachada.getNumPedidosPendientes());
        
        out.print(json);
        out.flush();
        
        return;
    } else {
        response.sendRedirect("../index.jsp");
    }
%>
