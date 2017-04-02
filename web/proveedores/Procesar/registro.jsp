<%-- 
    Document   : registro
    Created on : 07-nov-2015, 9:36:15
    Author     : Javier
--%>

<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("entra");
    String nombre = request.getParameter("nombre");
    String email = request.getParameter("email");
    String direccion = request.getParameter("direccion");
    Fachada fachada = new Fachada();
    boolean rta = fachada.registrarProveedor(nombre, direccion, email);
    String rsp = "N";
    if(rta){
        rsp = "S";
    }
    System.out.println(rsp);
%>

<%=
   rsp 
    %>