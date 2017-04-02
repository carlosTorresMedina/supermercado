<%-- 
    Document   : detalleproducto
    Created on : 7/12/2015, 05:43:59 PM
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
    
    %>
<div class="container">
    <div class="row">
        <div class="col-lg-offset-1 col-lg-10">

            <div class="box box-success">
                <center>
                    <div class="box-body">

                        <P><b><H2>Producto : <%= p.getNombre()%></H2></b></P>

                        <table class="table table-bordered table-striped" >
                            <TR><TD><B>Codigo de producto:  </B></TD> <TD > <%= p.getCodigo()%></TD> 
                                <TD rowspan="12"><img src=" ../<%= p.getRutaImagen()%>" width="300" class="img-responsive"></TD> </TR>
                            <TR><TD><B>Tipo de producto:  </B></TD> <TD> <%= p.getTipo_producto()%></TD> 
                            <TR><TD><B>Marca:  </B></TD> <TD> <%= p.getMarca()%></TD>
                            <TR><TD><B>Cantidad:  </B></TD> <TD> <%= p.getCantidad()%></TD>  
                            <TR><TD><B>Precio de venta:  </B></TD> <TD> <%= p.getPrecio_venta()%></TD>
                            <TR><TD><B>Precio de compra:  </B></TD> <TD> <%= p.getPrecio_compra()%></TD>


                        </table>

                            <a href="modificarproducto.jsp?codigo=<%= p.getCodigo()%>" class="btn btn-success pull-left"><i class="fa fa-edit"></i> Modificar</a>
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
