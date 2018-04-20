package Clases;

import java.util.ArrayList;
import java.util.Date;

public class Publicacion {
	
	private String id;
	private String titulo;
	private Date fecha_subida;
	private Usuario usuario;
	
	private ArrayList <Categoria> categorias;
	private ArrayList <Etiqueta> etiquetas;
	
	
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public Date getFecha_subida() {
		return fecha_subida;
	}
	public void setFecha_subida(Date fecha_subida) {
		this.fecha_subida = fecha_subida;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public ArrayList<Categoria> getCategorias() {
		return categorias;
	}
	public void setCategorias(ArrayList<Categoria> categorias) {
		this.categorias = categorias;
	}
	public ArrayList<Etiqueta> getEtiquetas() {
		return etiquetas;
	}
	public void setEtiquetas(ArrayList<Etiqueta> etiquetas) {
		this.etiquetas = etiquetas;
	}
	
	
	

}
