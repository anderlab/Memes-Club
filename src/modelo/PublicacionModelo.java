package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clase.Publicacion;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PublicacionModelo{
	Connection conexion=ConectorDB.conectarDB();
	public ArrayList<Publicacion> selectUltimasPublicaciones(){
		PreparedStatement pst;
		ArrayList<Publicacion> publicaciones=new ArrayList<>();
		
		UsuarioModelo usuarioModelo=new UsuarioModelo();
		CatPubliModelo catPubliModelo=new CatPubliModelo();
		EtiPubliModelo etiPubliModelo=new EtiPubliModelo();
		VotoPubliModelo votoPubliModelo=new VotoPubliModelo();
		
		try {
			pst = conexion.prepareStatement("SELECT * FROM publicaciones ORDER BY fecha_subida LIMIT 10");
			ResultSet rs=pst.executeQuery();
			while (rs.next()){
				Publicacion publicacion=new Publicacion();
				
				publicacion.setId(rs.getString("id"));
				publicacion.setTitulo(rs.getString("titulo"));
				publicacion.setFecha_subida(rs.getDate("fecha_subida"));
				publicacion.setUsuario(usuarioModelo.select(rs.getString("autor")));
				publicacion.setCategorias(catPubliModelo.selectCatPorPublicacion(rs.getString("id")));
				publicacion.setEtiquetas(etiPubliModelo.selectEtiPorPublicacion(rs.getString("id")));
				publicacion.setVotos(votoPubliModelo.selectPorPublicacion(rs.getString("id")));
				
				publicaciones.add(publicacion);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return publicaciones;
	}
	
	
	public Publicacion select(String id){
		Publicacion publicacion=null;
		
		UsuarioModelo usuarioModelo=new UsuarioModelo();
		CatPubliModelo catPubliModelo=new CatPubliModelo();
		EtiPubliModelo etiPubliModelo=new EtiPubliModelo();
		VotoPubliModelo votoPubliModelo=new VotoPubliModelo();
		
		try {
			PreparedStatement pst = conexion.prepareStatement("SELECT * FROM publicaciones where id=?");
			pst.setString(1, id);
			ResultSet rs=pst.executeQuery();
			while (rs.next()){
				publicacion=new Publicacion();
				
				publicacion.setId(rs.getString("id"));
				publicacion.setTitulo(rs.getString("titulo"));
				publicacion.setFecha_subida(rs.getDate("fecha_subida"));
				publicacion.setCategorias(catPubliModelo.selectCatPorPublicacion(rs.getString("id")));
				publicacion.setEtiquetas(etiPubliModelo.selectEtiPorPublicacion(rs.getString("id")));
				publicacion.setVotos(votoPubliModelo.selectPorPublicacion(rs.getString("id")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return publicacion;
	}
	
}
