/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var pos = 1;
var posD = 1;

function nuevoAjax() {
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

function modificarProveedor() {
    var nombre = document.getElementById("nombreP");
    var email = document.getElementById("email");
    var direccion = document.getElementById("direccion");
    var campo = "campoResultado";
    ajax = nuevoAjax();

    parametros = "nombre=" + nombre.value + "&email=" + email.value + "&direccion=" + direccion.value;
    url = "Procesar/mensaje.jsp";
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

                if (rta.indexOf("S") > 0) {

                    document.getElementById(campo).innerHTML = "Modificacion exitosa";

                }
                else {

                    document.getElementById(campo).innerHTML = "Error en la modificacion";

                }
            }
            else
            {

                var rta = ajax.responseText;

                if (rta.indexOf("S") > 0) {

                    document.getElementById(campo).innerHTML = "Modificacion exitosa";

                }
                else {

                    document.getElementById(campo).innerHTML = "Error en la modificacion";

                }
            }
        }
        else
        {
            document.getElementById(campo).value = "Procesando modificacion";
        }
    }
    }

    function registrarproveedor() {
        var nombre = document.getElementById("nombreE");
        var email = document.getElementById("email");
        var direccion = document.getElementById("direccion");
        var campo = "campoResultado";
        ajax = nuevoAjax();

        parametros = "nombre=" + nombre.value + "&email=" + email.value + "&direccion=" + direccion.value;
        url = "Procesar/registro.jsp";
        ajax.open("POST", url, true);
        ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        ajax.send(parametros);
        ajax.onreadystatechange = function (){
            if (ajax.readyState == 4)
            {
                if (ajax.status == 200)
                {
                    var rta = ajax.responseText;

                    if (rta.indexOf("S") > 0) {

                        document.getElementById(campo).innerHTML = "Registro exitoso";

                    }
                    else {

                        document.getElementById(campo).innerHTML = "Error en el registro";

                    }
                }
                else
                {

                    var rta = ajax.responseText;

                    if (rta.indexOf("S") > 0) {

                        document.getElementById(campo).innerHTML = "Registro exitoso";

                    }
                    else {

                        document.getElementById(campo).innerHTML = "Error en el registro";

                    }
                }
            }
            else
            {
                document.getElementById(campo).value = "Procesando registro";
            }
        }
    }


