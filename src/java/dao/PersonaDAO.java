package dao;

import dto.Persona;
import interfaces.IDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import util.Conexion;

/**
 * @author Freddhy
 * @version 1.0
 * @created 17-oct-2015 NOTA: Carlos torres. son los metodos publicos los unicos
 * que abren y cierran conexion los metodos privados no abren ni cierran
 * conexion esto se hace con el fin de que la conexion NO se haga lenta cuando
 * tengamos la base de datos remota.
 */
public class PersonaDAO implements IDAO<Persona> {

    private Connection con = null;

    public PersonaDAO() {

    }

    /**
     * registra usuarios en la base de datos true registro existoso , false
     * errores en el registro
     *
     * @param obj
     * @return
     * @throws Exception
     */
    @Override
    public boolean registrar(Persona obj) throws Exception {
        return false;

    }

    /**
     * registra un usuario en la base de datos retorna S: registro exitoso
     * retorna N: ya existe usuario retorna O: el usuario ya se encuentra
     * registrado con otro tipo
     *
     * @param obj
     * @return
     * @throws Exception
     */
    public String registrarPersonal(Persona obj) throws Exception {
        con = Conexion.crearConexion();
        String msg = "";
        con.setAutoCommit(false);

        try {
            if (this.validarDocumento(obj)) {
                if (this.validarDocumentoTipo(obj)) {
                    msg = "N";
                } else {
                    msg = "O";
                }
            } else {

                boolean x = this.registrarUsuario(obj);
                boolean y = this.registrarDocumentoTipo(obj);

                if (y & x) {
                    msg = "S";
                } else {
                    msg = "N";
                }
            }
            con.commit();
        } catch (SQLException ex) {
            con.rollback();
            System.out.print(ex.toString());
            throw ex;
        } finally {
            if (con != null) {
                con.close();
            }
            return msg;
        }
    }

