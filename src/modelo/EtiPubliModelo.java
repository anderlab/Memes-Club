package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clase.Categoria;
import clase.Etiqueta;

public class EtiPubliModelo extends Conector{

	public ArrayList<Etiqueta> selectEtiPorPublicacion(String idPublicacion) {
		// TODO Auto-generated method stub
		PreparedStatement pst;
		ArrayList<Etiqueta> etiquetas=new ArrayList<>();
		try {
			pst = super.conexion.prepareStatement("Select * from tiene_e where publicacion=?");
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

}
