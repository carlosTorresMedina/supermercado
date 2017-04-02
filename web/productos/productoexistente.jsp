<%-- 
    Document   : productoexistente
    Created on : 13/12/2015, 06:45:34 PM
    Author     : carlos
--%>

<%@page import="dto.Producto"%>
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
        ArrayList<Producto> productos = (ArrayList) fachada.listarProductos();


    %>
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <div class="box">
                <div class="box-body" id="registroproducto">
                    <center><h2>INGRESAR PRODUCTO NUEVO</h2></center>
                    <center><label id="divError">  </label></center>
                    <form name="registrarproductonuevo" action="javascript:Existente()" method="post" >


                        <table  class="table table-bordered table-striped">
                            <tr>
                                <td> <label>Productos</label></td>
                                <td>   <select class="form-control" name="producto">
                                        <%  for (Producto p : productos) {%>
                                        <option><%= p.getNombre()%></option>
                                        <% } %>
                                    </select></td>

                            </tr>
                            <tr>
                                <td> <label>Proveedores</label></td>
                                <td>   <select class="form-control" name="proveedor">
                                        <%  for (Proveedor p : proveedores) {%>
                                        <option><%= p.getNombre()%></option>
                                        <% } %>
                                    </select></td>

                            </tr>

                            <td> <label>Cantidad</label></td>
                            <td> <input required type="number"  name="cantidad" id="cantidad" placeholder="cantidad de producto" class="form-control" /></td>
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