    /**
     * registra un usuario de otro tipo en el sistema es decir si es cliente lo
     * registra igual como administrador y viceversa
     *
     * @param obj
     * @return
     * @throws Exception
     */
    public boolean registrarDocumentoTipoFinal(Persona obj) throws Exception {
        con = Conexion.crearConexion();

        try {
            return this.registrarDocumentoTipo(obj);
        } catch (SQLException ex) {
            throw ex;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * Permite validar un usuario por su número de documento y so password,
     * método para el inicio de session
     *
     * @param p Persona
     * @return usuario Persona
     * @throws Exception
     */
    public Persona validarUsuario(Persona p) throws Exception {

        Persona usuario = null;
        con = Conexion.crearConexion();
        if (this.validarDocumentoTipo(p)) {

            try {
                String sql = "SELECT documento,nombre,apellido,email,saldo_limite,direccion FROM `persona` WHERE documento=? and password=? limit 1";

                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, p.getDocumento());
                stm.setString(2, p.getPassword());
                ResultSet rs = stm.executeQuery();

                if (rs.next()) {

                    usuario = new Persona();
                    usuario.setDocumento(rs.getString(1));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setEmail(rs.getString(4));
                    usuario.setSaldo_limite(rs.getDouble(5));
                    usuario.setDireccion(rs.getString(6));
                    usuario.setTipo(p.getTipo());
                }
                stm.close();
                rs.close();
            } catch (SQLException ex) {
                System.out.println(ex.toString());
                throw ex;
            } finally {
                if (con != null) {
                    con.close();
                }
            }

        }

        return usuario;
    }

    /**
     * registra un usuario en la base de datos true si el registro es exitoso ,
     * false si hay errores NOTA : este metodo no abre ni cierra conexion toma
     * como condicion que antes haya abierta una conexion ya que es un metodo
     * privado
     *
     * @param obj
     * @return
     * @throws Exception
     */
    private boolean registrarUsuario(Persona obj) throws Exception {

        PreparedStatement stmt = null;
        boolean exito = false;

        stmt = con.prepareStatement("INSERT INTO persona ( documento,nombre,apellido,email,direccion,password,saldo_limite,telefono) values (?, ?, ?,?,?,?,?,?)");

        stmt.setString(1, obj.getDocumento());
        stmt.setString(2, obj.getNombre());
        stmt.setString(3, obj.getApellido());
        stmt.setString(4, obj.getEmail());
        stmt.setString(5, obj.getDireccion());
        stmt.setString(6, obj.getPassword());
        stmt.setDouble(7, obj.getSaldo_limite());
        stmt.setString(8, obj.getTelefono());

        int total = stmt.executeUpdate();

        if (total > 0) {

            exito = true;
        }

        stmt.close();
        return exito;
    }

    /**
     * registra un documento y un tipo de usuario true si el registro es
     * exitoso, false si existe un error NOTA : este metodo no abre ni cierra
     * conexion toma como condicion que antes haya abierta una conexion ya que
     * es un metodo privado
     *
     * @param obj
     * @return
     * @throws SQLException
     */
    private boolean registrarDocumentoTipo(Persona obj) throws SQLException {

        PreparedStatement stmt = null;
        boolean exito = false;
        stmt = con.prepareStatement("INSERT INTO tipo_usuario_persona (tipo,documento,fecha) values (?,?,?)");
        stmt.setString(1, obj.getTipo());
        stmt.setString(2, obj.getDocumento());
        stmt.setDate(3, new java.sql.Date(new Date().getTime()));
        int total = stmt.executeUpdate();
        if (total > 0) {
            exito = true;
        }
        stmt.close();

        return exito;
    }

    /**
     * valida si un determinado documento y un tipo de usuario e encuentran en
     * la base de datos true si se encuentra ; false si no se encuentra NOTA :
     * este metodo no abre ni cierra conexion toma como condicion que antes haya
     * abierta una conexion ya que es un metodo privado
     *
     * @param dto
     * @return
     * @throws SQLException
     * @throws Exception
     */
    private boolean validarDocumentoTipo(Persona dto) throws SQLException, Exception {
        boolean exito = false;
        String sql = "SELECT tipo,documento FROM tipo_usuario_persona where documento=? and tipo =?  limit 1";
        PreparedStatement str;
        str = con.prepareStatement(sql);
        str.setString(1, dto.getDocumento());
        str.setString(2, dto.getTipo());
        ResultSet rs = str.executeQuery();
        while (rs.next()) {
            exito = true;
        }
        str.close();
        rs.close();
        return exito;
    }

    /**
     * valida que si un determinado documento de un usuario se encuentra en la
     * base de datos true= existe ; false=no existe
     *
     * @param dto
     * @return
     * @throws Exception
     */
    private boolean validarDocumento(Persona dto) throws Exception {
        boolean exito = false;
        String sql = "SELECT tipo,documento FROM tipo_usuario_persona where documento=?";
        PreparedStatement str;
        str = con.prepareStatement(sql);
        str.setString(1, dto.getDocumento());
        ResultSet rs = str.executeQuery();

        while (rs.next()) {

            exito = true;
        }
        str.close();
        rs.close();
        return exito;
    }

    /**
     *
     * @param pk
     * @return
     */
    @Override
    public boolean eliminar(Object pk) throws Exception {

        return false;
    }

    /**
     *
     * @param obj
     * @return
     */
    @Override
    public boolean actualizar(Persona obj) throws Exception {
        boolean rta = false;

        con = Conexion.crearConexion();
        PreparedStatement stmt = null;
        try {

            if (!obj.getPassword().equals("")) {

                stmt = con.prepareStatement("update persona set nombre=?, apellido=?, email=?, direccion=?, password=?, saldo_limite=?,telefono=? where documento=?");
                stmt.setString(1, obj.getNombre());
                stmt.setString(2, obj.getApellido());
                stmt.setString(3, obj.getEmail());
                stmt.setString(4, obj.getDireccion());
                stmt.setString(5, obj.getPassword());
                stmt.setDouble(6, obj.getSaldo_limite());
                stmt.setString(7, obj.getTelefono());
                stmt.setString(8, obj.getDocumento());
            } else {
                stmt = con.prepareStatement("update persona set nombre=?, apellido=?, email=?, direccion=?, saldo_limite=?,telefono=? where documento=?");
                stmt.setString(1, obj.getNombre());
                stmt.setString(2, obj.getApellido());
                stmt.setString(3, obj.getEmail());
                stmt.setString(4, obj.getDireccion());
                stmt.setDouble(5, obj.getSaldo_limite());
                stmt.setString(6, obj.getTelefono());
                stmt.setString(7, obj.getDocumento());
            }

            int total = stmt.executeUpdate();
            if (total > 0) {
                rta = true;
            }
            stmt.close();

        } catch (SQLException ex) {

            throw ex;
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return rta;
    }

    /**
     * retorna un determinado usuario del sistema
     *
     * @param pk
     * @return
     */
    @Override
    public Persona get(Object pk) throws Exception {
        Persona usuario = null;
        Persona p = (Persona) pk;
        con = Conexion.crearConexion();

        try {
            String sql = "SELECT documento,nombre,apellido,email,saldo_limite,direccion,telefono FROM `persona` WHERE documento=?  limit 1";

            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, p.getDocumento());

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {

                usuario = new Persona();
                usuario.setDocumento(rs.getString(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setEmail(rs.getString(4));
                usuario.setSaldo_limite(rs.getDouble(5));
                usuario.setDireccion(rs.getString(6));
                usuario.setTelefono(rs.getString(7));

            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            throw ex;
        } finally {
            if (con != null) {
                con.close();
            }
        }

        return usuario;

    }

    /**
     *
     * @return
     */
    @Override
    public List<Persona> getAll() throws Exception {

        return null;
    }

    /**
     *
     * @return
     */
    @Override
    public int count() throws Exception {

        return 0;
    }

    /**
     * retorna una lista de los usuario en base a un tipo de usuario
     *
     * @return
     */
    public ArrayList<Persona> getUsuario(Persona dto) throws Exception {
        Persona usuario = null;
        ArrayList<Persona> lista = new ArrayList();
        con = Conexion.crearConexion();

        try {
            String sql = "SELECT persona.documento,persona.nombre,persona.apellido,persona.email,persona.saldo_limite,persona.direccion,persona.telefono FROM persona join tipo_usuario_persona  on persona.documento=tipo_usuario_persona.documento  where tipo_usuario_persona.tipo=? ";

            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, dto.getTipo());
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                usuario = new Persona();
                usuario.setDocumento(rs.getString(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setEmail(rs.getString(4));
                usuario.setSaldo_limite(rs.getDouble(5));
                usuario.setDireccion(rs.getString(6));
                usuario.setTipo(dto.getTipo());
                usuario.setTelefono(rs.getString(7));
                lista.add(usuario);
            }
            stm.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            throw ex;
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return lista;
    }

    /**
     * metodo que registra a un administrador como cliente modificando el
     * registro de sueldo_limite
     *
     * @param dto
     * @return
     * @throws Exception
     */
    public boolean registrarAdminCliente(Persona dto) throws Exception {

        boolean rta = false;

        con = Conexion.crearConexion();
        PreparedStatement stmt = null;
        try {
            con.setAutoCommit(false);
            if (this.registrarDocumentoTipo(dto)) {

                stmt = con.prepareStatement("update persona set saldo_limite=? where documento=?");
                stmt.setDouble(1, dto.getSaldo_limite());
                stmt.setString(2, dto.getDocumento());

                int total = stmt.executeUpdate();
                if (total > 0) {
                    rta = true;
                }
                stmt.close();
            }
            con.commit();

        } catch (SQLException ex) {
            con.rollback();
            throw ex;
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return rta;
    }

}
