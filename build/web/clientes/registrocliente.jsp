<%-- 
    Document   : registrocliente
    Created on : 20/09/2015, 09:00:43 AM
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
            <div class="box box-success">
                <div class="box-body">
                    <center><h2>REGISTRAR CLIENTE</h2></center>
                    <center><label id="divError">  </label></center>
                    <form name="registrarcliente" action="javascript:registrarCliente()" method="post">
                        <table class="table table-bordered table-striped">
                            <tr>
                                <td> <label>Documento de identidad</label></td>
                                <td>   <input required type="number" name="documento" id="documento" placeholder="documento de identidad" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td> <label>Nombres</label></td>
                                <td> <input required type="text" name="nombre" id="nombre" placeholder="nombres" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td> <label>Apellidos</label></td>
                                <td> <input required type="text" name="apellido" id="apellido" placeholder="apellidos" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td><label>Correo electronico</label></td>
                                <td><input required type="email" name="email" id="email" placeholder="correo electronico" class="form-control" /></td>
                            </tr>
                            <tr> 
                                <td><label>Telefono</label></td>
                                <td><input required type="number"  name="telefono" id="telefono" placeholder="telefono" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td><label>Saldo limite</label></td>
                                <td><input required type="number" name="saldo" id="saldo" placeholder="saldo limite" class="form-control" /></td>
                            </tr>
                            <tr> 
                                <td><label>Direccion</label></td>
                                <td><input required type="text" name="direccion" id="direccion" placeholder="direccion" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td><label>Contraseña</label></td>
                                <td>   <input required type="password" name="password" id="password" placeholder="password" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td><label>Repita contraseña</label></td>
                                <td> <input required type="password" name="passwordR" id="passwordR" placeholder="password" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" class="btn  btn-success boton" name="registrar" id="registrar" value="Registrar cliente" /></td>
                            </tr>                
                        </table>

                    </form>

                </div>             
            </div>
        </div>
    </div>
</div>



<link rel="stylesheet" href="css/cliente.css" />
<script type="text/javascript" src="js/cliente.js"></script>  
<jsp:include page="../plantillas/admin/footer.jsp" />

