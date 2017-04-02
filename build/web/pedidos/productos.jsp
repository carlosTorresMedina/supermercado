<%-- 
    Document   : productos
    Created on : 18/10/2015, 11:25:45 AM
    Author     : freddhy
--%>

<%@page import="dto.Producto"%>
<%@page import="java.util.List"%>
<%@page import="facade.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("pagina", "productos");

    Fachada fachada = new Fachada();
    List<Producto> productos = null;
    int paginas = 0;

    String categoria = request.getParameter("categoria");

    if (categoria != null && !categoria.isEmpty()) {
        productos = fachada.listarProductoTipo(categoria);
    } else {
        categoria = "";
        productos = fachada.listarProductos();
    }

    paginas = (int) Math.ceil((double) productos.size() / 12);
    List<String> tipos = fachada.listarTipoProducto();
%>
<jsp:include page="../plantillas/usuario/header.jsp" />
<div class="container">
    <div class="row">
        <div class="col-lg-3 col-sm-4 hidden-xs">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Categorias</h3>
                </div>
                <div class="panel-body">
                    <div class="lista">
                        <%
                            for (String tipo : tipos) {
                        %>
                        <a href="?categoria=<%=tipo%>" class='list-group-item <% out.print((tipo.equalsIgnoreCase(categoria)) ? "active" : ""); %>'><%=tipo%></a>

                        <%}%>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-sm-8 col-xs-12">
            <div class="row">

                <div class="col-lg-4 col-xs-12">              

                    <div class="visible-xs col-xs-8">
                        <div class="btn-group"  style="width: 100%;">
                            <button type="button" class="btn btn-success dropdown-toggle"
                                    data-toggle="dropdown" style="width: 100%;">
                                Categorias <span class="caret"></span>
                            </button>

                            <ul class="dropdown-menu" role="menu">
                                <%
                                    for (String tipo : tipos) {
                                %>
                                <li><a href="?categoria=<%=tipo%>"><%=tipo%></a></li>

                                <%}%>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>

            <!--LISTADO DE PRODUCTOS-->
            <div class="row" style="margin-top: 20px;">
                <div id="productos">
                    <%
                        int cont = 1;
                        for (Producto pro : productos) {
                      
                    %>
                    <div class='col-lg-4 col-sm-6 <% out.print((cont > 12) ? "pagina-inactiva" : "pagina-activa");%>' id="contenido<%=cont%>">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <img src="../<%=pro.getRutaImagen()%>" class="img-responsive" />
                                <div class="detalle-producto">
                                    <p class="nom-producto text-center">
                                        <%=pro.getNombre()%>
                                    </p>
                                    <p class="text-center precio">
                                        $<%=pro.getPrecio_venta()%>
                                    </p>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="total">
                                    <button class="btn btn-rojo btn-izq" data-id="prod-<%=pro.getCodigo()%>" onclick="decrementar(this);"><i class="fa fa-minus"></i></button>
                                    <input type="text" name="cantidad" class="numero" id="prod-<%=pro.getCodigo()%>" value="0" />
                                    <button class="btn btn-rojo btn-der" data-id="prod-<%=pro.getCodigo()%>" onclick="incrementar(this);"><i class="fa fa-plus"></i></button>
                                </div>
                                <button class="btn btn-rojo" data-id="prod-<%=pro.getCodigo()%>" onclick="add_carro_compras(this);">Añadir</button>
                            </div>
                        </div>
                    </div>
                    <% 
                       cont++;
                        }
                    %>
                </div>
            </div>
            <div>
                <ul class="pagination" data-paginas='<%=paginas%>'>
                    <li class="disabled" id="pagina-izq">
                        <a href="#" data-pagina='1' onclick="pagina(this);">&laquo;</a>
                    </li>
                    <%
                        for (int i = 1; i <= paginas; i++) {
                    %>
                    <li class='<% out.print((i == 1) ? "active" : "");%>' id="p<%=i%>">
                        <a href="#" data-pagina='<%=i%>' onclick="pagina(this);"><%=i%> <span class="sr-only">(página actual)</span></a>
                    </li>
                    <%
                        }
                    %>
                    <li id="pagina-der"><a href="#" data-pagina='2' onclick="pagina(this);">&raquo;</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../plantillas/usuario/footer.jsp" />
<script src="js/productos.js" type="text/javascript"></script>
