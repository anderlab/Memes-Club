package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Clases.Usuario;

public class UsuarioModelo extends Conector {

	public ArrayList<Usuario> selectAll() {

		ArrayList<Usuario> usuarios = new ArrayList();

		try {
			PreparedStatement pst;
			pst = super.conexion.prepareStatement("select * from usuarios");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				Usuario usuario = new Usuario();

				usuario.setNombre(rs.getString("nombre"));
				usuario.setPassword(rs.getString("contrasena"));
				usuario.setRol(rs.getString("rol"));
				usuario.setImagenPerfil(rs.getString("imagen"));

				usuarios.add(usuario);

			}
			return usuarios;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}

	public void insertar(Usuario usuario) {
		try {
			PreparedStatement pst = super.conexion
					.prepareStatement("insert into usuarios (nombre,contrasena,imagen,rol) values(?,?,?,?)");
			pst.setString(1, usuario.getNombre());
			pst.setString(2, usuario.getPassword());
			pst.setString(3, usuario.getImagenPerfil());
			pst.setString(4, usuario.getRol());

			pst.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void eliminar(String nombre) {

		try {
			PreparedStatement pst = super.conexion.prepareStatement("delete from usuarios where nombre=?");
			pst.setString(1, nombre);
			pst.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void update(Usuario usuario) {
		try {
			PreparedStatement pst= super.conexion.prepareStatement("update usuarios contrasena=?,");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
