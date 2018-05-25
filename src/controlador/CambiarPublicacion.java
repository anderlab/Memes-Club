package controlador;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clase.Categoria;
import clase.CategoriaPublicacion;
import clase.Publicacion;
import clase.Usuario;
import modelo.CatPubliModelo;
import modelo.CategoriaModelo;
import modelo.PublicacionModelo;

public class CambiarPublicacion extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String idPubli = request.getParameter("id");
		String tituloNuevo=request.getParameter("tituloNuevo");
		String categoriasNuevas[]=request.getParameterValues("categoriasNuevas");
		
		
		CategoriaModelo categoriaModelo= new CategoriaModelo();
		
		PublicacionModelo publicacionModelo = new PublicacionModelo();
		Publicacion publicacion = publicacionModelo.select(idPubli);

		Usuario usuario = (Usuario) session.getAttribute("iniciado");
		

		if (usuario != null ) {
			
			if(usuario.getNombre().equals(publicacion.getUsuario().getNombre())){
			publicacion.setTitulo(tituloNuevo);	
			publicacionModelo.updateTitulo(publicacion);
			
			
			CatPubliModelo catPubliModelo=new CatPubliModelo();
			CategoriaPublicacion categoriaPublicacion =new CategoriaPublicacion();
			
			catPubliModelo.deletePorPublicacion(publicacion);
			categoriaPublicacion.setPublicacion(publicacion);
			
			
			for (int i =0; i<categoriasNuevas.length;i++){
				
				Categoria cat = categoriaModelo.selectPorNombre(categoriasNuevas[i]);
				categoriaPublicacion.setCategoria(cat);
				catPubliModelo.insert(categoriaPublicacion);

			}

			
		

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}

	}
	
	}
	
	
}
