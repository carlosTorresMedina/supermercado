<%-- 
    Document   : validarCompra
    Created on : 13/12/2015, 09:31:35 AM
    Author     : freddhy
--%>

<%@page import="dto.Persona"%>
<%@page import="facade.Fachada"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Producto"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    /**
     * Permite la validación de una compra por parte del cliente
     */
    JSONObject json = new JSONObject();

    double valorComprar = (double) session.getAttribute("totalVenta");

    if (valorComprar > 0) {

        Fachada fachada = new Fachada();
        String[] result = fachada.validarCompra(String.valueOf(session.getAttribute("documento")), valorComprar);

        if (result != null && result[0].equals("1")) {
            json.put("estado", true);
        } else {
            json.put("estado", false);
            json.put("msg", "Solo puede hacer compras mayores a " + result[1] + " e inferiores <strong>$" + result[2] + "</strong>");
        }

    } else {
        json.put("estado", false);
        json.put("msg", "No hay productos en el carro");
    }

    out.print(json);
    out.flush();

%>