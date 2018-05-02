package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clase.Etiqueta;
import clase.MejorPublicacion;
import clase.Publicacion;

public class MejorPublicacionModelo {
	Connection conexion=ConectorDB.conectarDB();
	public ArrayList<MejorPublicacion> selectMejores(){
		PreparedStatement pst;
		ArrayList<MejorPublicacion> mejorPublicaciones=new ArrayList<>();

		try {
			pst = conexion.prepareStatement("Select * from mejores_publicaciones order by fecha_llegada limit 10");
			ResultSet rs=pst.executeQuery();
			PublicacionModelo publicacionModelo=new PublicacionModelo();
			
			while(rs.next()){
				MejorPublicacion mejorPublicacion=new MejorPublicacion();
				mejorPublicacion=new MejorPublicacion();
				mejorPublicacion.setPublicacion(publicacionModelo.select(rs.getString("id")));
				mejorPublicacion.setFechaLlegada(rs.getDate("fecha_llegada"));
				
				mejorPublicaciones.add(mejorPublicacion);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mejorPublicaciones;
		
	}
	
	public void insert(Publicacion publicacion){
		try {
			PreparedStatement pst=conexion.prepareStatement("insert into mejores_publicaciones(publicacion,fecha_llegada) values(?,now())");
			pst.setString(1,publicacion.getId());
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
