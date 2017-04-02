<%-- 
    Document   : verEstadoPedido
    Created on : 14/12/2015, 02:39:19 PM
    Author     : freddhy
--%>

<%@page import="dto.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    ArrayList<Pedido> pedidos = new ArrayList<>();
    Object estado = session.getAttribute("estadoSesion");

    if (estado != null && (boolean) estado && ((String) session.getAttribute("tipo")).equalsIgnoreCase("cliente")) {

        Fachada facha = new Fachada();
        pedidos = (ArrayList<Pedido>) facha.getPedidoPendiente((String) session.getAttribute("documento"));

    } else {
        response.sendRedirect("../login/login.jsp");
    }
%>
<jsp:include page="../plantillas/usuario/header.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h3 class="text-center">Estado de mis Pedidos</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box box-success">
                <div class="box-body">
                    <table id="" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th class="text-center">Código de Pedido</th>
                                <th class="text-center">Fecha</th>
                                <th class="text-center">Estado</th>
                                <th class="text-center">Valor</th>
                                <th class="text-center">Opcion</th>
                        </thead>
                        <tbody>
                            <%
                                if (pedidos != null && pedidos.size() != 0) {
                                    String estadoPedido = "";

                                    for (Pedido p : pedidos) {

                                        if (p.getEstado() == 1) {
                                            estadoPedido = "En proceso";
                                        } else if (p.getEstado() == 2) {
                                            estadoPedido = "Despachado";
                                        }
                            %>
                            <tr>
                                <td class="text-center"><%=p.getId()%></td>
                                <td class="text-center"><%=p.getFecha()%></td>
                                <td class="text-center"><%=estadoPedido%></td>
                                <td class="text-right">$<%=p.getValor()%></td>
                                <td class="text-center"><a href="listarProductos.jsp?pedido=<%=p.getId()%>" style="color: green;" title="Ver Productos"><i class="fa fa-plus"> </i></a></td>

                            </tr>

                            <%
                                }
                            } else {

                            %>
                            <tr><td colspan="5" class="text-center">No tiene pedidos pendientes</td></tr>
                            <%                            }
                            %>
                        </tbody>
                    </table>
                </div>             
            </div>
        </div>
    </div>
</div>

<jsp:include page="../plantillas/usuario/footer.jsp" />