<%-- 
    Document   : registronuevo
    Created on : 11/12/2015, 10:42:07 PM
    Author     : carlos
--%>
<%@page import="dto.Producto"%>
<%@page import="facade.Fachada"%>
<%
    String proveedor = request.getParameter("proveedor");
    String tipo = request.getParameter("tipo");
    String marca = request.getParameter("marca");
    String nombre = request.getParameter("nombre");
    String cantidad = request.getParameter("cantidad");
    String precioventa = request.getParameter("precioventa");
    String preciocompra = request.getParameter("preciocompra");
    Fachada fachada = new Fachada();
    request.setAttribute("nombre", nombre);
    boolean rta = fachada.registrarProducto(proveedor, tipo, marca, nombre, cantidad, precioventa, preciocompra);

    if (rta) {

        Producto p = fachada.consultarProductoxNombre(nombre);

%>
<center></center><P><b><H2>Producto : <%= p.getNombre()%></H2></b></P></center>
<form name="subirimagen" method="post" action="procesar/subirimagen.jsp" enctype="multipart/form-data">
    <input type="hidden" name="codigo" value="<%= p.getCodigo()%>" /> 
    <table class="table table-bordered table-striped" >
        <tr><TD><B>Codigo de producto:  </B></TD> <TD > <%= p.getCodigo()%></TD> 
            <TD rowspan="6"><div id="imagen"><img src=" ../<%= p.getRutaImagen()%>" width="300" class="img-responsive"></div></TD>
        </tr>
        <TR><TD><B>Tipo de producto:  </B></TD> <TD> <%= p.getTipo_producto()%></TD> 
        <TR><TD><B>Marca:  </B></TD> <TD> <%= p.getMarca()%></TD>
        <TR><TD><B>Cantidad:  </B></TD> <TD> <%= p.getCantidad()%></TD>  
        <TR><TD><B>Precio de venta:  </B></TD> <TD> <%= p.getPrecio_venta()%></TD>
        <TR><TD><B>Precio de compra:  </B></TD> <TD> <%= p.getPrecio_compra()%></TD>

        <tr><td><b>Colocar imagen</b></td>         
            <td><input type="file" name="archivo" accept=".png" required /></td>
            <td><input type="submit" class="btn  btn-primary boton" name="ingresar" id="ingresar" value="cambiar imagen" /></td>

    </table>
    <label id="respuesta"></label>
</form>

<% } else {%>
<%="ninguna"%>

<% }%>