package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clase.Categoria;
import clase.Etiqueta;

public class EtiquetaModelo{
	Connection conexion=ConectorDB.conectarDB();
		public Etiqueta select(int id) {
			// TODO Auto-generated method stub
			PreparedStatement pst;
			Etiqueta etiqueta=null;
			try {
				pst = conexion.prepareStatement("Select * from etiquetas where id=?");
				pst.setInt(1, id);
				ResultSet rs=pst.executeQuery();
				
				while(rs.next()){
					etiqueta=new Etiqueta();
					etiqueta.setId(id);
					etiqueta.setNombre(rs.getString("nombre"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return etiqueta;
		}
		public ArrayList<Etiqueta> selectAll() {
			// TODO Auto-generated method stub
			PreparedStatement pst;
			ArrayList<Etiqueta> etiquetas=new ArrayList<>();

			try {
				pst = conexion.prepareStatement("Select * from etiquetas");
				ResultSet rs=pst.executeQuery();
				
				while(rs.next()){
					Etiqueta etiqueta=new Etiqueta();
					etiqueta=new Etiqueta();
					etiqueta.setId(rs.getInt("id"));
					etiqueta.setNombre(rs.getString("nombre"));
					etiquetas.add(etiqueta);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return etiquetas;
		}
		
		public Etiqueta selectEtiConPubli(String nombre) {
			// TODO Auto-generated method stub
			PreparedStatement pst;
			Etiqueta etiqueta=null;
			try {
				pst = conexion.prepareStatement("Select * from etiquetas where nombre=?");
				pst.setString(1, nombre);
				ResultSet rs=pst.executeQuery();
				EtiPubliModelo etiPubliModelo=new EtiPubliModelo();
				while(rs.next()){
					etiqueta=new Etiqueta();
					etiqueta.setId(rs.getInt("id"));
					etiqueta.setNombre(rs.getString("nombre"));
					etiqueta.setPublicaciones(etiPubliModelo.selectPubliPorEti(rs.getInt("id")));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return etiqueta;

		}
}
