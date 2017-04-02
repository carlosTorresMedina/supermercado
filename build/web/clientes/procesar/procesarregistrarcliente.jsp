<%--
    Document   : procesarregistrarcliente
    Created on : 21/10/2015, 04:46:05 PM
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
    String telefono = request.getParameter("telefono");

    Fachada fachada = new Fachada();
    String x = fachada.registrarCliente(documento, nombre, apellido, email, password, direccion, saldo, telefono);
    String msg = "";

    if (x.equals("S")) {
        msg = "Registro exitos";
    } else if (x.equals("O")) {
        msg = "El usuario " + documento + " ya se encuentra registrado como administrador<br>si desea registrarlo como administrador hagalo desde la seccion cliente";
    } else {
        msg = "El usuario ya encuentra registrado";
    }
%>

<%=msg%>