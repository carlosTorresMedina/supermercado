package negocio.personal;

import dao.PersonaDAO;
import dto.Persona;
import java.util.ArrayList;

/**
 * @author Freddhy
 * @version 1.0
 * @created 10-oct-2015 10:39:18 a.m.
 */
public class GestionPersonal {

    public GestionPersonal() {

    }

    /**
     * metodo que registra a un administrador que ya encontraba como clietne 
     *
     * @param documento
     * @return
     * @throws Exception
     */
    public boolean registroAdminCliente(String documento,float valor) throws Exception {
        dto.Persona dto = new Persona();
        dto.setDocumento(documento);
        dto.setTipo("cliente");
        dto.setSaldo_limite(valor);
        dao.PersonaDAO dao = new PersonaDAO();
        return dao.registrarAdminCliente(dto);
    }
    
    /**
     * metodo que registra a un cliente que  ya encontraba como administrador
     * @param documento
     * @return
     * @throws Exception 
     */
    public boolean registrarClienteAdmin(String documento)throws Exception{
     dto.Persona dto = new Persona();
        dto.setDocumento(documento);
        dto.setTipo("administrador");
        dao.PersonaDAO dao = new PersonaDAO();
        return dao.registrarDocumentoTipoFinal(dto);
    }

    /**
     * registra un cliente en el sistema
     *
     * @param documento
     * @param nombre
     * @param apellido
     * @param email
     * @param password
     * @param direccion
     * @param tipo
     * @param saldo_limite
     * @return
     * @throws Exception
     */
    public String registrarCliente(String documento, String nombre, String apellido, String email, String password, String direccion, String tipo, double saldo_limite,String telefono) throws Exception {

        dto.Persona dto = new Persona();
        dao.PersonaDAO dao = new dao.PersonaDAO();
        dto.setDocumento(documento);
        dto.setNombre(nombre);
        dto.setApellido(apellido);
        dto.setEmail(email);
        dto.setPassword(util.SHA1.getHash(password));
        dto.setDireccion(direccion);
        dto.setTipo(tipo);
        dto.setSaldo_limite(saldo_limite);
        dto.setTelefono(telefono);
        return dao.registrarPersonal(dto);
    }

    /**
     * Registrar un Administrador en el sistema
     *
     * @param documento
     * @param nombre
     * @param apellido
     * @param email
     * @param password
     * @param direccion
     * @param tipo
     * @return
     * @throws Exception
     */
    public String registrarAdministrador(String documento, String nombre, String apellido, String email, String password, String direccion, String tipo,String telefono) throws Exception {
        dto.Persona dto = new Persona();
        dao.PersonaDAO dao = new PersonaDAO();
        dto.setDocumento(documento);
        dto.setNombre(nombre);
        dto.setApellido(apellido);
        dto.setEmail(email);
        dto.setPassword(util.SHA1.getHash(password));
        dto.setDireccion(direccion);
        dto.setTipo(tipo);
        dto.setTelefono(telefono);
        return dao.registrarPersonal(dto);

    }

    /**
     * actualiza la informacion de un cliente
     *
     * @param documento
     * @param nombre
     * @param apellido
     * @param email
     * @param password
     * @param direccion
     * @param saldo_limite
     */
    public boolean actualizarCliente(String documento, String nombre, String apellido, String email, String password, String direccion, double saldo_limite,String telefono) throws Exception {
        dto.Persona dto = new Persona();
        dto.setDocumento(documento);
        dto.setNombre(nombre);
        dto.setApellido(apellido);
        dto.setEmail(email);
        if (!password.equals("")) {
            dto.setPassword(util.SHA1.getHash(password));
        }
        dto.setDireccion(direccion);
        dto.setTelefono(telefono);
        dto.setSaldo_limite(saldo_limite);
        dao.PersonaDAO dao = new PersonaDAO();
        return dao.actualizar(dto);

    }

    /**
     * actualiza la informacion de un administrador
     *
     * @param documento
     * @param nombre
     * @param apellido
     * @param email
     * @param password
     * @param direccion
     * @return
     * @throws Exception
     */
    public boolean actualizarAdministrador(String documento, String nombre, String apellido, String email, String password, String direccion,String telefono) throws Exception {
        dto.Persona dto = new Persona();
        dto.setDocumento(documento);
        dto.setNombre(nombre);
        dto.setApellido(apellido);
        dto.setEmail(email);
        if (!password.equals("")) {
            dto.setPassword(util.SHA1.getHash(password));
        }
        dto.setDireccion(direccion);
        dto.setTelefono(telefono);
        dao.PersonaDAO dao = new PersonaDAO();
        return dao.actualizar(dto);
    }

    /**
     * retorna el personal con el documento registrado se debe tener en cuenta
     * que se retorna todos los datos.
     *
     * @param documento
     * @return
     */
    public Persona consultarPersonal(String documento) throws Exception {
        dto.Persona dto = new Persona();
        dto.setDocumento(documento);
        dao.PersonaDAO dao = new PersonaDAO();
        return dao.get(dto);
    }

    /**
     * retorna una lista de todos los cliente registrados en el sistema
     *
     * @return
     * @throws Exception
     */
    public ArrayList<Persona> listarClientes() throws Exception {
        dto.Persona dto = new Persona();
        dto.setTipo("cliente");
        dao.PersonaDAO dao = new PersonaDAO();
        return dao.getUsuario(dto);
    }

    /**
     * retorna una lista de todos los administradores registrados en el sistema
     *
     * @return
     * @throws Exception
     */
    public ArrayList<Persona> listarAdministradores() throws Exception {
        dto.Persona dto = new Persona();
        dto.setTipo("administrador");
        dao.PersonaDAO dao = new PersonaDAO();
        return dao.getUsuario(dto);
    }
}
