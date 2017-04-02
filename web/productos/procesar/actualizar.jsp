<%-- 
    Document   : actualizar
    Created on : 13/12/2015, 04:11:02 PM
    Author     : carlos
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="dto.Producto"%>
<%@page import="facade.Fachada"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="javazoom.upload.UploadBean"%>

<%
    String ruta = getServletContext().getRealPath("/");
    ruta += "public/img/productos";
    UploadBean upBean = new UploadBean();
    UploadFile file = null;
    upBean.setFolderstore(ruta);
    boolean msg = false;
    String codigo = "";
    String tipo = "";
    String marca = "";
    String precioventa = "";
    String preciocompra = "";
    Fachada fachada = new Fachada();

    if (!MultipartFormDataRequest.isMultipartFormData(request)) {
        msg = false;

    } else {

        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

        Hashtable files = mrequest.getFiles();
        codigo = mrequest.getParameter("codigo");
        tipo = mrequest.getParameter("tipo");
        marca = mrequest.getParameter("marca");
        precioventa = mrequest.getParameter("precioventa");
        preciocompra = mrequest.getParameter("preciocompra");
        if ((files != null) && (!files.isEmpty())) {

            file = (UploadFile) files.get("archivo");

            if (file == null) {

                msg = true;
            }
            if (file.getFileName() != null) {
                File filess = new File(ruta + "/" + codigo + ".png");

                filess.delete();
                file.setFileName(codigo + ".png");
                upBean.store(mrequest, "archivo");
                msg = true;
            }

        } else {
            msg = false;
        }

    }

    boolean resul = false;
    if (msg) {
        resul = fachada.acomodarRutaImagenProducto(codigo, "public/img/productos/" + file.getFileName());

    }
    boolean act = fachada.actualizarProducto(codigo, tipo, marca, precioventa, preciocompra);
    if (act) {
       
        response.sendRedirect("../detalleproducto.jsp?codigo=" + codigo);
    } else {
       

        response.sendRedirect("../modificarproducto.jsp?codigo=" + codigo);
    }%>


