<%-- 
    Document   : registraradmincliente
    Created on : 31/10/2015, 02:58:30 PM
    Author     : carlos
--%>
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
                    <center><h2>REGISTRAR ADMINISTRADOR COMO CLIENTE</h2></center>
                    <center><label id="divError">  </label></center>
                    <table class="table table-bordered table-striped">
                        <form name="procesarregistraradmincliente" action="javascript:registrarAdministradorCliente()" method="post">
                            <tr><td>Documento administrador</td><td><input class="form-control"  type="text" id="documento" name="documento" value="<%= documento%>" required disabled /></td></tr>
                            <tr><td>Sueldo limite</td><td><input class="form-control"  type="number" id="valor" name="valor" required  /></td></tr>
                            <tr><td><input  type="submit" class="btn  btn-success boton" name="registrar" id="registrar" value="Registrar como cliente" /></td></tr>
                        </form>
                    </table><br>

                </div>             
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="../public/css/menu.css" />
<link rel="stylesheet" href="css/administrador.css" />
<script type="text/javascript" src="js/administrador.js"></script> 
<jsp:include page="../plantillas/admin/footer.jsp" />
