package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clase.MejorPublicacion;
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
				publicacion.setUsuario(usuarioModelo.select(rs.getString("autor")));
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
	
	public ArrayList<Publicacion> buscarNuevosMejoresPubli(int dias){
		/*
		 * select de los publicaciones, que todabia no estan en mejores
		 * 		y que en la fecha limite(dias introducidos) conseguieron mas votos. solo seleccionar 10	
		 */
		ArrayList<Publicacion> publicaciones=new ArrayList<>();
		try {
			PreparedStatement pst=conexion.prepareStatement("select id from publicaciones p, votar_p v where p.id=v.publicacion and p.id not in(select publicacion from mejores_publicaciones) and v.fecha between (current_date() - interval ? day) and current_date group by p.id order by count(v.voto) desc limit 10");
			pst.setInt(1, dias);
			ResultSet rs= pst.executeQuery();
			PublicacionModelo publicacionModelo=new PublicacionModelo();
			while(rs.next()){
				Publicacion publicacion=new Publicacion();
				publicacion=publicacionModelo.select(rs.getString("id"));
				
				publicaciones.add(publicacion);
			}
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return publicaciones;		
	}
}
