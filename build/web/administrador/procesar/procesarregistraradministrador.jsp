<%-- 
    Document   : procesarregistraradministrador
    Created on : 23/10/2015, 11:32:16 AM
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
    String telefono = request.getParameter("telefono");
    String password = request.getParameter("password");
 
    Fachada fachada = new Fachada();
    String x = fachada.registrarAdministrador(documento, nombre, apellido, email, password, direccion,telefono);
    String msg = "";

    if (x.equals("S")) {
        msg = "Registro exitos";
    } else if (x.equals("O")) {
        msg = "El usuario " + documento + " ya se encuentra registrado como cliente<br>si desea registrarlo como administrador hagalo desde la seccion cliente";
    } else {
        msg = "El usuario ya se encuentra registrado";
    }
%>

<%=msg%>

