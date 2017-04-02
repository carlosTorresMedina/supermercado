/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.GestionProveedor;

import java.util.logging.Level;
import java.util.logging.Logger;
import test.GestionPersonal.pruebaGestionPersonal;

/**
 *
 * @author Javier
 */
public class testPruebaProveedor {
   public static void registrarProveedor() {
        facade.Fachada fachada = new facade.Fachada();
        for (int i = 0; i < 10; i++) {
            try {
                boolean x = fachada.registrarProveedor("Comepan"+i, "Pescadero", "comepan"+i+"@gmail.org");
                System.out.println(x);
            } catch (Exception ex) {
                Logger.getLogger(testPruebaProveedor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
   
   public static void registrarProveedor1() {
        facade.Fachada fachada = new facade.Fachada();
        
            try {
                boolean x = fachada.registrarProveedor("Comepan", "Pescadero", "comepan@gmail.org");
                System.out.println(x);
            } catch (Exception ex) {
                Logger.getLogger(testPruebaProveedor.class.getName()).log(Level.SEVERE, null, ex);
            }
        
    }
   
    public static void registrarProveedor2() {
        facade.Fachada fachada = new facade.Fachada();
        
            try {
                boolean x = fachada.registrarProveedor("Alqueria", "Siglo XXI", "alquría@gmail.org");

                System.out.println(x);
            } catch (Exception ex) {
                Logger.getLogger(testPruebaProveedor.class.getName()).log(Level.SEVERE, null, ex);
            }   
    }
    
     public static void registrarProveedor3() {
        facade.Fachada fachada = new facade.Fachada();
        
            try {
                boolean x = fachada.registrarProveedor("COMPAQ", "New York", "caballeroZodiaco@gmail.org");
                System.out.println(x);
            } catch (Exception ex) {
                Logger.getLogger(testPruebaProveedor.class.getName()).log(Level.SEVERE, null, ex);
            }
        
    }
   
   public static void actualizarProveedor(){
       facade.Fachada fachada = new facade.Fachada();
       try{
           boolean x= fachada.actualizarProveedor("Comepan0", "Cañafistolo", "comepan0@gmail.org");
           System.out.println(x);
       }catch (Exception ex){
           Logger.getLogger(testPruebaProveedor.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
   
   public static void consultarProveedor(){
       facade.Fachada fachada = new facade.Fachada();
       try{
           dto.Proveedor p = fachada.consultarProveedor("COMPAQ");
           System.out.println(p.getNombre()+" "+p.getEmail()+" "+p.getDireccion());
       }catch (Exception ex){
           Logger.getLogger(testPruebaProveedor.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
   
    public static void main(String[] args) {
        registrarProveedor1();
        registrarProveedor2();
        registrarProveedor3();
        registrarProveedor();
//        consultarProveedor();
        //actualizarProveedor();
    }
   
}
