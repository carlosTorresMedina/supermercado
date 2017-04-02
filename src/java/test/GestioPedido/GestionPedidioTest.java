/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.GestioPedido;

import dto.Pedido;
import dto.Producto;
import facade.Fachada;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author freddhy
 */
public class GestionPedidioTest {

    public void registrar() {
        facade.Fachada fachada = new facade.Fachada();

        try {
            boolean estado = fachada.registrarPedido("111", new HashMap<String, Producto>());
            System.out.println("ESTADO ->" + estado);
        } catch (Exception ex) {
            System.out.println("ERROR -> " + ex.getMessage());
        }
    }

    public void listarPedido(int id) {
        Fachada fachada = new Fachada();
        Pedido pedido = fachada.getPedidoProductos(id);
        if (pedido == null) {
            System.out.print("VIENE NULL EL PEDIDO");
        }
        if(pedido.getProductos() == null){
            
        }
        ArrayList<Producto> productos = (ArrayList<Producto>) (pedido.getProductos());
        
        
        for (Producto producto : productos) {
            System.out.println(producto.toString());
        }
    }

    public static void main(String... arg) {

        GestionPedidioTest gp = new GestionPedidioTest();
        gp.listarPedido(14);
    }

}
