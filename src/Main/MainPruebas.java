package Main;

import clase.Usuario;
import modelo.UsuarioModelo;

public class MainPruebas {

	public static void main(String[] args) {
		
		Usuario usuario= new Usuario();
		UsuarioModelo um= new UsuarioModelo();
		
		usuario.setNombre("usuario2");
		usuario.setPassword("salu5");
		usuario.setRol("usuarioMindundi");
		
		
		
	um.insert(usuario);
		

	
		

	}

}
