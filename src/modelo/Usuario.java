package modelo;

import java.util.ArrayList;

public class Usuario {
	
	private String nombre;
	private String password;
	private Imagen imagenPerfil;
	private String rol;
	
	private ArrayList <Imagen> imagenes;
	
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	public Imagen getImagenPerfil() {
		return imagenPerfil;
	}
	public void setImagenPerfil(Imagen imagenPerfil) {
		this.imagenPerfil = imagenPerfil;
	}
	public ArrayList<Imagen> getImagenes() {
		return imagenes;
	}
	public void setImagenes(ArrayList<Imagen> imagenes) {
		this.imagenes = imagenes;
	}

	
	
	
	
}
