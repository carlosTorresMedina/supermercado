<%-- 
    Document   : realizarpedido
    Created on : 19/10/2015, 06:23:47 PM
    Author     : freddhy
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Map<String, Producto> carro = null;
    Object obj = session.getAttribute("carro");
    Object objEstado = session.getAttribute("estadoSesion");
    boolean estadoSession = false;

    //Revisando el estado de la sessión 8Si el usuario esta autentificado
    if (objEstado != null) {
        estadoSession = (boolean) objEstado;
    }

    if (obj != null) {
        carro = (HashMap<String, Producto>) obj;
    }
%>
<jsp:include page="../plantillas/usuario/header.jsp" />

<div class="container">
    <div class="alert alert-danger alert-dismissable hidden" id="msg-error">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <span id="contenido_msg"></span>
    </div>
    <div id="contenido-detalle-pedido">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="text-center" style="margin-bottom: 20px;">Detalles de la Compra</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default" style="padding: 0px; margin-bottom: 30px;">
                    <div class="panel-body">
                        <table class="table table-striped table-condensed table-responsive" style="padding: 0px; margin-bottom: 0px;" id="tabla">
                            <thead>
                                <tr style="padding: 5px auto;">
                                    <th>Item</th>
                                    <th>Producto</th>
                                    <th class="col-md-2 text-center">Cantidad</th>
                                    <th class="text-center">Precio Unit.</th>
                                    <th class="text-center">Subtotal</th>
                                    <th class="col-md-1 text-center">Opcion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    double total = 0.0;

                                    if (carro != null && carro.size() > 0) {
                                        int cont = 0;

                                        for (Producto producto : carro.values()) {
                                            cont++;
                                            total += producto.getCantidad() * producto.getPrecio_venta();
                                %>

                                <tr id="item<%=producto.getCodigo()%>">
                                    <td><%=cont%></td>
                                    <td><%=producto.getNombre()%></td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" id="producto<%=producto.getCodigo()%>" data-codigo="<%=producto.getCodigo()%>" class="form-control" value="<%=producto.getCantidad()%>" />
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button" data-id="producto<%=producto.getCodigo()%>" onclick="actualizarCantidad(this);"><i class="fa fa-refresh"></i></button>
                                            </span>
                                        </div>

                                    </td>
                                    <td class="text-center">$ <%=producto.getPrecio_venta()%></td>
                                    <td class="text-center">$ <%=(producto.getCantidad() * producto.getPrecio_venta())%></td>
                                    <td class="col-lg-1 text-center"><button class="btn btn-default" data-codigo="<%=producto.getCodigo()%>" onclick="eliminar_pro_carro(this);"><i class="fa fa-trash"></i></button></td>
                                </tr>

                                <%
                                        }
                                    } else {
                                        out.print("<tr><td colspan='6' class='text-center'>No existen productos en el carro de compras</td></tr>");
                                    }
                                %>

                            </tbody>
                            <tfoot style="background-color: #E6E6E6;">
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="font-weight: bold;" class="text-center">Total</td>
                                    <td style="font-weight: bold;" class="text-center">$ <%=total%></td>
                                    <td><a href="#" class='btn btn-danger <%=((!estadoSession) ? "disabled" : "")%>' onclick="confirmar_compra();" >Confirmar Compra</a></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="msg-exitoso" class="row hidden">
        <div class="col-md-offset-3 col-md-6">
            <div class="compra-exitos">
                <p class="text-center" id="contenido-msg">
                    Su compra se ha realizado con éxito
                </p>
                <p class="text-center">
                    <a href="../pedidos/productos.jsp" class="btn btn-default" style="color: #000;">Regresar</a>
                </p>
            </div>
        </div>
    </div>                           
</div>

<jsp:include page="../plantillas/usuario/footer.jsp" />
<script src="js/productos.js" type="text/javascript"></script>
