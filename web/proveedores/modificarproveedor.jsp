<%-- 
    Document   : modificarproveedor
    Created on : 21/09/2015, 12:18:42 PM
    Author     : carlos
--%>

<%@page import="dto.Proveedor"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session.setAttribute("pagina", "provedores");
    String tipo = session.getAttribute("tipo").toString();
    if (tipo.equals("Cliente") || tipo.isEmpty()) {
        response.sendRedirect("../login/login.jsp");
    } else {
        Fachada fachada = new Fachada();
        String nombre = request.getParameter("nombre");
        Proveedor p = fachada.consultarProveedor(nombre);

%>

<jsp:include page="../plantillas/admin/header.jsp" />
<div class="container">

    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <div class="box box-success">
                <div class="box-body">
                    <center><h2>MODIFICAR PROVEEDOR</h2></center>
                    <center> <label id="campoResultado">  </label></center>
                    <form name="modificarProveedor" action="javascript:modificarProveedor()" method="post">
                        <table class="table table-bordered table-striped">                    
                            <tr>
                                <td> <label>Empresa proveedor</label></td>
                                <td> <input required disabled type="text" name="nombreP" id="nombreP" placeholder="empresa proveedor" class="form-control" value="<%=p.getNombre()%>"/></td>
                            </tr>
                            <tr>
                                <td> <label>Correo electronico </label></td>
                                <td><input required type="email" name="email" id="email" placeholder="correo electronico" class="form-control" value="<%=p.getDireccion()%>" />
                                </td>
                            </tr>
                            <tr>
                                <td> <label>Direccion</label></td>
                                <td> <input  required type="text" name="direccion" id="direccion" placeholder="direccion" class="form-control" value="<%=p.getEmail()%>" /></td>
                            </tr>

                            <tr>
                                <td colspan="2">  <input type="submit" class="btn  btn-success boton" name="registrar" id="registrar" value="Modificar proveedor"/></td>
                            </tr>                
                        </table>

                    </form>

                </div>             
            </div>
        </div>
    </div>
</div>        
<link rel="stylesheet" href="../public/css/menu.css" />
<script type="text/javascript" src="JavaScript/proveedor.js"></script>
<jsp:include page="../plantillas/admin/footer.jsp" />
<% }%>
