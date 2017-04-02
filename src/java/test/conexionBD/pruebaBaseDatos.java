/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.conexionBD;

import java.util.logging.Level;
import java.util.logging.Logger;
import util.Conexion;

/**
 *
 * @author carlos
 * verifica la conexion a la base de datos
 */
public class pruebaBaseDatos {

    public static void main(String ar[]) {

        try {
            Conexion.crearConexion();
        } catch (Exception ex) {
            Logger.getLogger(pruebaBaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
