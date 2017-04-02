<%-- 
    Document   : registrarexistente
    Created on : 13/12/2015, 06:58:13 PM
    Author     : carlos
--%>

<%@page import="facade.Fachada"%>
<%
    String proveedor = request.getParameter("proveedor");
    String producto = request.getParameter("producto");
    String cantidad = request.getParameter("cantidad");
    Fachada fachada = new Fachada();
    boolean valor = fachada.registrarProductoExistente(producto, proveedor, cantidad);

    if (valor) {
%>
<%= "listo"%>
<%  } else {
%>
<%= "ninguna"%>
<%  }
%>