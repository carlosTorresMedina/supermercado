$(document).ready(function () {

});

/**
 * Permite cambiar el estado de un pedido
 * @param btn 
 */
function despachado(btn) {

    if (btn) {
        var idPedido = btn.dataset.idpedido;
        var estado = btn.dataset.estado;

        $.ajax({
            url: "actualizarEstadoPedido.jsp",
            type: 'POST',
            data: {id: idPedido, estado: estado},
            success: function (data) {
                console.log(data);
                var json = jQuery.parseJSON(data);

                if (json.estado == true) {
                    location.reload();
                }

            }
        });
    }
}