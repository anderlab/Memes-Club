package clase;

import java.util.Date;

public class Comentario {
	
	private int id;
	private String autor;
	private Publicacion imagen;
	private String texto;
	private Date fecha;
	private int respuesta;
	
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAutor() {
		return autor;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	public Publicacion getImagen() {
		return imagen;
	}
	public void setImagen(Publicacion imagen) {
		this.imagen = imagen;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public int getRespuesta() {
		return respuesta;
	}
	public void setRespuesta(int respuesta) {
		this.respuesta = respuesta;
	}
	
	
	

	
	

}
