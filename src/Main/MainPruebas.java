package Main;

import Clases.Usuario;
import modelo.UsuarioModelo;

public class MainPruebas {

	public static void main(String[] args) {
		
		Usuario usuario= new Usuario();
		UsuarioModelo um= new UsuarioModelo();
		
		usuario.setNombre("Leerooyy");
		usuario.setPassword("salu3");
		usuario.setRol("elputoamo");
		
		
		
		um.update(usuario);
		

	
		

	}

}
