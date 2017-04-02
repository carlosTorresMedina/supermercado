<%-- 
    Document   : cerrarSesion
    Created on : 12/10/2015, 04:34:19 PM
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    session.invalidate();
    response.sendRedirect("../index.jsp");
%>
