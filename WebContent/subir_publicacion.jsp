



<%@page import="clase.Publicacion"%>
<%@page import="modelo.PublicacionModelo"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>

<%@page import="java.util.List"%>

<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</head>
<body>
<%

FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);


//req es la HttpServletRequest que recibimos del formulario.
//Los items obtenidos serán cada uno de los campos del formulario,
//tanto campos normales como ficheros subidos.
//RequestContext req=(RequestContext) request;
List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(new ServletRequestContext(request));

//Se recorren todos los items, que son de tipo FileItem
for (Object item : items) {
	FileItem uploaded = (FileItem) item;
	
	// Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
	// subido donde nos interese
	if (!uploaded.isFormField()) {
	   // No es campo de formulario, guardamos el fichero en algún sitio
	   String carpeta="D:/proyectos de java/Memes/WebContent/imagenesDePublicaciones/";
		String formatoDeArchivo=uploaded.getName();
		
		//cortar direccion hasta sacar formato
		
		formatoDeArchivo=formatoDeArchivo.substring(formatoDeArchivo.lastIndexOf("."));
		
		//buscar nuevo nombre, ultima publicacion+1
		PublicacionModelo publicacionModelo=new PublicacionModelo();
		Publicacion ultimaPublicacion=publicacionModelo.selectUltimaPublicacion();
		
		//quitar la parte de fromato y sacar id
		String ultimaId=ultimaPublicacion.getId();
		int nuevaId=Integer.parseInt(ultimaId.substring(0,ultimaId.lastIndexOf(".")));
		
		
		
	   File fichero = new File(carpeta, (++nuevaId)+formatoDeArchivo);
	   uploaded.write(fichero);
	} else {
	   // es un campo de formulario, podemos obtener clave y valor
	   String key = uploaded.getFieldName();
	   String valor = uploaded.getString();
	}
}
      
      %>
      
</body>
</html>