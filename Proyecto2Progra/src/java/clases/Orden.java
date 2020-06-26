
package clases;

import java.util.ArrayList;
import java.util.Date;

public class Orden {

    public Orden(Date fecha, String estado, int idOrden, ArrayList<Pizza> listaPizzas, ArrayList<Producto> listaProductos) {
        this.fecha = fecha;
        this.estado = estado;
        this.idOrden = idOrden;
        this.listaPizzas = listaPizzas;
        this.listaProductos = listaProductos;
    }
     public Orden() {
        this.fecha = new Date();
        this.estado = "";
        this.idOrden = 0;
        this.listaPizzas = new ArrayList<>();
        this.listaProductos = new ArrayList<>();
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public ArrayList<Pizza> getListaPizzas() {
        return listaPizzas;
    }

    public void setListaPizzas(ArrayList<Pizza> listaPizzas) {
        this.listaPizzas = listaPizzas;
    }

    public ArrayList<Producto> getListaProductos() {
        return listaProductos;
    }

    public void setListaProductos(ArrayList<Producto> listaProductos) {
        this.listaProductos = listaProductos;
    }

   
    
    private Date fecha;
    private String estado;
    private int idOrden;
    private ArrayList<Pizza> listaPizzas;
    private ArrayList<Producto> listaProductos;
}
