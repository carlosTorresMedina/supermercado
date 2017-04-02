<%-- 
    Document   : login
    Created on : 19/09/2015, 07:43:18 AM
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-escale=1.0" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../public/css/bootstrap.css" />
        <link rel="stylesheet" href="../public/css/general.css" />
        <script type="text/javascript" src="js/login.js"></script>
        <title>Login</title>
    </head>
    <body>

        <div class="jumbotron boxlogin">

            <form role="form" target="_parent" method="post" action="procesarSesion.jsp" name="login" id="login">
                <center><h2>Supermercado <br> motilón</h2></center>
                <label>Tipo usuario</label>
                <select id="tipo" name="tipo" class="form-control">
                    <option selected value="no seleccion" >
                        No selección
                    </option>
                    <option value="administrador">
                        Administrador
                    </option>                  
                    <option value="cliente">
                        Cliente
                    </option>

                </select>
                <label>Documento de identificación</label>
                <input required type="text" name="documento" id="nombre_usuario" placeholder="Documento de identificación" class="form-control" />

                <label >Contraseña</label>
                <input type="password" name="password" id="contraseña" placeholder="Contraseña" class="form-control" />

                <button type="button" class="btn  btn-success" onclick="validarUsuario();" name="ingresar" id="ingresar" value="Ingresar" />Ingresar</button>
            </form>
            <label id="divError">  </label>
        </div>
    </body>
    <script type="text/javascript" src="../public/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../public/js/bootstrap.min.js"></script>
</html>
