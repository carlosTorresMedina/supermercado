<%-- 
    Document   : registrarproveedor
    Created on : 21/09/2015, 11:45:59 AM
    Author     : carlos
--%>

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
                    <center><h2>REGISTRAR PROVEEDOR</h2></center>
                    <center> <label id="campoResultado">  </label></center>
                    <form name="ventaProducto" action="javascript:registrarproveedor()" method="post">
                        <table class="table table-bordered table-striped">                    
                            <tr>
                                <td> <label>Empresa proveedor</label></td>
                                <td><input type="text" name="nombreE" required id="nombreE" placeholder="nombre Empresa" class="form-control" />     </td>
                            </tr>
                            <tr>
                                <td> <label>Correo electronico</label></td>
                                <td>    <input type="email" name="email" id="email" required placeholder="correo electronico" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td> <label>Direccion</label></td>
                                <td> <input type="text" name="direccion" id="direccion" required placeholder="direccion" class="form-control" /></td>
                            </tr>

                            <tr>
                                <td colspan="2">  <input type="submit"  class="btn  btn-success boton" name="registrar" id="registrar" value="Registrar proveedor" /></td>
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

