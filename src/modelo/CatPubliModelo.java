package modelo;

import java.util.ArrayList;

import clase.Categoria;
import clase.Publicacion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CatPubliModelo extends Conector{
	public ArrayList<Categoria> selectCatPorPublicacion(String idPublicacion){
		PreparedStatement pst;
		ArrayList<Categoria> categorias=new ArrayList<>();
		try {
			pst = super.conexion.prepareStatement("Select * from esta_categorias where publicacion=?");
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
	
	public ArrayList<Publicacion> selectPubliPorCat(int idCategoria){
		PreparedStatement pst;
		ArrayList<Publicacion> publicaciones=new ArrayList<>();
		try {
			pst = super.conexion.prepareStatement("Select * from esta_categorias where categoria=?");
			pst.setInt(1, idCategoria);
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
