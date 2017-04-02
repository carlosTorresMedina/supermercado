$(document).ready(function () {

    validar_input_number();

});

function validar_input_number() {
    $('.numero').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9]/g, '');
    });
}

/**
 * Permite decrementar la cantidad del producto
 */
function decrementar(btn) {

    var id = btn.dataset.id;
    var d = parseInt($("#" + id).val());

    if (d && d > 0) {
        $("#" + id).val((d - 1));
    }
}

/**
 * Permite incrementar la cantidad del producto
 */
function incrementar(btn) {

    var id = btn.dataset.id;
    var i = parseInt($("#" + id).val());
    //Actualizar
    $("#" + id).val((i + 1));
}


/**
 * Permite agregar un producto al carro de compras
 * @param {button} btn
 */
function add_carro_compras(btn) {

    //Id del input que contiene la cantidad del producto seleccionado
    var id = btn.dataset.id;
    //Se obtiene el valor del input
    var cantidad = $("#" + id).val();

    //Se valida que exista el id y que la cantidad sea mayor que cero (0)
    if (id && cantidad > 0) {
        var datos = id.split("-");
        //Se obtiene el código del producto
        var id_producto = datos[1];

        //Se realiza la petición ajax
        $.ajax({
            url: "addcarro.jsp",
            type: 'POST',
            data: {
                codigo: id_producto,
                cantidad: cantidad
            },
            success: function (rpt) {

                if (rpt) {
                    if (rpt === 100) {
                        //Faltó el código o cantidad
                        console.log("Faltó el código o cantidad");
                    } else if (rpt === 200) {
                        //Cantidad solicitada del producto no disponible
                        console.log("Cantidad solicitada del producto no disponible");
                    } else {
                        //Exito en la operación
                        $("#seccion-carro").html("");
                        $("#seccion-carro").html(rpt);

                        $("#num_productos_adds").html("");
                        $("#num_productos_adds").html(cantidad);
                        $(".msg_add_carro").show();
                        $(".msg_add_carro").delay(4000).hide(300);
                    }
                }

                //Limpiando el campo cantidad producto
                $("#" + id).val(0);
            }
        });
    }
}

/**
 * Permite eliminar un item (Producto del carro)
 * @param {button} btn
 */
function eliminar_pro_carro(btn) {

    var codigo = btn.dataset.codigo;
    console.log("ELIMINAR PRODUCTO DEL CARRO " + codigo);

    $.ajax({
        url: 'eliminarItem.jsp',
        type: 'POST',
        data: {codigo: codigo},
        success: function (data) {
            console.log("DATA " + data);
            if (data == 1) {
                //$("#item" + codigo).remove();
                // Recargo la página
                location.reload();
            }
        }
    });
}

/**
 * Permite actualizar la cantidad de un producto que se encuentra actualmente
 * en el carro de compras
 * @param {button} btn

 */
function actualizarCantidad(btn) {

    var id_input = btn.dataset.id;
    //Cantidad de productos
    var cantidad = $("#" + id_input).val();
    var codigo = $("#" + id_input).data("codigo");

    $.ajax({
        url: 'actualizarCantidad.jsp',
        type: 'POST',
        data: {codigo: codigo, cantidad: cantidad},
        success: function (data) {
            console.log("DATA " + data);
            if (data == 1) {
                location.reload();
            }
        }
    });
}

/**
 * ***********CONFIRMACIÓN DE COMPRA
 */

/**
 * Permite validar el proceso de compra y en caso de exito registra la compra
 * del cliente en la BD
 */
function confirmar_compra() {

    $.ajax({
        url: 'validarCompra.jsp',
        type: 'POST',
        success: function (data) {

            var json = jQuery.parseJSON(data);

            if (json.estado == false) {

                $("#contenido_msg").html("");
                $("#contenido_msg").html(json.msg);
                //Se muestra el mensaje de alerta
                $("#msg-error").removeClass("hidden");

            } else {
                registrar_pedido();
            }
        }
    })

}

/**
 * Permite registrar un pedido despues de que este haya sido respectivamente validado.
 */
function registrar_pedido() {
    console.log("REGISTRAR PEDIDO");
    $.ajax({
        url: "registrarVenta.jsp",
        type: 'POST',
        success: function (data) {
            //console.log("DATOS" + data);
            var json = jQuery.parseJSON(data);

            if (json.estado == true) {

                $("div #contenido-detalle-pedido").addClass("hidden");
                $("#msg-exitoso").removeClass("hidden");

                //Actualizando la parte visual
                $("#cantidad-productos").html("0");
                $("#total").html("0");
            } else {
                $("p #contenido-msg").html("");
                $("p #contenido-msg").html("Ha ocurrido un error, intente realizar el pedido mas tarde o cominiquese al teléfono 320 5555 555");
            }
        }
    });
}
/**
 * ***********PAGINACIÓN
 */

/**
 * Permite la paginacón de los productos
 * @param button btn
 */
function pagina(btn) {

    if (btn) {
        //Objeto con el contenido de los enlaces de la paginación
        var objPaginacion = $("ul.pagination");
        var total_pagina = objPaginacion.data('paginas');
        console.log("total = " + total_pagina);
        //Objeto que invoca la función
        var objBtn = $(btn);
        var num_pagina = objBtn.data('pagina');
        console.log("seleccionada = " + num_pagina);

        //1. Quitar la clase active de la página1 (Enlace de la página)
        $(".pagination li.active").removeClass("active");
        //2. Se agrega la clase active a la pagina seleccionada
        //objBtn.parent().addClass("active");
        $("#p" + num_pagina).addClass("active");
        //3. Validado la activación de flechas izquierda y derecha
        if (num_pagina == 1) {
            $("#pagina-izq").addClass('disabled');
            $("#pagina-der").removeClass('disabled');
            console.log("pagina inicio");
        }
        else if (num_pagina == total_pagina) {
            $("#pagina-der").addClass('disabled');
            $("#pagina-izq").removeClass('disabled');
            console.log("pagina final");
        } else {
            //Se habilitan los enlaces
            $("#pagina-izq").removeClass('disabled');
            $("#pagina-der").removeClass('disabled');
            //Se actualiza el número de página al que deben referenciar
            $("#pagina-izq").data(num_pagina - 1);
            $("#pagina-der").data(num_pagina + 1);
        }
        //4. Ocultar la página activa y activar la página seleccionada
        desactivar_pagina();
        activar_pagina(num_pagina);



    } else {

    }
}

/**
 * Función axuliar que permite activar la página seleccionada
 * @param int num_pagina
 */
function activar_pagina(num_pagina) {
    var elementos_pagina = 12;

    if (num_pagina) {
        var inicio = ((num_pagina - 1) * elementos_pagina) + 1;
        var fin = num_pagina * elementos_pagina;

        for (var i = inicio; i <= fin; i++) {
            var obj = $("div #contenido" + i);

            if (obj) {
                obj.addClass('pagina-activa');
            }
        }
    }
}

/**
 * Función auxiliar que permite desactivar la página que se encuetra activa,
 * para que de paso a la activación de la nueva página seleccionada
 */
function desactivar_pagina() {

    $("div.pagina-activa").each(function (index) {
        $(this).removeClass("pagina-activa");
        $(this).addClass("pagina-inactiva");
    });
}
