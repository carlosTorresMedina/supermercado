<%-- 
    Document   : confirmarCompra
    Created on : 12/12/2015, 10:49:47 PM
    Author     : freddhy
--%>

<%@page import="facade.Fachada"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Producto"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    JSONObject json = new JSONObject();
    Map<String, Producto> carro = null;
    Object obj = session.getAttribute("carro");

    Fachada fachada = new Fachada();

    if (obj != null) {

        carro = (HashMap<String, Producto>) obj;

        if (fachada.registrarPedido(String.valueOf(session.getAttribute("documento")), carro)) {
            //Se eliminan los productos en el carro de compras
            session.setAttribute("carro", null);
            session.setAttribute("totalVenta", 0.0);
            session.setAttribute("numProductos", 0);
            json.put("estado", true);

            out.print(json);
            out.flush();

            return;
        }
    }
    json.put("estado", false);
    out.print(json);
    out.flush();

%>