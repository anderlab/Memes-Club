<%@page import="clase.Categoria"%>
<%@page import="modelo.CategoriaModelo"%>
<%@page import="clase.Etiqueta"%>
<%@page import="clase.EtiquetaPublicacion"%>
<%@page import="clase.VotoPublicacion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PublicacionModelo"%>
<%@page import="clase.Publicacion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
    PublicacionModelo publicacionModelo=new PublicacionModelo();
    ArrayList<Publicacion> ultimasPublicaciones=publicacionModelo.selectUltimasPublicaciones();
    %>
<!DOCTYPE html>
<html lang="en">

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
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Registrarse</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Iniciar sesion</a></li>
    </ul>
  </div>
</nav> 

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

		<%
		Iterator<Publicacion> i=ultimasPublicaciones.iterator();
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
              <img class="card-img-top" src="./imagenesDePublicaciones/<%=publicacion.getId() %>" alt="Card image cap">
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



          

          <!-- Pagination -->
          <ul class="pagination justify-content-center mb-4">
          	<li class="page-item disabled">
              <a class="page-link" href="#">&larr; Nuevos </a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">Viejos &rarr;</a>
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
                <input type="text" class="form-control">
                <span class="input-group-btn">
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
              	CategoriaModelo categoriaModelo=new CategoriaModelo();
              	ArrayList<Categoria> categorias=categoriaModelo.selectAllConPublicaciones();
              	Iterator<Categoria> j =categorias.iterator();
              	while (j.hasNext()){
              		Categoria categoria=j.next();
              	%>
				  <a href="?categoria='<%=categoria.getNombre() %>'" class="list-group-item"><%=categoria.getNombre() %><span class="badge"><%=categoria.getPublicaciones().size() %></span></a>
				 <%} %>
				</div> 
            </div>
          </div>

          <!-- Side Widget -->
          <div class="card my-4">
            <h5 class="card-header">Etiquetas</h5>
            	 
            	<div class="row">
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">Web Design</a>
                    </li>
                    <li>
                      <a href="#">HTML</a>
                    </li>
                    <li>
                      <a href="#">Freebies</a>
                    </li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">JavaScript</a>
                    </li>
                    <li>
                      <a href="#">CSS</a>
                    </li>
                    <li>
                      <a href="#">Tutorials</a>
                    </li>
                  </ul>
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