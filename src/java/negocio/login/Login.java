package negocio.login;

import dao.PersonaDAO;
import dto.Persona;
import util.SHA1;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:39:19 a.m.
 */
public class Login {

    public Login() {

    }

    /**
     * valida si existe el usuario en la base de datos y retorna los datos del
     * registro
     *
     * @param tipo
     * @param documento
     * @param password
     * @return
     * @throws Exception
     */
    public Persona iniciarSesion(String tipo, String documento, String password) throws Exception {

        Persona dto = new Persona();
        PersonaDAO dao = new PersonaDAO();

        dto.setTipo(tipo);
        dto.setDocumento(documento);
        dto.setPassword(SHA1.getHash(password));

        return dao.validarUsuario(dto);

    }
}
