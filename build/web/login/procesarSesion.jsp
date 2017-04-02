<%-- 
    Document   : procesarLogin
    Created on : 12/10/2015, 02:34:08 PM
    Author     : carlos
--%>

<%@page import="dto.Persona"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String tipo = request.getParameter("tipo");
    String documento = request.getParameter("documento");
    String password = request.getParameter("clave");

    Fachada fachada = new Fachada();
    Persona dto = fachada.iniciarSesion(tipo, documento, password);
    String mensaje = "";

    System.out.println(tipo);
    System.out.println(documento);
    System.out.println(password);
    if (dto != null) {

        if (dto.getTipo().equals("cliente")) {
            mensaje = "2";
        }

        if (dto.getTipo().equals("administrador")) {
            mensaje = "1";
        }
        
        session.setAttribute("documento", dto.getDocumento());
        session.setAttribute("nombre", dto.getNombre());
        session.setAttribute("apellido", dto.getApellido());
        session.setAttribute("tipo", dto.getTipo());
        session.setAttribute("estadoSesion", true);

        session.setMaxInactiveInterval(1 * 60 * 60);

    } else {

        mensaje = "Datos Incorrectos";

    }

%>

<%= mensaje%>