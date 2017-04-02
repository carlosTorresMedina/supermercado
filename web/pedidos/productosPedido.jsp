<%-- 
    Document   : productosPedido
    Created on : 13/12/2015, 04:51:47 PM
    Author     : freddhy
--%>

<%@page import="dto.Producto"%>
<%@page import="dto.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    session.setAttribute("pagina", "pedidos");
    String tipo = String.valueOf(session.getAttribute("tipo"));
    
    if (!(tipo != null && tipo.equalsIgnoreCase("administrador"))) {
        response.sendRedirect("../login/login.jsp");
    }
%>

<jsp:include page="../plantillas/admin/header.jsp" />

<%
    Object obj = request.getParameter("codigo");
    int idPedido = 0;

    if (obj != null) {
        String id = (String) obj;

        idPedido = Integer.parseInt(id);

    }

    if (idPedido == 0) {
%>
<jsp:forward page="pendientes.jsp"></jsp:forward>
<%
    }

    Fachada fachada = new Fachada();
    Pedido pedido = fachada.getPedidoProductos(idPedido);

    ArrayList<Producto> productos = (ArrayList<Producto>) pedido.getProductos();

%>

<div class="container">
    <div class="row" style="margin-bottom: 30px;">
        <p>
        <h3 class="text-center">Productos del pedido</h3>
        </p>
    </div>
    <div class="row">
        <div class="col-md-offset-1 col-md-10">
            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title">Datos del pedido</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <table id="tabla" class="table table-bordered table-striped" >
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Código Pedido</th>
                                <th>Cliente</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%=pedido.getFecha()%></td>
                                <td><%=pedido.getId()%></td>
                                <td><%=pedido.getCliente().getDocumento()%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box box-success">
                <div class="box-header">
                    <h3 class="box-title">Productos del Pedido</h3>
                </div><!-- /.box-header -->
                <div class="box-body">

                    <div id="tablaProducto">
                        <table id="tablaAdmin" class="table table-bordered table-striped" >
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Cantidad</th>
                                    <th>Nombre</th>
                                    <th>Categoria</th>
                                    <th>Marca</th>
                                    <th >Descripción</th>  
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Producto producto : productos) {

                                %>
                                <tr>
                                    <td><%=producto.getCodigo()%></td>
                                    <td><%=producto.getCantidad()%></td>
                                    <td><%=producto.getNombre()%></td>                                  
                                    <td><%=producto.getTipo_producto()%></td>
                                    <td><%=producto.getMarca()%></td>
                                    <td><%=producto.getDescripcion()%></td>

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
