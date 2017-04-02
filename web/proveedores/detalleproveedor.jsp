<%-- 
    Document   : detalleproveedor
    Created on : 10/12/2015, 06:14:18 PM
    Author     : carlos
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.Producto"%>
<%@page import="dto.Proveedor"%>
<%@page import="java.util.List"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setAttribute("pagina", "provedores");
    String tipo = session.getAttribute("tipo").toString();
    if (tipo.equals("Cliente") || tipo.isEmpty()) {
        response.sendRedirect("../login/login.jsp");
    } else {
%>

<jsp:include page="../plantillas/admin/header.jsp" />
<div class="container">
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box box-success">
                <div class="box-body">
                    <%
                        String nombre = request.getParameter("nombre");
                        Fachada fachada = new Fachada();
                        Proveedor p = fachada.consultarProveedor(nombre);
                        ArrayList<Producto> lista = (ArrayList) fachada.listarProductosProveedor(nombre);

                    %>
                    <P><center><b><H2>Datos del proveedor:</H2></b></center></P>

                    <table class="table table-bordered table-striped" >

                        <tr><td>Nombre de la empresa</td><td><%= p.getNombre()%></td></tr>
                        <tr><td>Correo electronico</td><td><%= p.getEmail()%></td></tr>
                        <tr><td>direccion</td><td><%= p.getDireccion()%></td></tr>

                        
                    </table>
                    <br>
                    
                    <P><center><b><h2>Productos que provee:</h2></b></center></P>
                    <table class="table table-bordered table-striped" >    
                        <tr><td>Codigo</td><td>Nombre</td><td>Cantidad del producto que provee</td><td>Tipo de producto</td><td>Marca</td><td>Precio de venta</td><td>Precio de compra</td></tr>
                        <% for (Producto x : lista) { %>
                        <tr><td><%= x.getCodigo()%></td><td><%= x.getNombre()%></td><td><%= x.getCantidad()%></td><td><%= x.getTipo_producto()%></td><td><%= x.getMarca()%></td><td><%= x.getPrecio_venta()%></td><td><%= x.getPrecio_compra()%></td></tr>
                        <% } %>    
                    </table>

                </div>             
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
<script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>

<jsp:include page="../plantillas/admin/footer.jsp" />
<% }%>
