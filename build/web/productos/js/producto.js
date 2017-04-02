/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* Crea el objeto AJAX. Esta funcion es generica para cualquier utilidad de este tipo, por
 lo que se puede copiar tal como esta aqui */
function nuevoAjax()
{
    var xmlhttp = false;
    try {
        // Creacion del objeto AJAX para navegadores no IE Ejemplo:Mozilla, Safari 
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            // Creacion del objet AJAX para IE
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            if (!xmlhttp && typeof XMLHttpRequest != 'undefined')
                xmlhttp = new XMLHttpRequest();
        }
    }
    return xmlhttp;
}

function tipo() {

    var tipo = consultarTipoProducto.tipo.value;
    var campo = "tablaProducto";
    ajax = nuevoAjax();

    parametros = "tipo=" + tipo;
    url = "procesar/tipo.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function ()
    {
        if (ajax.readyState == 4)
        {
            if (ajax.status == 200)
            {
                var rta = ajax.responseText;
                document.getElementById(campo).innerHTML = rta;
            }
            else
            {
                var rta = ajax.responseText;
                document.getElementById(campo).innerHTML = rta;
            }
        }
        else
        {
            document.getElementById(campo).value = "Procesando";
        }
    }

}

function registrarProducto() {

    var proveedor = registrarproducto.proveedor.value;
    var tipo = registrarproducto.tipo.value;
    var marca = registrarproducto.marca.value;
    var nombre = registrarproducto.nombre.value;
    var proveedor = registrarproducto.proveedor.value;
    var cantidad = registrarproducto.cantidad.value;
    var precioventa = registrarproducto.precioventa.value;
    var preciocompra = registrarproducto.preciocompra.value;

    var campo = "registroproducto";
    var campo2 = "divError";
    ajax = nuevoAjax();

    parametros = "proveedor=" + proveedor + "&tipo=" + tipo + "&marca=" + marca + "&nombre=" + nombre + "&cantidad=" + cantidad + "&precioventa=" + precioventa + "&preciocompra=" + preciocompra;
    url = "procesar/registronuevo.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function ()
    {
        if (ajax.readyState == 4)
        {
            if (ajax.status == 200)
            {
                var rta = ajax.responseText;
                if (rta.lastIndexOf('ninguna') > 0) {

                    document.getElementById(campo2).innerHTML = "El producto no se puede registrar<br> ya esta registrado<br>";
                } else {
                    document.getElementById(campo).innerHTML = rta;
                }
            }
            else
            {
                var rta = ajax.responseText;
                if (rta == 1) {
                    document.getElementById(campo2).innerHTML = rta;
                } else {
                    document.getElementById(campo).innerHTML = rta;
                }
            }
        }
        else
        {
            document.getElementById(campo).value = "Procesando";
        }
    }

}

function Existente() {

    var proveedor = registrarproductonuevo.proveedor.value;
    var producto = registrarproductonuevo.producto.value;
    var cantidad = registrarproductonuevo.cantidad.value;



    var campo2 = "divError";
    ajax = nuevoAjax();

    parametros = "proveedor=" + proveedor + "&producto=" + producto + "&cantidad=" + cantidad;
    url = "procesar/registrarexistente.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function ()
    {
        if (ajax.readyState == 4)
        {
            if (ajax.status == 200)
            {
                var rta = ajax.responseText;
                if (rta.lastIndexOf('ninguna') > 0) {

                    document.getElementById(campo2).innerHTML = "error al ingresar el producto";
                } else {
                    document.getElementById(campo2).innerHTML = "el ingreso se realizo de manera exitos";
                }
            }
            else
            {
                var rta = ajax.responseText;
                if (rta.lastIndexOf('ninguna') > 0) {

                    document.getElementById(campo2).innerHTML = "error al ingresar el producto";
                } else {
                    document.getElementById(campo2).innerHTML = "el ingreso se realizo de manera exitos";
                }
            }
        }
        else
        {
            document.getElementById(campo2).value = "Procesando";
        }
    }


}



