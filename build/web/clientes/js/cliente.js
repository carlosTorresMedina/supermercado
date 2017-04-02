/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// JavaScript Document

var pos = 1;
var posD = 1;


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

function validarSaldo(sueldo) {
    
    if (sueldo < 0) {
        return false;

    }

    if (sueldo > 800000) {
        return false;

    }
    return true;

}


function registrarClienteAdministrador() {

    var documento = procesarregistrarclienteadmin.documento.value;
    var campo = "divError";
    ajax = nuevoAjax();

    parametros = "documento=" + documento;
    url = "procesar/proc.jsp";
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
            document.getElementById(campo).value = "Procesando registro";
        }
    }

}

function modificarCliente() {
    var documento = modificarcliente.documento.value;
    var nombre = modificarcliente.nombre.value;
    var apellido = modificarcliente.apellido.value;
    var email = modificarcliente.email.value;
    var saldo = modificarcliente.saldo.value;
    var direccion = modificarcliente.direccion.value;
    var password = modificarcliente.password.value;
    var passwordR = modificarcliente.passwordR.value;
    var telefono = modificarcliente.telefono.value;

    var x = validarPassword(password, passwordR);
    var campo = "divError";
    if (!x) {
        document.getElementById(campo).innerHTML = "las contraseñas no coinciden.";
        return;
    }
    x = validarSaldo(saldo);
    if (!x) {
        document.getElementById(campo).innerHTML = "el saldo solo puede estar entre el rango de 0 a 800000.";
        return;
    }
    ajax = nuevoAjax();
    aleatorio = Math.random();
    parametros = "documento=" + documento + "&nombre=" + nombre + "&apellido=" + apellido + "&email=" + email + "&direccion=" + direccion + "&saldo=" + saldo + "&password=" + password + "&telefono=" + telefono;
    url = "procesar/procesarmodificarcliente.jsp";
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
            document.getElementById(campo).value = "Procesando modificacion";
        }
    }
}

function registrarCliente() {
 
    var documento = registrarcliente.documento.value;
    var nombre = registrarcliente.nombre.value;
    var apellido = registrarcliente.apellido.value;
    var email = registrarcliente.email.value;
    var direccion = registrarcliente.direccion.value;
    var saldo = registrarcliente.saldo.value;
    var password = registrarcliente.password.value;
    var passwordR = registrarcliente.passwordR.value;
    var telefono = registrarcliente.telefono.value;

   var x = validarPassword(password, passwordR);
    var campo = "divError";
    if (!x) {
        document.getElementById(campo).innerHTML = "las contraseñas no coinciden.";
        return;
    }
   
     x = validarSaldo(saldo);
    if (!x) {
        document.getElementById(campo).innerHTML = "el saldo solo puede estar entre el rango de 0 a 800000.";
        return;
    }
    ajax = nuevoAjax();
    aleatorio = Math.random();
    parametros = "documento=" + documento + "&nombre=" + nombre + "&apellido=" + apellido + "&email=" + email + "&direccion=" + direccion + "&saldo=" + saldo + "&password=" + password + "&telefono=" + telefono;
    url = "procesar/procesarregistrarcliente.jsp";
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
            document.getElementById(campo).value = "Procesando registro";
        }
    }


}

function  validarPassword(password, passwordR) {

    if (password == passwordR) {
        return true;

    }
    return false;

}

