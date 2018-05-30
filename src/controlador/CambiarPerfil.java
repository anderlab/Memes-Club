package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clase.Publicacion;
import clase.Usuario;
import modelo.PublicacionModelo;
import modelo.UsuarioModelo;

/**
 * Servlet implementation class EditarPerfil
 */
@WebServlet("/EditarPerfil")
public class CambiarPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambiarPerfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();

		Usuario usuario = (Usuario) session.getAttribute("iniciado");
		if (usuario != null) {
			
			String passwordN= (String) request.getAttribute("passwordN");
			String emailN= (String) request.getParameter("emailN");
			UsuarioModelo usuarioModelo = new UsuarioModelo();
			
			usuario.setPassword(passwordN);
			usuario.setEmail(emailN);
			
			
			usuarioModelo.update(usuario);
		
	
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}

	}
		
		

}
