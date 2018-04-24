package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Clases.Categoria;
import Clases.VotoPublicacion;

public class VotoPubliModelo extends Conector{

	public ArrayList<VotoPublicacion> selectPorPublicacion(String idPublicacion) {
		// TODO Auto-generated method stub
		PreparedStatement pst;
		ArrayList<VotoPublicacion> votos=new ArrayList<>();
		try {
			pst = super.conexion.prepareStatement("Selet * from voto_p where publicacion=?");
			pst.setString(1, idPublicacion);
			ResultSet rs=pst.executeQuery();
			CategoriaModelo categoriaModelo=new CategoriaModelo();
			
			while(rs.next()){
				Categoria categoria=categoriaModelo.select(rs.getInt("categoria"));
				categorias.add(categoria);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
