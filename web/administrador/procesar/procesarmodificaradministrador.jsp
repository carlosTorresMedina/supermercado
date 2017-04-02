<%-- 
    Document   : procesarmodificaradministrador
    Created on : 23/10/2015, 08:21:08 PM
    Author     : carlos
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String documento = request.getParameter("documento");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String email = request.getParameter("email");
    String direccion = request.getParameter("direccion");
    String password = request.getParameter("password");
    String telefono=request.getParameter("telefono");
    Fachada fachada = new Fachada();
    boolean x = fachada.ActualizarAdministrador(documento, nombre, apellido, email, password, direccion,telefono);
    String msg = "";
    if (x == true) {
        msg = "Modificacion exitosa";
    } else {
        msg = "error en la modificacion";
    }


%>

<%=msg%>
