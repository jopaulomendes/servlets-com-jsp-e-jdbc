package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DaoUsuarioRepository {
	
	private Connection connection;

	public DaoUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public void salvar(ModelLogin modelLogin) throws Exception {
		String sql = "INSERT INTO model_login(login, senha, nome, email) VALUES(?,?,?,?);";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		statement.setString(1, modelLogin.getLogin());
		statement.setString(2, modelLogin.getSenha());
		statement.setString(3, modelLogin.getNome());
		statement.setString(4, modelLogin.getEmail());
		
		statement.execute();
		connection.commit();
	}
}
