<%-- 
    Document   : registrarclienteadmin
    Created on : 31/10/2015, 01:53:03 PM
    Author     : carlos
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("pagina", "personal");
    String documento = request.getParameter("documento");
%>
<jsp:include page="../plantillas/admin/header.jsp" />

<div class="container">

    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <div class="box box-success">
                <div class="box-body">
                    <center><h2>REGISTRAR CLIENTE COMO ADMINISTRADOR</h2></center>
                    <center><label id="divError">  </label></center>
                    <table class="table table-bordered table-striped">
                        <form name="procesarregistrarclienteadmin" action="javascript:registrarClienteAdministrador()" method="post">

                            <tr><td>Documento cliente</td><td><input class="form-control"  type="text" id="documento" name="documento" value="<%= documento%>" required disabled /></td></tr>

                            <tr><td><input  type="submit" class="btn  btn-success boton" name="registrar" id="registrar" value="Registrar como administrador" /></td></tr>
                        </form>
                    </table><br>

                </div>             
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="css/cliente.css" />
<script type="text/javascript" src="js/cliente.js"></script>  
<jsp:include page="../plantillas/admin/footer.jsp" />



