<%-- 
    Document   : mensaje
    Created on : 27-oct-2015, 14:40:14
    Author     : Javier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="facade.Fachada"%>

<% 
  System.out.println("Etra");
  String nombre = request.getParameter("nombre");
  String email = request.getParameter("email");
  String direccion = request.getParameter("direccion");
  System.out.println(direccion);
  Fachada fachada = new Fachada();
  boolean rta = fachada.actualizarProveedor(nombre, direccion, email);
  String resp ="";
  if(rta){
      resp = "S";
  }else{
      resp = "N";
  }
  System.out.println(resp);
%>

<%= resp %>
