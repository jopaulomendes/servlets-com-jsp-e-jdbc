package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DaoUsuarioRepository {
	
	private Connection connection;

	public DaoUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public ModelLogin salvar(ModelLogin modelLogin) throws Exception {
		String sql = "INSERT INTO model_login(login, senha, nome, email) VALUES(?,?,?,?);";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		statement.setString(1, modelLogin.getLogin());
		statement.setString(2, modelLogin.getSenha());
		statement.setString(3, modelLogin.getNome());
		statement.setString(4, modelLogin.getEmail());
		
		statement.execute();
		connection.commit();
		
		return this.pesquisarLogin(modelLogin.getLogin());
	}
	
	public ModelLogin pesquisarLogin(String login) throws Exception {
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "select * from model_login ml where lower(login) = lower('?');";
		PreparedStatement statement = connection.prepareStatement(sql);		
		statement.setString(1, login);
		
		ResultSet resultSet = statement.executeQuery();
		
		while (resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setLogin(resultSet.getString("login"));
			modelLogin.setSenha(resultSet.getString("senha"));
		}
		
		return modelLogin;	
		
	}
}
