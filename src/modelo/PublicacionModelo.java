package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clase.Publicacion;

import java.sql.PreparedStatement;

public class PublicacionModelo extends Conector{
	public ArrayList<Publicacion> selectUltimasPublicaciones(){
		PreparedStatement pst;
		ArrayList<Publicacion> publicaciones=new ArrayList<>();
		
		UsuarioModelo usuarioModelo=new UsuarioModelo();
		CatPubliModelo catPubliModelo=new CatPubliModelo();
		EtiPubliModelo etiPubliModelo=new EtiPubliModelo();
		VotoPubliModelo votoPubliModelo=new VotoPubliModelo();
		
		try {
			pst = super.conexion.prepareStatement("Select * from publicaciones order by fecha_subida limit=10");
			ResultSet rs=pst.executeQuery();
			while (rs.next()){
				Publicacion publicacion=new Publicacion();
				
				publicacion.setId(rs.getString("id"));
				publicacion.setTitulo(rs.getString("titulo"));
				publicacion.setFecha_subida(rs.getDate("fecha_subida"));
				publicacion.setUsuario(usuarioModelo.select(rs.getString("autor")));
				publicacion.setCategorias(catPubliModelo.selectCatPorPublicacion(rs.getString("id")));
				publicacion.setEtiquetas(etiPubliModelo.selectEtiPorPublicacion(rs.getString("id")));
				publicacion.setVotos(votoPubliModelo.selectPorPublicacion(rs.getString("id")));
				
				publicaciones.add(publicacion);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return publicaciones;
	}
}
