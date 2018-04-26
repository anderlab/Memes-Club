package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import clase.Categoria;
import clase.Etiqueta;

public class EtiquetaModelo extends Conector{
	
		public Etiqueta select(int id) {
			// TODO Auto-generated method stub
			PreparedStatement pst;
			Etiqueta etiqueta=null;
			try {
				pst = super.conexion.prepareStatement("Select * from etiquetas where id=?");
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
