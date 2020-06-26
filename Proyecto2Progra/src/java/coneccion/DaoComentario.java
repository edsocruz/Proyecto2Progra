
package coneccion;
import clases.Comentario;
import clases.Usuario;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoComentario {
    
    
      public static void insertarComentario(Comentario cm, Connection conn) {
        try (PreparedStatement stm = conn.prepareStatement(IMEC_Usuario.INSERTARCOMENTARIO.obtenerComando());) {
            stm.clearParameters();
            stm.setString(1, String.valueOf(cm.getDescripcion()));
            stm.setString(2, String.valueOf(cm.getUsuario().getId() ));
            stm.executeUpdate(); 
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }    
    
   public static ArrayList<Comentario> obtenerListaComentarios(Connection cnx) {
         ArrayList<Comentario> lista = new ArrayList<>();
        try (PreparedStatement stm = cnx.prepareStatement(IMEC_Usuario.LISTARCOMENTARIOS.obtenerComando());) {
            stm.clearParameters();
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                  Comentario  r = (new Comentario(
                          rs.getInt("id_comentario"),
                          rs.getString("descripcion"),
                          new Usuario(rs.getString("nombre"), rs.getString("apellido1")))
                  );
                  lista.add(r);
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return lista;
    }
}
