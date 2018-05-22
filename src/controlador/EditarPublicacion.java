package controlador;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clase.Etiqueta;
import clase.Publicacion;
import clase.Usuario;
import modelo.PublicacionModelo;
import modelo.UsuarioModelo;

public class EditarPublicacion {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
		String idPubli = request.getParameter("id");

		Usuario u = (Usuario) session.getAttribute("iniciado");
		if (u != null) {
			UsuarioModelo usuarioModelo = new UsuarioModelo();

			PublicacionModelo publicacionModelo = new PublicacionModelo();
			Publicacion publicacion = publicacionModelo.select(idPubli);
			request.setAttribute("publicacion", publicacion);
			
			String lineaEtiquetas= "";
			for(Etiqueta etiqueta : publicacion.getEtiquetas()){
				lineaEtiquetas=lineaEtiquetas+", "+etiqueta.getNombre();
			}
			request.setAttribute("lineaEtiquetas", lineaEtiquetas);
			

			// guardar en variable para enviar

			// redirijir a la pagina con la variable creada
			RequestDispatcher rd = request.getRequestDispatcher("editar_publicacion.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}

	}
}
