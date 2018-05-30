<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="clase.Usuario"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%	
   Usuario usuario= null;
   
   Object u = session.getAttribute("iniciado");
	if (u != null) {
	 usuario = (Usuario) u;
	} %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Perfil</title>
</head>
<body>



	<form role="form" action="CambiarPerfil" method="post">
	  <div class="form-group">
	    <label for="email">Nuevo Email</label>
	     <input type="email" placeholder="<%=usuario.getEmail()%>" name="emailN">>
	  </div>
	  <div class="form-group">
	    <label for="pwd">Nueva Contraseña:</label>
	    <input type="password" placeholder="**********" name="passwordN">
	  </div>
	  <button type="submit" class="btn btn-default" name="cambiar">Cambiar</button>
	</form>

</body>
</html>









