<%-- 
    Document   : listarProductos
    Created on : 14/12/2015, 03:58:59 PM
    Author     : freddhy
--%>

<%@page import="dto.Producto"%>
<%@page import="facade.Fachada"%>
<%@page import="dto.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /**
     * Vista que le muestra el cliente los productos de un pedido si este esta 
     * logeado, sino lo redirecciona al inicio de sesión.
     */
    Pedido pedido = null;
    Object estado = session.getAttribute("estadoSesion");

    if (estado != null && (boolean) estado && ((String) session.getAttribute("tipo")).equalsIgnoreCase("cliente")) {
        Fachada fachada = new Fachada();

        String id = request.getParameter("pedido");
        try {
            int idPedido = Integer.parseInt(id);
            pedido = fachada.getPedidoProductos(idPedido);
        } catch (NullPointerException ne) {
            response.sendRedirect("../verEstadoPedido.jsp");
        }

    } else {
        response.sendRedirect("../login/login.jsp");
    }

%>
<jsp:include page="../plantillas/usuario/header.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h3 class="text-center">Productos del Pedido</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box box-success">
                <div class="box-body">
                    <table id="" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th class="text-center">Cantidad</th>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Tipo</th>
                                <th class="text-center">Marca</th>
                                <th class="text-center">Descripción</th>
                        </thead>
                        <tbody>
                            <%   if (pedido != null) {

                                    for (Producto p : pedido.getProductos()) {

                            %>
                            <tr>
                                <td class="text-center"><%=p.getCantidad()%></td>
                                <td class="text-center"><%=p.getNombre()%></td>
                                <td class="text-center"><%=p.getTipo_producto()%></td>
                                <td class="text-center"><%=p.getMarca()%></td>
                                <td class="text-center"><%=p.getDescripcion()%></td>
                            </tr>

                            <%
                                    }
                                }%>
                        </tbody>
                    </table>
                </div>             
            </div>
        </div>
    </div>
</div>

<jsp:include page="../plantillas/usuario/footer.jsp" />