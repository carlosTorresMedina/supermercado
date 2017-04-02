<%-- 
    Document   : procesarmodificaradministrador
    Created on : 23/10/2015, 08:26:12 PM
    Author     : carlos
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String documento = request.getParameter("documento");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String email = request.getParameter("email");
    String direccion = request.getParameter("direccion");
    String saldo = request.getParameter("saldo");
    String password = request.getParameter("password");
    String telefono=request.getParameter("telefono");

    Fachada fachada = new Fachada();
    boolean x = fachada.ActualizarCliente(documento, nombre, apellido, email, password, direccion, saldo,telefono);
    String msg = "";
    if (x == true) {
        msg = "Modificacion exitosa";
    } else {
        msg = "error en la modificacion";
    }

%>

<%=msg%>

