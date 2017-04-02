package util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author carlos
 */
public class Conexion {

    public static final String DRIVER = "org.gjt.mm.mysql.Driver";
    public static final String DBURL = "jdbc:mysql://sandbox2.ufps.edu.co/";
//     public static final String DBURL = "jdbc:mysql://localhost/";
    public static final String USER = "ufps_76";
//     public static final String USER = "root";
//    dejemos la base de datos sin contraseña por ahora 
    public static final String PASS = "ufps_29";
//     public static final String PASS = "";
    public static final String DB = "ufps_76";
//    public static final String DB = "motilon";

    /**
     * crea la conexion a la base de datos
     *
     * @return
     * @throws Exception la excepcion es lanzada a la capa proxima
     */
    public static Connection crearConexion() throws Exception {

        Connection conn = null;

        Class.forName(DRIVER).newInstance();
        conn = DriverManager.getConnection(DBURL + DB, USER, PASS);

        if (conn != null) {
            System.out.println("Conexion establecida");
        }
        return conn;
    }

}
