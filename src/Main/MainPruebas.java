package Main;

import java.util.ArrayList;
import java.util.Iterator;

import clase.Publicacion;
import clase.Usuario;
import modelo.PublicacionModelo;
import modelo.UsuarioModelo;

public class MainPruebas {

	public static void main(String[] args) {
		/*
		Usuario usuario= new Usuario();
		UsuarioModelo um= new UsuarioModelo();
		
		usuario.setNombre("usuario2");
		usuario.setPassword("salu5");
		usuario.setRol("usuarioMindundi");
		
		
		
	um.insert(usuario);
		
	*/
		PublicacionModelo publicacionModelo=new PublicacionModelo();
    ArrayList<Publicacion> ultimasPublicaciones=publicacionModelo.selectUltimasPublicaciones();
    Iterator<Publicacion> i=ultimasPublicaciones.iterator();
	while(i.hasNext()){
		Publicacion publicacion=i.next();
		System.out.println(publicacion.getVotosPositivos().size());
	
	}
	}

}
