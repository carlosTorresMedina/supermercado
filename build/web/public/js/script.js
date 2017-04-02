var cont = 0;
$(document).ready(function () {

    //Se jecuta cuando termine de cargar la página
    validarExistenciaPedido();

    setInterval('validarExistenciaPedido()', 1000 * 60);
});

/**
 * Funcion que se ejecutara cada cierto tiempo en busca de pedidos pendientes
 * para posteriormente notificar
 */
function validarExistenciaPedido() {

    console.log("EJECUCION " + cont);
    cont++;
    $.ajax({
        url: '../pedidos/validarPedidosPendientes.jsp',
        type: 'POST',
        success: function (data) {

            var json = jQuery.parseJSON(data);

            var cantidadOld = parseInt($("#input-cantidad").val());
            var cantidadNew = parseInt(json.cantida);

            $("#cantida-pedidos").html(cantidadNew);
            $("#input-cantidad").val(cantidadNew)

            if (cantidadNew > cantidadOld) {
                $("#audio")[0].play();
            }
        }
    });
}

