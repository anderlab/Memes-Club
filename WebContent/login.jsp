<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.UsuarioModelo"%>
<%@page import="clase.Usuario"%>
    
<%
	String nombre = request.getParameter("usuario");
	String password = request.getParameter("password");
	String idPub= request.getParameter("idPub");

	UsuarioModelo usuarioModelo = new UsuarioModelo();
	Usuario usuario = usuarioModelo.get(nombre, password);

	if (usuario != null) {
		
		session.setAttribute("iniciado", usuario);//"si"
		if(idPub==null){
		response.sendRedirect("index.jsp");
		}else{
			response.sendRedirect("publicacion.jsp?id="+idPub);
		}
	} else {
		response.sendRedirect("loginForm.jsp?error=true");
	}
%>