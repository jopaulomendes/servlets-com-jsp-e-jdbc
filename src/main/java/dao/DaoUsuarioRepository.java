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
		
		if (modelLogin.isNovo()) {
			
			String sql = "insert into model_login(login, senha, nome, email) VALUES(?, ?, ?, ?);";
			
			PreparedStatement statement = connection.prepareStatement(sql);			
			statement.setString(1, modelLogin.getLogin());
			statement.setString(2, modelLogin.getSenha());
			statement.setString(3, modelLogin.getNome());
			statement.setString(4, modelLogin.getEmail());
			
			statement.execute();
			connection.commit();
			
		} else {
			
			String sql = "update model_login set login=?, senha=?, nome=?, email=? where id = "+modelLogin.getId()+";";
			
			PreparedStatement statement = connection.prepareStatement(sql);			
			statement.setString(1, modelLogin.getLogin());
			statement.setString(2, modelLogin.getSenha());
			statement.setString(3, modelLogin.getNome());
			statement.setString(4, modelLogin.getEmail());
			
			statement.executeUpdate();
			connection.commit();
		}		
		
		return this.pesquisarLogin(modelLogin.getLogin());
	}
	
	public void excluir(String idUser) throws Exception{
		String sql = "DELETE FROM model_login WHERE id=?;";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, Long.parseLong(idUser));
		statement.executeUpdate();
		connection.commit();
	}
	
	public ModelLogin pesquisarLogin(String login) throws Exception {	
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "select * from model_login where lower(login) = lower('"+login+"');";   
		
		PreparedStatement statement = connection.prepareStatement(sql);		
		
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
	
	public boolean validarLogin(String login) throws Exception {
		String sql = "select count(1) > 0 as existe from model_login where lower(login) = lower('"+login+"');";
		
		PreparedStatement statement = connection.prepareStatement(sql);		
		ResultSet resultSet = statement.executeQuery();
		
		resultSet.next();
		
		return resultSet.getBoolean("existe");
	}
}
