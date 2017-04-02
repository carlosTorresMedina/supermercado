/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.login;

import dto.Persona;

/**
 *
 * @author carlos verifica el funcionamiendo del inicio de sesion en el sistema
 */
public class pruebaIniciarSesion {

    public static Persona iniciarSesion() {
        facade.Fachada fachada = new facade.Fachada();
        dto.Persona dto = null;
        try {
            //dto = fachada.iniciarSesion("1093780012", "1234");
//            dto = fachada.iniciarSesion("administrador","109378000", "1234");
             dto = fachada.iniciarSesion("cliente","109378000", "1234");

        } catch (Exception ex) {

        }
        return dto;
    }

    public static void main(String ar[]) {
        
        Persona p = pruebaIniciarSesion.iniciarSesion();
        
        if (p == null) {
            System.out.println("Usuario y/o  contraseña incorrectos");
        } else {
            String info = p.getNombre() + "  " + p.getApellido() + "  " + p.getTipo();
            System.out.println(info);
        }

    }

}
