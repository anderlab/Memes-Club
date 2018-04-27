package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				EtiquetaModelo etiquetaModelo=new EtiquetaModelo();
				
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
}
