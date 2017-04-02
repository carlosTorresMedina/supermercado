/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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


function registrarAdministradorCliente() {

    var documento = procesarregistraradmincliente.documento.value;
    var valor = procesarregistraradmincliente.valor.value;
    var campo = "divError";
    ajax = nuevoAjax();

    parametros = "documento=" + documento + "&valor=" + valor;
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



function modificarAdministrador() {
    var documento = modificaradministrador.documento.value;
    var nombre = modificaradministrador.nombre.value;
    var apellido = modificaradministrador.apellido.value;
    var email = modificaradministrador.email.value;
    var direccion = modificaradministrador.direccion.value;
    var password = modificaradministrador.password.value;
    var passwordR = modificaradministrador.passwordR.value;
    var telefono = modificaradministrador.telefono.value;

    var x = validarPassword(password, passwordR);
    var campo = "divError";
    if (!x) {
        document.getElementById(campo).innerHTML = "las contraseñas no coinciden.";
        return;
    }

    ajax = nuevoAjax();
    aleatorio = Math.random();
    parametros = "documento=" + documento + "&nombre=" + nombre + "&apellido=" + apellido + "&email=" + email + "&direccion=" + direccion + "&password=" + password + "&telefono=" + telefono;
    url = "procesar/procesarmodificaradministrador.jsp";
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
        } else
        {
            document.getElementById(campo).value = "Procesando modificacion";
        }
    }

}



function registrarAdministrador() {

    var documento = registraradministrador.documento.value;
    var nombre = registraradministrador.nombre.value;
    var apellido = registraradministrador.apellido.value;
    var email = registraradministrador.email.value;
    var direccion = registraradministrador.direccion.value;
    var password = registraradministrador.password.value;
    var passwordR = registraradministrador.passwordR.value;
    var telefono = registraradministrador.telefono.value;

    var x = validarPassword(password, passwordR);
    var campo = "divError";
    if (!x) {
        document.getElementById(campo).innerHTML = "las contraseñas no coinciden.";
        return;
    }


    ajax = nuevoAjax();
    aleatorio = Math.random();
    parametros = "documento=" + documento + "&nombre=" + nombre + "&apellido=" + apellido + "&email=" + email + "&direccion=" + direccion + "&password=" + password + "&telefono=" + telefono;
    url = "procesar/procesarregistraradministrador.jsp";
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
        } else
        {
            var rta = ajax.responseText;
            document.getElementById(campo).innerHTML = rta;
        }

    }
}




function  validarPassword(password, passwordR) {
    if (password == passwordR) {
        return true;
    }
    return false;
}

    