package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clase.Categoria;
import clase.VotoPublicacion;

public class VotoPubliModelo extends Conector{

	public ArrayList<VotoPublicacion> selectPorPublicacion(String idPublicacion) {
		// TODO Auto-generated method stub
		PreparedStatement pst;
		ArrayList<VotoPublicacion> votos=new ArrayList<>();
		try {
			pst = super.conexion.prepareStatement("Select * from votar_p where publicacion=?");
			pst.setString(1, idPublicacion);
			ResultSet rs=pst.executeQuery();
			VotoPubliModelo votoPubliModelo=new VotoPubliModelo();
			UsuarioModelo usuarioModelo = new UsuarioModelo();
			while(rs.next()){
				VotoPublicacion votoPublicacion=new VotoPublicacion();
				votoPublicacion.setUsuario(usuarioModelo.select(rs.getString("usuario")));
				votoPublicacion.setVoto(rs.getBoolean("voto"));
				votoPublicacion.setFecha(rs.getDate("fecha"));
				votos.add(votoPublicacion);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return votos;
	}

}
