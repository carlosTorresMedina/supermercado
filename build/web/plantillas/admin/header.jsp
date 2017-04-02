<%-- 
    Document   : header
    Created on : 15/10/2015, 09:53:05 PM
    Author     : freddhy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pagina = "panel";

    if (session.getAttribute("pagina") != null) {
        pagina = session.getAttribute("pagina").toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="../public/js/jquery-1.11.3.js" type="text/javascript"></script>
        <link href="../public/css/bootstrap.css" type="text/css" rel="stylesheet">          
        <link rel="stylesheet" href="../public/css/font-awesome.css">

        <link rel="stylesheet" href="../plantillas/admin/css/AdminLTE.css">
        <link rel="stylesheet" href="../plantillas/admin/css/skin-green.css">

        <title>JSP Page</title>
    </head>
    <body class="skin-green sidebar-mini">
        <div class="wrapper">
            <!-- Main Header -->
            <header class="main-header">
                <!-- Logo -->
                <a href="#" class="logo">
                    <span class="logo-mini"><b>S</b>M</span>
                    <span class="logo-lg"><b>SP</b>MOTILON</span>
                </a>
                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">

                        <ul class="nav navbar-nav">

                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <a href="../pedidos/pendientes.jsp">
                                    <i class="fa fa-bell-o"></i>
                                    <input type="hidden" id="input-cantidad" value="" />
                                    <span class="label label-danger" id="cantida-pedidos">0</span>
                                    <audio id="audio">
                                        <source src="../public/audio/audio.mp3" type="audio/mp3" />
                                    </audio>
                                </a>

                            </li>
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="../plantillas/admin/img/avatar1.png" class="user-image" alt="U">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs">Administrador</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="../plantillas/admin/img/avatar1.png" class="img-circle">
                                        <p>
                                            Administrador
                                            <small><%= session.getAttribute("nombre")%></small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="../login/cerrarSesion.jsp" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!--Control-->
                        </ul>
                    </div>
                </nav>
            </header>

            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel">
                    </div>
                    <!-- search form (Optional) -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->

                    <!-- (Menu vertical izquierda)-->
                    <ul class="sidebar-menu">
                        <li class="header">HEADER</li>
                        <li class="<%=((pagina.equals("panel")) ? "active" : " ")%>"><a href="../pedidos/pendientes.jsp"><i class="fa fa-dashboard"></i> <span>Panel Principal</span></a></li>
                        <li class="treeview <%=((pagina.equals("pedidos")) ? "active" : " ")%>">
                            <a href="#"><i class="fa fa-shopping-cart"></i> <span>Pedidos</span></a>
                            <ul class="treeview-menu">
                                <li><a href="../pedidos/pendientes.jsp"><span>Pendientes</span></a></li>
                                <li><a href="../pedidos/historialPedidos.jsp"><span>Historial</span></a></li>
                            </ul>
                        </li>

                        <li class="treeview <%=((pagina.equals("productos")) ? "active" : " ")%>">
                            <a href="#"><i class="fa fa-ship"></i> <span>Productos</span></a>
                            <ul class="treeview-menu">
                                <li><a href="../productos/ingresarproducto.jsp"><span>Ingresar producto nuevo</span></a></li>
                                <li><a href="../productos/productoexistente.jsp"><span>Ingresar producto existente</span></a></li>
                                <li><a href="../productos/controlproductos.jsp"><span>Consultar productos</span></a></li>


                            </ul>
                        </li>
                        <li class="treeview <%=((pagina.equals("personal")) ? "active" : " ")%>">
                            <a href="#"><i class="fa fa-users"></i> <span>Gestión Personal</span></a>
                            <ul class="treeview-menu">
                                <li><a href="../clientes/consultarclientes.jsp">Clientes</a></li>
                                <li><a href="../administrador/consultaradministrador.jsp">Administrador</a></li>
                            </ul>
                        </li>
                        <li class="<%=((pagina.equals("provedores")) ? "active" : " ")%>"><a href="../proveedores/consultarproveedores.jsp"><i class="fa fa-user"></i></i> <span>Proveedores</span></a></li>
                    </ul>

                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">