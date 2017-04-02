<%-- 
    Document   : subirimagen
    Created on : 12/12/2015, 07:24:16 PM
    Author     : carlos
--%>

<%@page import="dto.Producto"%>
<%@page import="facade.Fachada"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ruta = request.getRealPath("public/img/productos");
    UploadBean upBean = new UploadBean();
    UploadFile file = null;
    upBean.setFolderstore(ruta);
    boolean msg = false;
    String codigo = "";
    Fachada fachada = new Fachada();

    if (!MultipartFormDataRequest.isMultipartFormData(request)) {
        msg = false;
    } else {
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
        Hashtable files = mrequest.getFiles();
        if ((files != null) && (!files.isEmpty())) {
            file = (UploadFile) files.get("archivo");

            codigo = mrequest.getParameter("codigo");
            file.setFileName(codigo + ".png");

            if (file == null) {
                msg = true;
            }
            upBean.store(mrequest, "archivo");
            msg = true;
        } else {
            msg = false;
        }

    }

    boolean resul = false;
    if (msg) {

        resul = fachada.acomodarRutaImagenProducto(codigo, "public/img/productos/" + file.getFileName());
    }

    if (resul) {
        response.sendRedirect("../detalleproducto.jsp?codigo=" + codigo+"&estado=listo");
%>

<% } else { %>


<%
        response.sendRedirect("../controproductos.jsp?estado=error");
    }%>

