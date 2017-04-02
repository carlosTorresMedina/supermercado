<%-- 
    Document   : consultaradministrador
    Created on : 12/10/2015, 05:01:42 PM
    Author     : carlos
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.Persona"%>
<%@page import="dto.Persona"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("pagina", "personal");
%>
<jsp:include page="../plantillas/admin/header.jsp" />

<div class="container">
    <center><h2>Consultar administrador</h2></center>
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <a href="registroadministrador.jsp" class="btn btn-success pull-left">Agregar Adminnistrador</a>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box box-success">
                <div class="box-body">
                    <table id="tablaAdmin" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Documento de identidad</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Correo electronico</th>
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th  ><center>accion</center></th>
                        <th><center>accion</center></th></tr>
                        </thead>
                        <tbody>
                            <% Fachada fachada = new Fachada();
                                ArrayList<Persona> lista = fachada.listarAdministradores();

                                for (Persona x : lista) {
                            %>
                            <tr>
                                <td><%=x.getDocumento()%></td>
                                <td><%=x.getNombre()%></td>
                                <td><%=x.getApellido()%></td>
                                <td><%=x.getEmail()%></td>
                                <td><%=x.getDireccion()%></td>
                                <td><%=x.getTelefono()%></td>
                                <td class="text-center"><a href="modificaradministrador.jsp?documento=<%=x.getDocumento()%>" title="Editar"><i class="fa fa-edit"></i></a></td>
                                <td class="text-center" ><a href="registraradmincliente.jsp?documento=<%=x.getDocumento()%>" title="Regitrar Como Cliente"><i class="fa fa-user"> </i></a></td>

                            </tr>

                            <%
                                }
                            %>
                        </tbody>
                        <tfoot>

                        </tfoot>

                    </table>
                </div>             
            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
<script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">


    $(document).ready(function () {
        $('#tablaAdmin').dataTable();
    });

</script>
<jsp:include page="../plantillas/admin/footer.jsp" />
