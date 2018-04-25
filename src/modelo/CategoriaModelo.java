package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clase.Categoria;

public class CategoriaModelo extends Conector{

	public Categoria select(int id) {
		// TODO Auto-generated method stub
		PreparedStatement pst;
		Categoria categoria=null;
		try {
			pst = super.conexion.prepareStatement("Selet * from categorias where id=?");
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			CategoriaModelo categoriaModelo=new CategoriaModelo();
			
			while(rs.next()){
				categoria=new Categoria();
				categoria.setId(id);
				categoria.setNombre(rs.getString("nombre"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return categoria;

	}

}
