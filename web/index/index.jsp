<%-- 
    Document   : index
    Created on : 17/10/2015
    Author     : Freddhy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("pagina", "index");
%>
<jsp:include page="../plantillas/usuario/header.jsp" />


<div class="container">
    <div class="row">

        <div class="col-lg-4 col-sm-6 sp-col">
            <a href="../pedidos/productos.jsp?categoria=carnes">
                <div class="contenedor-img ejemplo-1">  

                    <img src="../public/img/carnes1.jpg" class="img-responsive img-rounded" />

                    <div class="mascara"></div>

                    <div class="contenido">
                        <h2>Carnes</h2>  
                        <p></p>
                        <a href="../pedidos/productos.jsp?categoria=carnes" class="link">Ver Productos</a>
                    </div>

                </div>
            </a>
        </div>

        <div class="col-lg-4 col-sm-6 sp-col">
            <a href="../pedidos/productos.jsp?categoria=verduras">
                <div class="contenedor-img ejemplo-1">  
                    <img src="../public/img/verduras1.jpg" class="img-responsive img-rounded" />
                    <div class="mascara"></div> 
                    <div class="contenido">
                        <h2>Verduras</h2>  
                        <p></p>
                        <a href="../pedidos/productos.jsp?categoria=verduras" class="link">Ver Productos</a>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-sm-6 sp-col">
            <a href="../pedidos/productos.jsp?categoria=viveres">
                <div class="contenedor-img ejemplo-1">  
                    <img src="../public/img/viveres.png" class="img-responsive img-rounded" />
                    <div class="mascara"></div> 
                    <div class="contenido">
                        <h2>Viveres</h2>  
                        <p></p>
                        <a href="../pedidos/productos.jsp?categoria=viveres" class="link">Ver Productos</a>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-sm-6 sp-col">
            <a href="../pedidos/productos.jsp?categoria=panaderia">
                <div class="contenedor-img ejemplo-1">  
                    <img  src="../public/img/panes.jpg" class="img-responsive img-rounded"/> 
                    <div class="mascara"></div> 
                    <div class="contenido">
                        <h2>Panaderia</h2>  
                        <p></p>
                        <a href="../pedidos/productos.jsp?categoria=panaderia" class="link">Ver Productos</a>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-sm-6 sp-col">
            <a href="../pedidos/productos.jsp?categoria=licores">
                <div class="contenedor-img ejemplo-1">  
                    <img src="../public/img/licores1.jpg" class="img-responsive img-rounded" />
                    <div class="mascara"></div> 
                    <div class="contenido">
                        <h2>Licores</h2>  
                        <p></p>
                        <a href="../pedidos/productos.jsp?categoria=licores" class="link">Ver Productos</a>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-4 col-sm-6 sp-col">
            <a href="../pedidos/productos.jsp?categoria=papeleria">
                <div class="contenedor-img ejemplo-1">  
                    <img src="../public/img/papeleria1.jpg" class="img-responsive img-rounded" />
                    <div class="mascara"></div> 
                    <div class="contenido">
                        <h2>Papeleria</h2>  
                        <p></p>
                        <a href="../pedidos/productos.jsp?categoria=papeleria" class="link">Ver Productos</a>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

<jsp:include page="../plantillas/usuario/footer.jsp" />
