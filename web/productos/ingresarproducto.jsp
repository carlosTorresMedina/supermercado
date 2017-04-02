<%-- 
    Document   : ingresarproducto
    Created on : 11/12/2015, 08:23:02 PM
    Author     : carlos
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.Proveedor"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setAttribute("pagina", "productos");
    String tipo = session.getAttribute("tipo").toString();

    if (tipo.equals("cliente") || tipo.isEmpty()) {
        response.sendRedirect("../login/login.jsp");
    } else {
%>
<jsp:include page="../plantillas/admin/header.jsp" />
<div class="container">
    <%
        Fachada fachada = new Fachada();
        ArrayList<Proveedor> proveedores = (ArrayList) fachada.listarProveedores();
        ArrayList<String> tipoProductos = (ArrayList) fachada.listarTipoProducto();
        ArrayList<String> marca = (ArrayList) fachada.listarMarcaProducto();

    %>
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <div class="box box-success">
                <div class="box-body" id="registroproducto">
                    <center><h2>INGRESAR PRODUCTO NUEVO</h2></center>
                    <center><label id="divError">  </label></center>
                    <form name="registrarproducto" action="javascript:registrarProducto()" method="post" >
                        <table  class="table table-bordered table-striped">
                            <tr>
                                <td> <label>Proveedor</label></td>
                                <td>   <select class="form-control" name="proveedor">
                                        <%  for (Proveedor p : proveedores) {%>
                                        <option><%= p.getNombre()%></option>
                                        <% } %>
                                    </select></td>

                            </tr>
                            <tr>
                                <td> <label>Tipo de producto</label></td>
                                <td>   <select class="form-control" name="tipo">
                                        <%  for (String t : tipoProductos) {%>
                                        <option><%= t%></option>
                                        <% } %>
                                    </select></td>

                            </tr>  
                            <tr>
                                <td> <label>Marca</label></td>
                                <td>   <select class="form-control" name="marca">
                                        <%  for (String m : marca) {%>
                                        <option><%= m%></option>
                                        <% } %>
                                    </select></td>

                            </tr>
                            <tr>
                                <td> <label>Nombre</label></td>
                                <td>   <input required type="text" name="nombre" id="nombre" placeholder="nombre del producto" class="form-control" /></td>

                            </tr>         
                            <tr>
                                <td> <label>Cantidad</label></td>
                                <td> <input required type="number"  name="cantidad" id="cantidad" placeholder="cantidad de producto" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td> <label>Precio de venta</label></td>
                                <td> <input required type="number"  name="precioventa" id="precioventa" placeholder="precio de venta" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td><label>Precio de compra</label></td>
                                <td><input required type="number"  name="preciocompra" id="preciocompra" placeholder="precio de compra" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" class="btn  btn-success boton" name="ingresar" id="ingresar" value="ingresar producto" /></td>
                            </tr>                
                        </table>

                    </form>

                </div>             
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="../public/css/menu.css" />
<link rel="stylesheet" href="css/administrador.css" />
<script type="text/javascript" src="js/producto.js"></script> 
<jsp:include page="../plantillas/admin/footer.jsp" />
<% }%>

