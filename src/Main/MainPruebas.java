package Main;

import java.util.ArrayList;
import java.util.Iterator;

import clase.Categoria;
import clase.Publicacion;
import clase.Usuario;
import modelo.CatPubliModelo;
import modelo.CategoriaModelo;
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
	
		
		/*PublicacionModelo publicacionModelo=new PublicacionModelo();
    ArrayList<Publicacion> ultimasPublicaciones=publicacionModelo.selectUltimasPublicaciones();
    Iterator<Publicacion> i=ultimasPublicaciones.iterator();
	while(i.hasNext()){
		Publicacion publicacion=i.next();
		System.out.println(publicacion.getVotosPositivos().size());
	
	}
	*/
		
		/*CatPubliModelo catPubliModelo=new CatPubliModelo();
		ArrayList<Publicacion> publicaciones=catPubliModelo.selectPubliPorCat(1);
		System.out.println("jaja");
		publicaciones.add(null);**/
		
		CategoriaModelo categoriaModelo=new CategoriaModelo();
		Categoria categoria=categoriaModelo.selectCatConPubli("Humor");
		ArrayList<Publicacion> publicaciones = categoria.getPublicaciones();
		publicaciones.add(null);
		
	}

}
