<%-- 
    Document   : tipo
    Created on : 6/12/2015, 04:48:46 PM
    Author     : carlos
--%>

<%@page import="facade.Fachada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
        Fachada fachada = new Fachada();
        String tipo = request.getParameter("tipo");
        ArrayList<Producto> lista = (ArrayList) fachada.listarProductoTipo(tipo);

        for (Producto x : lista) {
    %>
    <tr>
        <td><%=x.getCodigo()%></td>
        <td><%=x.getTipo_producto()%></td>
        <td><%=x.getNombre()%></td>
        <td><%=x.getCantidad()%></td>                           
        <td><a href="detalleproducto.jsp?codigo=<%=x.getCodigo()%>" title="Ver detalles"><i class="fa fa-user text-center"> </i></a></td>
        <td><a href="#" title="Modificar"><i class="fa fa-edit text-center"></i></a></td>
    </tr>

    <%
        }
    %>
</tbody>
<tfoot>

</tfoot>

</table>
