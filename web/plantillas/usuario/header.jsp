<%-- 
    Document   : header
    Created on : 17/10/2015, 11:30:57 AM
    Author     : freddhy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%
    String nombre_usuario = "";
    String pagina = "";
    boolean sw = false;

    if ((session != null)) {

        if (session.getAttribute("nombre") != null) {
            nombre_usuario = session.getAttribute("nombre").toString();
            sw = true;
        }
        if (session.getAttribute("pagina") != null) {
            pagina = session.getAttribute("pagina").toString();
        }

    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../public/css/bootstrap.css" type="text/css" rel="stylesheet">
        <link href="../plantillas/usuario/css/usuario.css" type="text/css" rel="stylesheet">
        <link href="../public/css/font-awesome.css" type="text/css" rel="stylesheet">
        <script src="../public/js/jquery-1.11.3.js" type="text/javascript"></script>

        <title>Supermercado Motilón</title>
        <script type="text/javascript">

            $(document).ready(function () {

                var dispositivo = navigator.userAgent.toLowerCase();
                if (dispositivo.search(/iphone|ipod|ipad|android|phone|blackberry|meego|blazer|compal|elaine|fennec|hiptop|iemobile/) > -1) {
                    $("div.contenedor-img").each(function (index)
                    {
                        $(this).removeClass("ejemplo-1");
                        
                    })
                }

            });

        </script>
    </head>
    <body>
        <div class="row top_bar">
            <div class="col-lg-12 col-sm-12 col-xs-12 bg-verde" style="padding: 0px;">

                <% if (sw) {%>
                <div class="pull-left nom-user">
                    <i class="fa fa-user"></i>  <%=nombre_usuario%>
                </div>
                <% } %>

                <div class="pull-right login">
                    <% if (!sw) { %>
                    <a href="../login/login.jsp" class="noline"><i class="fa fa-key"></i> Iniciar sesión</a>
                    <% } else { %>
                    <a href="../login/cerrarSesion.jsp" class="noline"><i class="fa fa-power-off"></i> Cerrar sesión</a>
                    <% }%>
                </div>
                <div class="pull-right estado-pedido">
                    <a href="../pedidos/verEstadoPedido.jsp" class="noline"><i class="fa fa-truck"></i> Ver estado de mi pedido</a>
                </div>

            </div>
        </div>
        <div class="row" style="height: 30px;"> </div>
        <div class="row bg-blanco">
            <div class="col-lg-12 col-sm-12 col-xs-12">

                <div class="row">
                    <div class="col-lg-7 col-sm-7 col-xs-7 logo-banner">
                        <img src="../plantillas/usuario/img/logo.png" class="img-responsive" />
                    </div>

                    <div class="col-lg-5 col-sm-5 col-xs-5 info-super">

                        <div class="row">
                            <div class="col-lg-12">
                                <p class="pull-right">
                                    <i class="fa fa-mobile"></i> 320 5555 555
                                </p>
                            </div>
                            <div class="col-lg-12">
                                <p class="pull-right">
                                    <i class="fa fa-envelope"></i> super.motilon@gmail.com
                                </p>
                            </div>
                            <div class="col-lg-12">
                                <div class="carro-comparas pull-right">
                                    <a href="../pedidos/realizarpedido.jsp" class="btn btn-rojo btn-carro">
                                        <i class="fa fa-shopping-cart"></i> Pagar
                                    </a>
                                    <div class="total-compra" id="seccion-carro">
                                        <span id="cantidad-productos"><%=(session.getAttribute("numProductos") != null) ? (Integer) session.getAttribute("numProductos") : 0%> </span><span> Productos</span><br>
                                        $ <span id="total"><%=(session.getAttribute("totalVenta") != null) ? (Double) session.getAttribute("totalVenta") : 0%></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--SECCION DE BARRA DE MENU-->
        <nav class="navbar navbar-default" role="navigation">
            <!-- El logotipo y el icono que despliega el menú se agrupan
                 para mostrarlos mejor en los dispositivos móviles -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Desplegar navegación</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="barra-menu">
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li class="<%=((pagina.equals("index")) ? "active" : " ")%>"><a href="../index.jsp"><i class="fa fa-home"></i> </a></li>
                        <li class="<%=((pagina.equals("nosotros")) ? "active" : " ")%>" ><a href="#">Nosotros</a></li>
                        <li class="<%=((pagina.equals("productos")) ? "active" : " ")%>" ><a href="../pedidos/productos.jsp">Productos</a></li>

                    </ul>

                    <form class="navbar-form navbar-right form-busqueda" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Buscar">
                        </div>
                        <button type="submit" class="btn btn-rojo"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
        </nav><!--FIN BARRA DE MENU-->

        <div class="msg_add_carro" style="display: none;"><p>Se agregó <span id="num_productos_adds">5</span> Productos</p></div>
