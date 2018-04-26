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
			pst = super.conexion.prepareStatement("Select * from categorias where id=?");
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
	public ArrayList<Categoria> selectAllConPublicaciones() {
		// TODO Auto-generated method stub
		ArrayList<Categoria> categorias=new ArrayList<>();
		PreparedStatement pst;
		try {
			pst = super.conexion.prepareStatement("Select * from categorias");
			ResultSet rs=pst.executeQuery();
			CatPubliModelo catPubliModelo=new CatPubliModelo();
			
			while(rs.next()){
				Categoria categoria=new Categoria();
				categoria.setId(rs.getInt("id"));
				categoria.setNombre(rs.getString("nombre"));
				categoria.setPublicaciones(catPubliModelo.selectPubliPorCat(rs.getInt("id")));
				
				categorias.add(categoria);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return categorias;

	}

}
