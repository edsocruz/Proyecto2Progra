package clases;
public class Comentario {
       private int id;
    private String descripcion;
    private Usuario usuario;

    public Comentario() {
        id = 0;
        descripcion = "";
        usuario = new Usuario();
    }

    public Comentario(int id, String descripcion, Usuario usuario) {
        this.id = id;
        this.descripcion = descripcion;
        this.usuario = usuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
 
}
