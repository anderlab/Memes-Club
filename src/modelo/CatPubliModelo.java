package modelo;

import java.util.ArrayList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Clases.Categoria;

public class CatPubliModelo extends Conector{
	public ArrayList<Categoria> selectCatPorPublicacion(String idPublicacion){
		PreparedStatement pst;
		ArrayList<Categoria> categorias=new ArrayList<>();
		try {
			pst = super.conexion.prepareStatement("Selet * from esta_categorias where publicacion=?");
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
		
		return categorias;
	}
	
}
