<%-- 
    Document   : modificarproducto
    Created on : 13/12/2015, 03:32:54 PM
    Author     : carlos
--%>

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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantillas/admin/header.jsp" />
<%
    Fachada fachada = new Fachada();
    String codigo = request.getParameter("codigo");
    Producto p = fachada.consultarProducto(codigo);
    ArrayList<String> tipos = (ArrayList) fachada.listarTipoProducto();
    ArrayList<String> marcas = (ArrayList) fachada.listarMarcaProducto();


%>
<div class="container">
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box box-success">
                <center>
                    <div class="box-body">
                        <center><h2>Actualizar datos producto</h2></center>
                        <form name="modificar" method="post" action="procesar/actualizar.jsp" enctype="multipart/form-data">

                            <input type="hidden" name="codigo" value="<%= p.getCodigo()%>" /> 
                            <table class="table table-bordered table-striped" >
                                <tr><TD><B>Codigo de producto:  </B></TD> <TD ><%= p.getCodigo()%> </TD> 

                                    <TD rowspan="6"><div id="imagen"><img src=" ../<%= p.getRutaImagen()%>" width="300" class="img-responsive"></div></TD>
                                <tr><TD><B>Nombre:  </B></TD> <TD ><%= p.getNombre()%> </TD> 
                                <input type="hidden" name="ruta" value="<<%= p.getRutaImagen()%>" /> 
                                </tr>
                                <tr><TD><B>Tipo de producto actual:   </B></TD> 
                                    <TD> <select class="form-control" name="tipo">
                                            <option selected><%= p.getTipo_producto()%></option>
                                            <%  for (String t : tipos) {%>
                                            <option><%= t%></option>
                                            <% }%>
                                        </select></TD> 

                                </tr>
                                <TR><TD><B>Marca que tiene actualmente:  </B></TD> 

                                    <TD><select class="form-control" name="marca">
                                            <option selected><%= p.getMarca()%></option>
                                            <%  for (String t : marcas) {%>
                                            <option><%= t%></option>
                                            <% }%>
                                        </select> </TD>

                                <TR><TD><B>Precio de venta:  </B></TD> <TD><input required  type="number" name="precioventa" id="precioventa"  class="form-control" value="<%= p.getPrecio_venta()%>" /> </TD>
                                <TR><TD><B>Precio de compra:  </B></TD> <TD><input required  type="number" name="preciocompra" id="preciocompra"  class="form-control" value="<%= p.getPrecio_compra()%>" />  </TD>

                                <tr><td><b>Cambiar imagen imagen</b></td>         
                                    <td><input type="file" name="archivo" accept=".png" /></td>
                                    <td><input type="submit" class="btn  btn-success boton" name="ingresar" id="ingresar" value="Actualizar datos" /></td>

                            </table>
                            <label id="respuesta"></label>
                        </form>

                    </div> 
                </center>
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
