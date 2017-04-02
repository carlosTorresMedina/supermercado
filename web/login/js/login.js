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

function validarUsuario()
{
    var tipo = login.tipo.value
    var documento = login.documento.value;
    var password = login.password.value;

    validarUsuarioAjax(tipo, documento, password, "divError");

}


function validarUsuarioAjax(tipo, documento, password, campo)
{

    aleatorio = Math.random();
    ajax = nuevoAjax();

    parametros = "tipo=" + tipo + "&documento=" + documento + "&clave=" + password + "&aleatorio=" + aleatorio;
    url = "procesarSesion.jsp";

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

                if (rta.indexOf("1") < 0 && rta.indexOf("2") < 0) {

                    document.getElementById(campo).innerHTML = ajax.responseText;

                }
                else {

                    if (rta.indexOf("1") >= 0) {

                        login.action = "../pedidos/pendientes.jsp";
                        login.submit();
                    } else
                    if (rta.indexOf("2") >= 0) {

                        login.action = "../index.jsp";
                        login.submit();
                    }
                }
            }
            else
            {
                var rta = ajax.responseText;
                if (rta.indexOf("1") < 0 && rta.indexOf("2") < 0) {
                    document.getElementById(campo).innerHTML = ajax.responseText;
                }
                else {
                    if (rta.indexOf("1") >= 0) {
                        login.action = "../productos/controlproductos.jsp";
                        login.submit();
                    } else if (rta.indexOf("2") >= 0) {
                        login.action = "../pedidos/realizarpedidos.jsp";
                        login.submit();
                    }
                }
            }
        }
        else
        {
            document.getElementById(campo).value = "Verificando Usuario...";
        }
    }
}

function content_center() {
    if (document.getElementById('menu').offsetHeight > document.getElementById('content').offsetHeight) {
        h = (document.getElementById('menu').offsetHeight - document.getElementById('content').offsetHeight) / 2;
        document.getElementById('content').style.marginTop = h + 'px';
    }
}

function procesarDatosForm() {

    var numero = frmEjemplo.txtNumero.value;
    var campo = "divProcesar";
    procesarDatosAjax(numero, campo);
}

function procesarDatosAjax(numero, campo) {

    aleatorio = Math.random();
    ajax = nuevoAjax();
    parametros = "numero=" + numero + "&aleatorio=" + aleatorio;
    url = "../formularioDinamico.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function ()
    {
        if (ajax.readyState == 4)
        {
            if (ajax.status == 200)
            {

                document.getElementById(campo).innerHTML = ajax.responseText;
            }
            else
            {

                document.getElementById(campo).innerHTML = ajax.responseText;
            }
        }
        else
        {
            document.getElementById(campo).value = "Verificando Usuario...";
        }
    }
}


// metodos agregados por el grupo 1

function cmdCargarTablaaa() {
    document.getElementById("seleccionCantidad").style.display = 'none';
    document.getElementById("lugarTabla").style.display = 'block';
    var cant = document.getElementById("cantidadEstudiantes").value;
    var campo = "lugarTabla";
    cargarTablaAjax(cant, campo);
}



function cargarTablaAjax(cantEst, campo) {


    aleatorio = Math.random();
    ajax = nuevoAjax();
    parametros = "cantEstudiantes=" + cantEst + "&aleatorio=" + aleatorio;
    url = "procesarTabla.jsp";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function ()
    {
        if (ajax.readyState == 4)
        {
            if (ajax.status == 200)
            {

                document.getElementById(campo).innerHTML = ajax.responseText;
            }
            else
            {

                document.getElementById(campo).innerHTML = ajax.responseText;
            }
        }
        else
        {
            document.getElementById(campo).value = "Verificando Usuario...";
        }
    }
}
/**
 * ajax del grupo 2 
 */

function cargarProyectos() {

    var campo = "tablaProyectoDiv";
    cargarProyectoAjax(campo);
}

function cargarProyectoAjax(campo)
{

    aleatorio = Math.random();
    ajax = nuevoAjax();
    parametros = "&aleatorio=" + aleatorio;
    url = "CargarProyectos.jsp";
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
                if (rta.indexOf("Ok") < 0) {
                    document.getElementById(campo).innerHTML = ajax.responseText;
                }
                else {
                    tablaProyecto.submit();
                }
            }
            else
            {
                var rta = ajax.responseText;
                if (rta.indexOf("Ok") < 0) {
                    document.getElementById(campo).innerHTML = ajax.responseText;
                }
                else {
                    tablaProyecto.submit();
                }
            }
        }
        else
        {
            document.getElementById(campo).value = "Verificando Usuario...";
        }
    }
}


function agregarEstudiante() {
    codigo = document.getElementById("codigoEst").value;
    if (codigo == "")
        alert("Ingrese el c�digo");
    else {
        nuevaFila = document.getElementById("tabla").insertRow(-1);
        nuevaCelda = nuevaFila.insertCell(-1);
        nuevaCelda.innerHTML = "<td><input type='text' value=" + pos + " readonly></td>";
        nuevaCelda = nuevaFila.insertCell(-1);
        nuevaCelda.innerHTML = "<td><input type='number' name='codigo' id='codigo' value=" + codigo + "></td>";
        nuevaCelda = nuevaFila.insertCell(-1);
        nuevaCelda.innerHTML = " <td><input type='button' class='btn btn-danger' class='form-control' value='-' onclick='eliminarEstudiante(this)'></td> ";
        pos++;
    }

}

function agregarDocente() {

    codigo = document.getElementById("codigoDir").value;
    if (codigo == "")
        alert("Ingrese el c�digo");
    else {
        nuevaFila = document.getElementById("tabla2").insertRow(-1);
        nuevaCelda = nuevaFila.insertCell(-1);
        nuevaCelda.innerHTML = "<td><input type='text' value=" + posD + " readonly></td>";
        nuevaCelda = nuevaFila.insertCell(-1);
        nuevaCelda.innerHTML = "<td><input type='number' name='codigo' id='codigo' value=" + codigo + "></td>";
        nuevaCelda = nuevaFila.insertCell(-1);
        nuevaCelda.innerHTML = " <td><input type='button' class='btn btn-danger' class='form-control' value='-' onclick='eliminarDocente(this)'></td> ";
        posD++;
    }

}

function eliminarEstudiante(obj) {

    var oTr = obj;
    while (oTr.nodeName.toLowerCase() != 'tr') {
        oTr = oTr.parentNode;
    }
    var root = oTr.parentNode;
    root.removeChild(oTr);
    pos--;
}

function eliminarDocente(obj) {

    var oTr = obj;
    while (oTr.nodeName.toLowerCase() != 'tr') {
        oTr = oTr.parentNode;
    }
    var root = oTr.parentNode;
    root.removeChild(oTr);
    posD--;
}



