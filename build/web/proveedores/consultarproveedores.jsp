<%-- 
    Document   : consultarProveedores
    Created on : 9/11/2015, 16:47:37 P.M
    Author     : Javier
--%>

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
    <center><h2>Consultar Proveedor</h2></center>
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">
            <a href="registrarproveedor.jsp" class="btn btn-success pull-left">Agregar Proveedor</a>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box box-success">
                <div class="box-body">
                    <table id="tablaAdmin" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Nombre del proveedor</th>
                                <th>Correo electronico</th>
                                <th>Direccion</th>
                                <th>Accion</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Fachada fachada = new Fachada();
                                List<Proveedor> proveedor = fachada.listarProveedores();
                            %>
                            <% for (Proveedor p : proveedor) {
                            %>  
                            <tr><td><%= p.getNombre()%></td>
                                <td><%= p.getEmail()%></td>
                                <td><%= p.getDireccion()%></td>

                                <td class="text-center"><a href="detalleproveedor.jsp?nombre=<%=p.getNombre()%>" title="Ver detalles"><i class="fa fa-user text-center"> </i></a></td>
                                <td class="text-center"><a href="modificarproveedor.jsp?nombre=<%=p.getNombre()%>" title="Modificar"><i class="fa fa-edit text-center"></i></a></td>

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
<% }%>

