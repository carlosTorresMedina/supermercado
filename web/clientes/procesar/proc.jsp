<%-- 
    Document   : proc
    Created on : 31/10/2015, 02:08:59 PM
    Author     : carlos
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Fachada fachada = new Fachada();
    String documento = request.getParameter("documento");
    boolean x = fachada.registroPersonal(documento, "cliente", 0);
    String msg = "";
    if (x) {
        msg = "El cliente se registro como administrador de manera exitosa";
    } else {
        msg = "El usuario con el documento " + documento + " <br> ya se encuentra registrado como administrador";
    }
%>

<%= msg%>