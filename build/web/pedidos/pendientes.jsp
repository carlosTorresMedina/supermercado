<%-- 
    Document   : panelPedidos
    Created on : 13/12/2015, 03:47:07 PM
    Author     : freddhy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.Persona"%>
<%@page import="dto.Pedido"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    /**
     * Permite listarle al administrador todos los pedidos que estan pendientes
     * por ser despachados
     */
    session.setAttribute("pagina", "pedidos");
    String tipo = String.valueOf(session.getAttribute("tipo"));
    
    if (!(tipo != null && tipo.equalsIgnoreCase("administrador"))) {
        response.sendRedirect("../login/login.jsp");
    }
%>
<jsp:include page="../plantillas/admin/header.jsp" />

<div class="container">
    <div class="row">
        <h3 class="text-center">Pedidos pendientes</h3>
    </div>

    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box box-success">
                <div class="box-body">
                    <table id="tablaPedidosPendiente" class="table table-bordered table-striped" style="margin-right: 15px;">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>N<sub>0</sub> Documento</th>
                                <th>Código pedido</th>
                                <th>Valor</th>
                                <th>Estado</th>
                                <th class="col-md-1">Productos</th>
                                <th class="col-md-1">Despachado</th>
                                <th class="col-md-1">Entregado</th>
                            </tr>
                        </thead>

                        <% Fachada fachada = new Fachada();
                            ArrayList<Pedido> lista = (ArrayList<Pedido>) fachada.listarPedidosPendientes();
                            
                            for (Pedido pedido : lista) {
                                String estado = (pedido.getEstado() == 1) ? "En proceso" : "Despachado";
                        %>
                        <tr>
                            <td class="text-center"><%=pedido.getFecha()%></td>
                            <td class="text-center"><%=pedido.getCliente().getDocumento()%></td>
                            <td class="text-center"><%=pedido.getId()%></td>
                            <td class="text-right">$<%=pedido.getValor()%></td>
                            <td class="text-right"><%=estado%></td>
                            <td class="text-center"><a href="productosPedido.jsp?codigo=<%=pedido.getId()%>" title="Ver Productos" class="text-center"><i class="fa fa-plus"></i></a></td>
                            <td class="text-center"><a href="javascript: void(0)"  data-idpedido="<%=pedido.getId()%>" data-estado="2" onclick="despachado(this);" title="Despachado" ><i class="fa fa-car"></i></a></td>
                            <td class="text-center"><a href="javascript: void(0)"  data-idpedido="<%=pedido.getId()%>" data-estado="3" onclick="despachado(this);" title="Entregado" ><i class="fa fa-home"></i></a></td>
                        </tr>

                        <%
                            }
                        %>

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
                                    $('#tablaPedidosPendiente').dataTable();
                                });
                                
</script>

<jsp:include page="../plantillas/admin/footer.jsp" />
