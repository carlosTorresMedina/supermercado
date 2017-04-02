<%-- 
    Document   : proc
    Created on : 31/10/2015, 02:58:42 PM
    Author     : carlos
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Fachada fachada = new Fachada();
    String documento = request.getParameter("documento");
    float valor = Float.parseFloat(request.getParameter("valor"));
    boolean x = fachada.registroPersonal(documento, "administrador", valor);
    String msg = "";
    if (x) {
        msg = "El administrador se registro como cliente de manera exitosa";
    } else {
        msg = "El usuario con el documento " + documento + " <br> ya se encuentra registrado como cliente";
    }
%>

<%= msg%>
