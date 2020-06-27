
package coneccion;

import clases.Ingrediente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoRelacionPizzaIngrediente {
     public static ArrayList<Ingrediente> obtenerIngredientePizza(String id, Connection cnx) {
        ArrayList<Ingrediente> r = new ArrayList<>();
        try (PreparedStatement stm = cnx.prepareStatement(IMEC_Usuario.LISTARINGREDIENTESPIZZA.obtenerComando());) {
            stm.clearParameters();
             stm.setString(1, id);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    r.add(getIngredientePizza(rs, cnx));
                }
                for(int i = 0; i < r.size(); i++){
                    Ingrediente o = r.get(i);
                    Ingrediente p = DaoIngrediente.obtenerIngrediente(String.valueOf(o.getIdIng()), cnx);
                   r.set(i, p);
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return r;
    }
     public static Ingrediente getIngredientePizza(ResultSet rs, Connection conn) {
        Ingrediente c = new Ingrediente();
        try {
            c.setIdIng(rs.getInt("ingrediente"));
        } catch (SQLException ex) {

        }
        return c;
    }
    public static boolean agregarIngrediente(String id,Ingrediente ingrediente, Connection cnx) {

        try (PreparedStatement stm = cnx.prepareStatement(IMEC_Usuario.INSERTARPIZZAINGREDIENTE.obtenerComando());) {
            stm.clearParameters();
            stm.setString(1, id);
            stm.setString(2, String.valueOf(ingrediente.getIdIng()));
            stm.executeUpdate();            
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    } 
    
    public static void eliminarIngrediente(int id, Connection cnx) {
        try (PreparedStatement stm = cnx.prepareStatement(IMEC_Usuario.EXCLUIRPIZZAINGREDIENTE.obtenerComando());) {
            stm.clearParameters();
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
     
}
