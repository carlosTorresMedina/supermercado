
package interfaces;

import java.util.List;

/**
 *
 * @author freddhy
 */
public interface IDAO <T> {
    
    public boolean registrar(T obj) throws Exception;
    
    public boolean eliminar(Object pk) throws Exception;;
    
    public boolean actualizar(T obj)throws Exception;;
    
    public T get(Object pk)throws Exception;;
    
    public List<T> getAll()throws Exception;;
    
    public int count()throws Exception;;
}
