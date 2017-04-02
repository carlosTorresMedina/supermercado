<%-- 
    Document   : registroadministrador
    Created on : 12/10/2015, 05:01:09 PM
    Author     : carlos
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("pagina", "personal");
%>
<jsp:include page="../plantillas/admin/header.jsp" />
<div class="container">

    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <div class="box">
                <div class="box-body">
                    <center><h2>REGISTRAR ADMINISTRADOR</h2></center>
                    <center><label id="divError">  </label></center>
                    <form name="registraradministrador" action="javascript:registrarAdministrador()" method="post">
                        <table class="table table-bordered table-striped">

                            <tr>
                                <td> <label>Documento de identidad</label></td>
                                <td>   <input required type="number" name="documento" id="documento" placeholder="documento de identidad" class="form-control" /></td>

                            </tr>         
                            <tr>
                                <td> <label>Nombres</label></td>
                                <td> <input required type="text"  name="nombre" id="nombre" placeholder="nombres" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td> <label>Apellidos</label></td>
                                <td> <input required type="text"  name="apellido" id="apellido" placeholder="apellidos" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td><label>Correo electronico</label></td>
                                <td><input required type="email"  name="email" id="email" placeholder="correo electronico" class="form-control" /></td>
                            </tr>
                            <tr> 
                                <td><label>Telefono</label></td>
                                <td><input required type="number"  name="telefono" id="telefono" placeholder="telefono" class="form-control" /></td>
                            </tr>
                            <tr> 
                                <td><label>Direccion</label></td>
                                <td><input required type="text"  name="direccion" id="direccion" placeholder="direccion" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td><label>Contraseña</label></td>
                                <td>   <input required type="password"  name="password" id="password" placeholder="password" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td><label>Repita contraseña</label></td>
                                <td> <input required type="password"  name="passwordR" id="passwordR" placeholder="password" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" class="btn  btn-success boton" name="registrar" id="registrar" value="Registrar administrador" /></td>
                            </tr>                
                        </table>

                    </form>

                </div>             
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="../public/css/menu.css" />
<script type="text/javascript" src="js/administrador.js"></script> 
<jsp:include page="../plantillas/admin/footer.jsp" />

