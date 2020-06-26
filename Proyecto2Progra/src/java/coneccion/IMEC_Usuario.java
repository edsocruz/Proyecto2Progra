
package coneccion;


public enum IMEC_Usuario {
    
    EXCLUIRPIZZA("DELETE FROM pizza WHERE  ID=?;"),
    EXCLUIRPIZZAINGREDIENTE("DELETE FROM relacion_pizza_ingredientes WHERE  pizza=?;"),
    CONSULTAR("SELECT id, tipo, password, nombre, apellido1, apellido2, direccion, telefono FROM usuario WHERE password=? AND id=?;"),
    LISTAR("SELECT id, fecha, estado, usuario FROM orden WHERE usuario=?; "),
    LISTARPIZZA("SELECT ID, nombre, precio FROM pizza WHERE ID=?; "),
    INSERTARPIZZA("INSERT INTO pizza(ID, nombre, precio) VALUES(?,?,?); "),
    INSERTARPIZZAINGREDIENTE("INSERT INTO relacion_pizza_ingredientes(pizza, ingrediente) VALUES(?,?); "),
    LISTARPIZZAS("SELECT ID, nombre, precio FROM pizza; "),
    CONSULTARPRODUCTO("SELECT ID, nombre, precio, descripcion FROM producto WHERE ID=?; "),
    CONSULTARING("SELECT ID, nombre, precio FROM ingredientes WHERE ID=?; "),
    LISTARING("SELECT ID, nombre, precio FROM ingredientes;"),
    LISTARPIZZAORDEN("SELECT orden, pizza, cantidad, tamano FROM relacion_pizza_orden WHERE orden=?; "),
    LISTARPRODUCTOORDEN("SELECT orden, cantidad, producto FROM relacion_producto_orden WHERE orden=?; "),
    LISTARINGREDIENTESPIZZA("SELECT pizza, ingrediente FROM relacion_pizza_ingredientes WHERE pizza=?; "),
    LISTARINGREDIENTESADICIONALES("SELECT pizza, ingrediente, orden FROM adicionales WHERE pizza=? AND orden = ?; "),
    INSERTARUSUARIO("INSERT INTO usuario(id, tipo, password, nombre, apellido1, apellido2, direccion, telefono) VALUES(?,?,?,?,?,?,?,?); "),
    MODIFICARUSUARIO("UPDATE  usuario SET password=?, direccion=?, telefono=? WHERE id=?;"),
    INSERTARCOMENTARIO("INSERT INTO comentario (descripcion, usuario_coment_id) values (?,?); "),
    LISTARCOMENTARIOS ( "SELECT id_comentario, descripcion, nombre, apellidos from comentario, usuario where id=usuario_coment_id; ");

    IMEC_Usuario(String comando) {
        this.comando = comando;
    }

    public String obtenerComando() {
        return comando;
    }

    private final String comando;
}
