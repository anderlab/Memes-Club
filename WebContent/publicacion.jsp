<%@page import="modelo.EtiquetaModelo"%>
<%@page import="clase.Categoria"%>
<%@page import="modelo.CategoriaModelo"%>
<%@page import="clase.Etiqueta"%>
<%@page import="clase.EtiquetaPublicacion"%>
<%@page import="clase.VotoPublicacion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PublicacionModelo"%>
<%@page import="clase.Publicacion"%>
<%@page import="clase.Comentario"%>
<%@page import="modelo.ComentarioModelo"%>
<%@page import="clase.Usuario"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	Usuario usuario = null;
	Object u = session.getAttribute("iniciado");

	String id = request.getParameter("id");


	if (id == null) {
		response.sendRedirect("index.jsp");

	} else {
		PublicacionModelo publicacionModelo = new PublicacionModelo();
		Publicacion publicacion = publicacionModelo.select(id);
		
		if (u != null) {
			usuario = (Usuario) u;
		}

		String texto = request.getParameter("comentario");
		
		if (texto != null && usuario != null) {
			Comentario comentario = new Comentario();
			
			comentario.setTexto(texto);
			comentario.setAutor(usuario);
			comentario.setPublicacion(publicacion);
			
			ComentarioModelo cm = new ComentarioModelo();
			
			/* comentario.setRespuestas(cm.selectDeRespuestas(comentario.getId())); //?? */
			cm.insert(comentario);

		}

	
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.pb-cmnt-textarea {
	resize: none;
	padding: 20px;
	height: 130px;
	width: 100%;
	border: 1px solid #F2F2F2;
}
</style>
<title>Memes Club</title>

<!-- Bootstrap core CSS -->


<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">IMAGEN</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Mejores</a></li>
				<li><a href="#">Ultimos</a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">

				<%
					if (u != null) {
							usuario = (Usuario) u;
							if (usuario.getRol().equals("usuario") || usuario.getRol().equals("admin")) {
								out.print("<li class='dropdown'>");
								out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>" + usuario.getNombre());
				%>
				<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">

					<li><a href="logout.jsp">Cerrar Sesion</a></li>
				</ul>
				</li>
				<%
					}
						} else {
							out.print(" <li><a href='loginForm.jsp?idPub=" + id
									+ "'><span class='glyphicon glyphicon-user'></span> Iniciar Sesion</a></li>");
							out.print(" <li><a href='#'><span class='glyphicon glyphicon-user'></span> Registrarse</a></li>");
						}
				%>

			</ul>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<!-- Blog Post -->
				<div class="card mb-4">

					<div class="card-body">
						<h2 class="card-title"><%=publicacion.getTitulo()%></h2>
						<div class="text-muted">
							Subido el
							<%=publicacion.getFecha_subida()%>
							por <a href="#"><%=publicacion.getUsuario().getNombre()%></a>
						</div>
						<img class="card-img-top"
							src="./imagenesDePublicaciones/<%=publicacion.getId()%>"
							alt="Card image cap">
						<div class="opciones">
							<a href=#>
								<button type="button" class="btn activo">
									<span class="glyphicon glyphicon-thumbs-up"></span>
								</button>
							</a> <a href=#>
								<button type="button" class="btn btn-outline-danger">
									<span class="glyphicon glyphicon-thumbs-down"></span>
								</button>
							</a>
							<%=publicacion.getVotosPositivos().size()%>
						</div>
						<p class="card-text etiquetas">
							<%
								Iterator<Etiqueta> j = publicacion.getEtiquetas().iterator();
									while (j.hasNext()) {
										Etiqueta etiqueta = j.next();
							%>
							<b> <a href="?etiqueta=<%=etiqueta.getNombre()%>">#<%=etiqueta.getNombre()%></a>
							</b>
							<%
								}
							%>
						</p>

					</div>

				</div>




				<div class="container pb-cmnt-container">
					<div class="row">
						<div style="width: 50%">
							<div class="panel panel-info">
								<div class="panel-body">
									<form class="form-inline" method="get" action=#>
										<input type="text" hidden name="id" value="<%=id%>"> <input
											type="textarea" placeholder="Escribe tu comentario aqui "
											class="pb-cmnt-textarea text-muted" name="comentario">

										<input type="submit" class="btn btn-primary pull-right"
											style="margin-top: 10px" value="Comentar">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

				<%
					Comentario comentario = new Comentario();

						ComentarioModelo cm = new ComentarioModelo();

						ArrayList<Comentario> comentarios = cm.selectAllPublicacion(id);

						Iterator<Comentario> i = comentarios.iterator();

						while (i.hasNext()) {
							comentario = i.next();
				%>

				<div class="panel panel-default" style="width: 70%">
					<div class="panel-heading">
						<b><%=comentario.getAutor().getNombre()%></b><%=" Fecha: " + comentario.getFecha()%></div>

					<div class="panel-body">
						<%=comentario.getTexto()%>

					</div>
					<div class="opciones">
						<a href=#>
							<button type="button" class="btn btn-outline-danger">
								<span class="glyphicon glyphicon-thumbs-up"></span>
							</button>
						</a> <a href=#>
							<button type="button" class="btn btn-outline-danger">
								<span class="glyphicon glyphicon-thumbs-down"></span>
							</button>
						</a>
						
						
					</div>
					

						


				</div>



				<%
					}
				%>

			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4">
					<h5 class="card-header">Buscar</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-secondary" type="button">Buscar</button>
							</span>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">Categorias</h5>
					<div class="card-body">
						<div class="list-group">
							<%
								CategoriaModelo categoriaModelo = new CategoriaModelo();
									ArrayList<Categoria> categorias = categoriaModelo.selectAllConPublicaciones();
									Iterator<Categoria> n = categorias.iterator();
									while (n.hasNext()) {
										Categoria categoria = n.next();
							%>
							<a href="?categoria='<%=categoria.getNombre()%>'"
								class="list-group-item"><%=categoria.getNombre()%><span
								class="badge"><%=categoria.getPublicaciones().size()%></span></a>
							<%
								}
							%>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">Etiquetas</h5>

					<div class="row">
						<%
							EtiquetaModelo etiquetaModelo = new EtiquetaModelo();
								ArrayList<Etiqueta> etiquetas = etiquetaModelo.selectAll();
								Iterator<Etiqueta> k = etiquetas.iterator();
								int countEti = 0;
								while (k.hasNext()) {
									Etiqueta etiqueta = k.next();
									if (countEti == 0) {
						%>
						<div class="col-lg-6">
							<ul class="list-unstyled mb-0">
								<%
									}
											countEti++;
								%>
								<li><a href="?etiqueta=<%=etiqueta.getNombre()%>"><%=etiqueta.getNombre()%></a>
								</li>
								<%
									if (countEti == 2) {
								%>
							</ul>
						</div>
						<%
							countEti = 0;
									}
								}
						%>




					</div>
				</div>

			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->





	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	
<script>

function responder(id,publi){
	var publi =String(publi);
	var id = parseInt(id)
	alert(publi);
/* 	var tabla= "<br><form class='form-inline' method='get' action='#'> <input type='text'  name='id' value='"+id+"'><input type='text'  name='publi' value='"+publi+"'><input type='textarea' placeholder='Escribe tu respuesta aqui ' class='pb-cmnt-textarea text-muted' name='comentario'> <input type='submit' class='btn btn-primary pull-right' style='margin-top: 10px' value='Comentar'> </form>";

	var prueba="hola prueba";
	document.getElementsByClassName("resp").innerHTML= tabla; */
 
}

</script>
</body>

</html>
<%
	}
%>