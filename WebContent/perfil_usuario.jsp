<%@page import="clase.Categoria"%>
<%@page import="modelo.CategoriaModelo"%>
<%@page import="clase.Etiqueta"%>
<%@page import="java.util.Iterator"%>
<%@page import="clase.Usuario"%>
<%@page import="clase.Publicacion"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	ArrayList<Publicacion> publicaciones=(ArrayList<Publicacion>)request.getAttribute("publicaciones");
	boolean esEl=(Boolean) request.getAttribute("esEl");
	Usuario usuario = null;
	Object u = session.getAttribute("iniciado");
	if (u != null) {
		usuario = (Usuario) u;
	}
	int pagina=(Integer)request.getAttribute("pagina");
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Memes Club</title>

    <!-- Bootstrap core CSS -->


    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet"></head>
<body>
<!-- Navigation -->
 <nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp" id="logo"><img src="./imgs/logo1.png" width="70px" /></a>
			</div>
			<ul class="nav navbar-nav">
			 	<li><a href="index.jsp">Mejores</a></li>
				<li><a href="index.jsp?opcion=ultimos">Ultimos</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">

				<%
					if (u != null) {
							usuario = (Usuario) u;
							
								out.print("<li class='dropdown'>");
								out.print("<a class='dropdown-toggle' data-toggle='dropdown' href='#'>" + usuario.getNombre());
				%>
				<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<%if(usuario.getRol().equals("admin")){
						%>
						<li><a href="Administrador/gestor.jsp">Gestion</a></li>
					<% }%>
					<li><a href="logout.jsp">Cerrar Sesion</a></li>
					<li><a href="nueva_publicacion.jsp" ><span class="glyphicon glyphicon-plus"></span>A�adir publicacion</a></li>
				</ul>
				</li>
				<%
					
						} else {
							out.print(" <li><a href='loginForm.jsp'><span class='glyphicon glyphicon-user'></span> Iniciar Sesion</a></li>");
							out.print(" <li><a href='Administrador/crearUsuario.jsp'><span class='glyphicon glyphicon-user'></span> Registrarse</a></li>");
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

		<%
		if (publicaciones.isEmpty()){
			
			out.print("<h3 style='color: grey;'>Lo siento pero no hay publicaciones :'(</h3>");
		}
		Iterator<Publicacion> i=publicaciones.iterator();
    		while(i.hasNext()){
    			Publicacion publicacion=i.next();
		%>
          <!-- Blog Post -->
          <div class="card mb-4">
            
            <div class="card-body">
              <h2 class="card-title"><%=publicacion.getTitulo()%></h2>
              <div class="text-muted">
              Subido el <%=publicacion.getFecha_subida() %> por <a href="#"><%=publicacion.getUsuario().getNombre() %></a>
            </div>
              <a href="publicacion.jsp?id=<%=publicacion.getId() %>">
              	<img class="card-img-top"  src="./imagenesDePublicaciones/<%=publicacion.getId() %>" alt="Card image cap" width="750px" onerror="this.src='./imagenesDePublicaciones/404meme.jpg';">
              	</a>
              <div class="opciones">
              	<a href=#>
              		<button type="button" class="btn activo">
              			<span class="glyphicon glyphicon-thumbs-up"></span>
              		</button>
              	</a>
              	<a href=#>
              		<button type="button" class="btn btn-outline-danger">
              			<span class="glyphicon glyphicon-thumbs-down"></span>
              		</button>
              	</a>
              	<%=publicacion.getVotosPositivos().size()%>
              </div>
             <p class="card-text etiquetas" >
             <%
             	Iterator<Etiqueta> j=publicacion.getEtiquetas().iterator();
             	while (j.hasNext()){
             		Etiqueta etiqueta=j.next();
             	
             %>
              	<b>
              		<a href="?etiqueta=<%=etiqueta.getNombre()%>">#<%=etiqueta.getNombre()%></a>
              	</b> 
			<%
			}
			%>
			</p>
              
            </div>
            
          </div>
		<%
    		}
		%>


<%
	
	int anteriorPagina=0;
	int proximaPagina=2;
	if(pagina!=1){
		anteriorPagina=pagina-1;
		proximaPagina=pagina+1;
	}

%>
          

          <!-- Pagination -->
          <ul class="pagination justify-content-center mb-4">
          <%
          	if(anteriorPagina==0){
		          %>
		          	<li class="page-item disabled">
		          	<a class="page-link" href="?">&larr; Nuevos </a>
		          <%
          	}else{
          		 %>
               	<li class="page-item">
               	<a class="page-link" href="?pagina=<%=anteriorPagina%>">&larr; Nuevos </a>
               <%
          	}
          %>
            </li>
            <li class="page-item">
              <a class="page-link" href="?pagina=<%=proximaPagina%>">Viejos &rarr;</a>
            </li>
          </ul>

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- Search Widget -->
          <div class="card my-4">
            <h5 class="card-header">Buscar</h5>
            <div class="card-body">
              <div class="input-group">
              <form method="get" action="index.jsp">
                <input type="text" class="form-control" name="busqueda">
                <span class="input-group-btn">
                  <input type="submit" class="btn btn-secondary" value="Buscar">
                </span>
               </form>
              </div>
            </div>
          </div>

          <!-- Categories Widget -->
          <div class="card my-4">
            <h5 class="card-header">Categorias</h5>
            <div class="card-body">
              <div class="list-group">
              	<%
              	CategoriaModelo categoriaModelo=new CategoriaModelo();
              	ArrayList<Categoria> categorias=categoriaModelo.selectAllConPublicaciones();
              	Iterator<Categoria> j =categorias.iterator();
              	while (j.hasNext()){
              		Categoria categoria=j.next();
              	%>
				  <a href="index.jsp?categoria=<%=categoria.getNombre() %>" class="list-group-item"><%=categoria.getNombre() %><span class="badge"><%=categoria.getPublicaciones().size() %></span></a>
				 <%} %>
				</div> 
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
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>