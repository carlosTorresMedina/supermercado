/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.GestionPersonal;

import dto.Persona;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author carlos verifica el funcionamiento del modulo de gestion de personal
 */
public class pruebaGestionPersonal {

    public static void registrarAdministrador() {
        facade.Fachada fachada = new facade.Fachada();
        for (int i = 0; i < 10; i++) {
            try {
//                String x = fachada.registrarAdministrador("10937800" + i, "carlos" + i, "torres" + i, "carlosalfredo010" + i + "@gmail.com", "1234", "barrio galan calle 24");
//                System.out.println(x);
            } catch (Exception ex) {
                Logger.getLogger(pruebaGestionPersonal.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void registrarCliente() {
        facade.Fachada fachada = new facade.Fachada();
        for (int i = 0; i < 10; i++) {
            try {
//               String x = fachada.registrarCliente("10937800" + i, "carlos" + i, "torres" + i, "carlosalfredo010" + i + "@gmail.com", "1234", "barrio galan calle 24", "800000");
//                System.out.println(x);
            } catch (Exception ex) {
                Logger.getLogger(pruebaGestionPersonal.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void modificarCliente() {
        facade.Fachada fachada = new facade.Fachada();
        try {
//            boolean x = fachada.ActualizarCliente("109378000", "pepito", "perez", "ESTOPA@GMAIL.COM", "1234", "BARRIO GALAN CALLE 25", "1000000");
//            System.out.println(x);
        } catch (Exception ex) {
            Logger.getLogger(pruebaGestionPersonal.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void modificarAdministrador() {
        facade.Fachada fachada = new facade.Fachada();
        try {
//            boolean x = fachada.ActualizarAdministrador("109378001", "carla", "morrison", "carlamorrison@gmail.com", "123456", "ATALAYA CALLE 12");
//            System.out.println(x);
        } catch (Exception ex) {
            Logger.getLogger(pruebaGestionPersonal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void listarClientes() {
        facade.Fachada fachada = new facade.Fachada();
        try {
            ArrayList<dto.Persona> lista = fachada.listarClientes();
            for (Persona dto : lista) {
                System.out.println("Documento " + dto.getDocumento() + " Nombre " + dto.getNombre() + " apellido " + dto.getApellido());
            }
        } catch (Exception ex) {
            Logger.getLogger(pruebaGestionPersonal.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void consultarPersonal() {
        facade.Fachada fachada = new facade.Fachada();
        try {
            dto.Persona dto = fachada.consultarPersonal("109378001");
            System.out.println("usuario : " + dto.getDocumento() + " nombre: " + dto.getNombre() + " apellido: " + dto.getApellido() + " email: " + dto.getEmail());
        } catch (Exception ex) {
            Logger.getLogger(pruebaGestionPersonal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String arr[]) {
        pruebaGestionPersonal.registrarAdministrador();
//        pruebaGestionPersonal.registrarCliente();
//        pruebaGestionPersonal.modificarCliente();
//          pruebaGestionPersonal.modificarAdministrador();
//        pruebaGestionPersonal.consultarPersonal();
//        pruebaGestionPersonal.listarClientes();
    }

}
