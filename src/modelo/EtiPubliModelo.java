package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clase.Categoria;
import clase.Etiqueta;
import clase.Publicacion;

public class EtiPubliModelo{
	Connection conexion=ConectorDB.conectarDB();
	public ArrayList<Etiqueta> selectEtiPorPublicacion(String idPublicacion) {
		// TODO Auto-generated method stub
		PreparedStatement pst;
		ArrayList<Etiqueta> etiquetas=new ArrayList<>();
		try {
			pst = conexion.prepareStatement("Select * from tiene_e where publicacion=?");
			pst.setString(1, idPublicacion);
			ResultSet rs=pst.executeQuery();
			EtiquetaModelo etiquetaModelo=new EtiquetaModelo();
			
			while(rs.next()){
				Etiqueta etiqueta=etiquetaModelo.select(rs.getInt("etiqueta"));
				etiquetas.add(etiqueta);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return etiquetas;

	}
	
	
	public ArrayList<Publicacion> selectPubliPorEti(int idEtiqueta){
		PreparedStatement pst;
		ArrayList<Publicacion> publicaciones=new ArrayList<>();
		try {
			pst = conexion.prepareStatement("Select * from tiene_e where etiqueta=?");
			pst.setInt(1, idEtiqueta);
			ResultSet rs=pst.executeQuery();
			PublicacionModelo publicacionModelo=new PublicacionModelo();
			
			while(rs.next()){
				Publicacion publicacion=publicacionModelo.select(rs.getString("publicacion"));
				publicaciones.add(publicacion);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return publicaciones;
	}

}
