<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="java.util.List"%>
<%@ page import="modelo.*"%>
<%@ page import="Clases.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Crear Usuario</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"></script>
<style type="text/css">
.estaVacio {
	background-color: #F08080;
}
</style>
</head>
<body>


	<%
		String nombreClass = "noEstaVacio";
		String passwordClass = "noEstaVacio";
		String emailClass = "noEstaVacio";
		String nombre = request.getParameter("nombre");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		if (nombre == null || password == null || email == null || nombre == "" || password == "" || email == "") {

			if (nombre == "" && password == "" && email == "") {
				nombreClass = "estaVacio";
				passwordClass = "estaVacio";
				emailClass = "estaVacio";
	%>

	<div class="alert alert-danger">
		<span class="glyphicon glyphicon-exclamation-sign"></span> <span
			class="sr-only">Error:</span> Te faltan todos los parametros
	</div>


	<%
		} else if (nombre == "") {
				nombreClass = "estaVacio";
	%>
	<div class="alert alert-danger">
		<span class="glyphicon glyphicon-exclamation-sign"></span> <span
			class="sr-only ">Error:</span> Te falta el Nombre
	</div>


	<%
		} else if (password == "") {
				passwordClass = "estaVacio";
	%>
	<div class="alert alert-danger">
		<span class="glyphicon glyphicon-exclamation-sign"></span> <span
			class="sr-only">Error:</span> Te falta la contraseņa
	</div>



	<%
		} else if (email == "") {
				emailClass = "estaVacio";
	%>
	<div class="alert alert-danger">
		<span class="glyphicon glyphicon-exclamation-sign"></span> <span
			class="sr-only">Error:</span> Te falta el email
	</div>
	<%
		}
	%>
	<form action="#" method="post">
		<div class="form-group">
			<label for="nombre">Nombre Usuario:</label> <input type="text"
				class="form-control <%=nombreClass%>" id="nombre" name="nombre">
		</div>
		<div class="form-group">
			<label for="password">Contraseņa:</label> <input type="password"
				class="form-control <%=passwordClass%>" id="password"
				name="password">
		</div>

		<div class="form-group">
			<label for="email"> Email:</label> <input type="email"
				class="form-control <%=emailClass%>" id="email" name="email">
		</div>
		<button type="submit" name="guardar" class="btn btn-default">Guardar</button>
	</form>

	<%
		} else {
			Usuario usuario = new Usuario();

			usuario.setNombre(nombre);
			usuario.setPassword(password);
			usuario.setEmail(email);
			usuario.setRol("usuario");

			UsuarioModelo um = new UsuarioModelo();

			if (um.select(nombre) == null) {
				um.insert(usuario);
				out.print(
						"	<div class='alert alert-success'> <span class='glyphicon glyphicon-ok'></span> <span class='sr-only'></span> USUARIO CREADO</div>");
			} else {
				
				
	%>

	<div class="alert alert-danger">
		<span class="glyphicon glyphicon-exclamation-sign"></span> <span
			class="sr-only">Error:</span> Ese usuario ya EXISTE
	</div>

	<%
	response.sendRedirect("crearUsuario.jsp"); // esto esta mal jeje salu3
		}

		}
	%>



	<a href="gestorUsuarios.jsp">Ir a la lista</a>
	<br>


</body>
</html>

