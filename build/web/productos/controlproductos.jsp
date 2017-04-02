<%-- 
    Document   : controlproductos
    Created on : 19/09/2015, 10:38:48 AM
    Author     : carlos
--%>
<%@page contentType = "text/html" pageEncoding = "UTF-8"%>
<%@page import="dto.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%
    session.setAttribute("pagina", "productos");
    String tipo = session.getAttribute("tipo").toString();

    if (tipo.equals("cliente") || tipo.isEmpty()) {
        response.sendRedirect("../login/login.jsp");
    } else {


%>


<jsp:include page="../plantillas/admin/header.jsp" />

<div class="container">
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box">
                <div class="box-body">

                    <div class="row">
                        <div class="col-md-12" style="margin-bottom: 30px;">
                            <form name="consultarTipoProducto" action="javascript:tipo()" method="post" >

                                <center><h2>Consulta de productos</h2></center>

                                <label>Tipo de producto</label>
                                <div class="col-md-12" style="padding: 0px;">
                                    <div class="input-group">
                                        <select class="form-control" name="tipo" >
                                            <option selected >
                                                Todos
                                            </option>
                                            <% Fachada fachada = new Fachada();
                                                ArrayList<String> lista0 = (ArrayList) fachada.listarTipoProducto();

                                                for (String x0 : lista0) {
                                            %>
                                            <option>
                                                <%=x0%>
                                            </option>
                                            <% } %>
                                        </select>
                                        <span class="input-group-btn">
                                            <input type="submit" class="btn  btn-success boton" name="ingresar" id="ConsultarTipoProducto" value="Consutar tipo de producto" />
                                        </span>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>

                    <div id="tablaProducto">
                        <table id="tablaAdmin" class="table table-bordered table-striped" >
                            <thead>
                                <tr>
                                    <th>N° de referencia</th>
                                    <th>Tipo de producto</th>
                                    <th>Nombre del producto</th>
                                    <th>Cantidad (unidad)</th>
                                    <th  ><center>accion</center></th>  
                            <th  ><center>accion</center></th>  
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<Producto> lista = (ArrayList) fachada.listarProductos();

                                    for (Producto x : lista) {
                                %>
                                <tr>
                                    <td><%=x.getCodigo()%></td>
                                    <td><%=x.getTipo_producto()%></td>
                                    <td><%=x.getNombre()%></td>
                                    <td><%=x.getCantidad()%></td>                           
                                    <td class="text-center"><a href="detalleproducto.jsp?codigo=<%=x.getCodigo()%>" title="Ver detalles"><i class="fa fa-list text-center"> </i></a></td>
                                    <td class="text-center"><a href="modificarproducto.jsp?codigo=<%=x.getCodigo()%>" title="Modificar"><i class="fa fa-edit text-center"></i></a></td>
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
</div>

<link rel="stylesheet" href="../public/css/dataTables.bootstrap.min.css" />
<script src="../public/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../public/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="js/producto.js" type="text/javascript"></script>
<script type="text/javascript">


    $(document).ready(function () {
        $('#tablaAdmin').dataTable();
    });

</script>
<jsp:include page="../plantillas/admin/footer.jsp" />
<% }%>
