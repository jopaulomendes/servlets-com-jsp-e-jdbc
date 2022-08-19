package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DaoUsuarioRepository {

	private Connection connection;

	public DaoUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public ModelLogin salvar(ModelLogin modelLogin, Long usuarioLogado) throws Exception {

		if (modelLogin.isNovo()) {

			String sql = "insert into model_login"
					+ "(login, senha, nome, email, usuario_id, perfil, sexo, cep, logradouro, complemento, bairro, localidade, uf, numero, cpf, rg, nascimento, fone_um, fone_dois) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, modelLogin.getLogin());
			statement.setString(2, modelLogin.getSenha());
			statement.setString(3, modelLogin.getNome());
			statement.setString(4, modelLogin.getEmail());
			statement.setLong(5, usuarioLogado);
			statement.setString(6, modelLogin.getPerfil());
			statement.setString(7, modelLogin.getSexo());
			statement.setString(8, modelLogin.getCep());
			statement.setString(9, modelLogin.getLogradouro());
			statement.setString(10, modelLogin.getComplemento());
			statement.setString(11, modelLogin.getBairro());
			statement.setString(12, modelLogin.getLocalidade());
			statement.setString(13, modelLogin.getUf());
			statement.setString(14, modelLogin.getNumero());
			statement.setString(15, modelLogin.getCpf());
			statement.setString(16, modelLogin.getRg());
			statement.setString(17, modelLogin.getNascimento());
			statement.setString(18, modelLogin.getFoneUm());
			statement.setString(19, modelLogin.getFoneDois());

			statement.execute();
			connection.commit();
			
			if (modelLogin.getFoto() != null && !modelLogin.getFoto().isEmpty()) {
				
				sql = "update model_login set foto=?, fotoextensao=? where login=?";
				
				statement = connection.prepareStatement(sql);
				statement.setString(1, modelLogin.getFoto());
				statement.setString(2, modelLogin.getFotoextensao());
				statement.setString(3, modelLogin.getLogin());
				
				statement.execute();
				connection.commit();				
			}

		} else {

			String sql = "update model_login "
					+ "set login=?, senha=?, nome=?, email=?, perfil=?, sexo=?, cep=?, logradouro=?, complemento=?, bairro=?, localidade=?, uf=?, numero=?, "
					+ "cpf=?, rg=?, nascimento=?, fone_um=?, fone_dois=?"
					+ "where id = " + modelLogin.getId() + ";";

			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, modelLogin.getLogin());
			statement.setString(2, modelLogin.getSenha());
			statement.setString(3, modelLogin.getNome());
			statement.setString(4, modelLogin.getEmail());
			statement.setString(5, modelLogin.getPerfil());
			statement.setString(6, modelLogin.getSexo());
			statement.setString(7, modelLogin.getCep());
			statement.setString(8, modelLogin.getLogradouro());
			statement.setString(9, modelLogin.getComplemento());
			statement.setString(10, modelLogin.getBairro());
			statement.setString(11, modelLogin.getLocalidade());
			statement.setString(12, modelLogin.getUf());
			statement.setString(13, modelLogin.getNumero());
			statement.setString(14, modelLogin.getCpf());
			statement.setString(15, modelLogin.getRg());
			statement.setString(16, modelLogin.getNascimento());
			statement.setString(17, modelLogin.getFoneUm());
			statement.setString(18, modelLogin.getFoneDois());

			statement.executeUpdate();
			connection.commit();
			
			if (modelLogin.getFoto() != null && !modelLogin.getFoto().isEmpty()) {
				
				sql = "update model_login set foto=?, fotoextensao=? where id=?";
				
				statement = connection.prepareStatement(sql);
				statement.setString(1, modelLogin.getFoto());
				statement.setString(2, modelLogin.getFotoextensao());
				statement.setLong(3, modelLogin.getId());
				
				statement.execute();
				connection.commit();				
			}
		}

		return this.pesquisarLogin(modelLogin.getLogin(), usuarioLogado);
	}

	public void excluir(String idUser) throws Exception {
		String sql = "DELETE FROM model_login WHERE id=? and useradmin is false;";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, Long.parseLong(idUser));
		statement.executeUpdate();
		connection.commit();
	}
	
	//	pesquia por login
	public ModelLogin pesquisarUsuarioLogado(String login) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where lower(login) = lower('" + login + "')";

		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setLogin(resultSet.getString("login"));
			modelLogin.setSenha(resultSet.getString("senha"));
			modelLogin.setSenha(resultSet.getString("senha"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			modelLogin.setSexo(resultSet.getString("sexo"));
			modelLogin.setFoto(resultSet.getString("foto"));
			modelLogin.setCep(resultSet.getString("cep"));
			modelLogin.setLogradouro(resultSet.getString("logradouro"));
			modelLogin.setComplemento(resultSet.getString("complemento"));
			modelLogin.setBairro(resultSet.getString("bairro"));
			modelLogin.setLocalidade(resultSet.getString("localidade"));
			modelLogin.setUf(resultSet.getString("uf"));
			modelLogin.setNumero(resultSet.getString("numero"));
			modelLogin.setCpf(resultSet.getString("cpf"));
			modelLogin.setRg(resultSet.getString("rg"));
			modelLogin.setNascimento(resultSet.getString("nascimento"));
			modelLogin.setFoneUm(resultSet.getString("fone_um"));
			modelLogin.setFoneDois(resultSet.getString("fone_dois"));
		}

		return modelLogin;
	}
	
	//	pesquia por login
	public ModelLogin pesquisarLogin(String login) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where lower(login) = lower('" + login + "') and useradmin is false ";

		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setLogin(resultSet.getString("login"));
			modelLogin.setSenha(resultSet.getString("senha"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			modelLogin.setSexo(resultSet.getString("sexo"));
			modelLogin.setFoto(resultSet.getString("foto"));
			modelLogin.setCep(resultSet.getString("cep"));
			modelLogin.setLogradouro(resultSet.getString("logradouro"));
			modelLogin.setComplemento(resultSet.getString("complemento"));
			modelLogin.setBairro(resultSet.getString("bairro"));
			modelLogin.setLocalidade(resultSet.getString("localidade"));
			modelLogin.setUf(resultSet.getString("uf"));
			modelLogin.setNumero(resultSet.getString("numero"));
			modelLogin.setCpf(resultSet.getString("cpf"));
			modelLogin.setRg(resultSet.getString("rg"));
			modelLogin.setNascimento(resultSet.getString("nascimento"));
			modelLogin.setFoneUm(resultSet.getString("fone_um"));
			modelLogin.setFoneDois(resultSet.getString("fone_dois"));
		}

		return modelLogin;
	}

	//	pesquia por login e usuario loagdo
	public ModelLogin pesquisarLogin(String login, Long usuarioLogado) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where lower(login) = lower('" + login + "') and useradmin is false and usuario_id = " + usuarioLogado;

		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setLogin(resultSet.getString("login"));
			modelLogin.setSenha(resultSet.getString("senha"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			modelLogin.setSexo(resultSet.getString("sexo"));
			modelLogin.setFoto(resultSet.getString("foto"));
			modelLogin.setCep(resultSet.getString("cep"));
			modelLogin.setLogradouro(resultSet.getString("logradouro"));
			modelLogin.setComplemento(resultSet.getString("complemento"));
			modelLogin.setBairro(resultSet.getString("bairro"));
			modelLogin.setLocalidade(resultSet.getString("localidade"));
			modelLogin.setUf(resultSet.getString("uf"));
			modelLogin.setNumero(resultSet.getString("numero"));
			modelLogin.setCpf(resultSet.getString("cpf"));
			modelLogin.setRg(resultSet.getString("rg"));
			modelLogin.setNascimento(resultSet.getString("nascimento"));
			modelLogin.setFoneUm(resultSet.getString("fone_um"));
			modelLogin.setFoneDois(resultSet.getString("fone_dois"));
		}

		return modelLogin;
	}

	//	pesquisar por id
	public ModelLogin pesquisarId(String id, Long usuarioLogado) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where id = ? and useradmin is false and usuario_id = ?";

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, Long.parseLong(id));
		statement.setLong(2, usuarioLogado);

		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setLogin(resultSet.getString("login"));
			modelLogin.setSenha(resultSet.getString("senha"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			modelLogin.setSexo(resultSet.getString("sexo"));
			modelLogin.setFoto(resultSet.getString("foto"));
			modelLogin.setFotoextensao(resultSet.getString("fotoextensao"));
			modelLogin.setCep(resultSet.getString("cep"));
			modelLogin.setLogradouro(resultSet.getString("logradouro"));
			modelLogin.setComplemento(resultSet.getString("complemento"));
			modelLogin.setBairro(resultSet.getString("bairro"));
			modelLogin.setLocalidade(resultSet.getString("localidade"));
			modelLogin.setUf(resultSet.getString("uf"));
			modelLogin.setNumero(resultSet.getString("numero"));
			modelLogin.setCpf(resultSet.getString("cpf"));
			modelLogin.setRg(resultSet.getString("rg"));
			modelLogin.setNascimento(resultSet.getString("nascimento"));
			modelLogin.setFoneUm(resultSet.getString("fone_um"));
			modelLogin.setFoneDois(resultSet.getString("fone_dois"));
		}

		return modelLogin;
	}

	public boolean validarLogin(String login) throws Exception {
		String sql = "select count(1) > 0 as existe from model_login where lower(login) = lower('" + login + "');";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();

		resultSet.next();

		return resultSet.getBoolean("existe");
	}

	//	pesquisar por nome
	public List<ModelLogin> pesquisar(String nome, Long usuarioLogado) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		List<ModelLogin> list = new ArrayList<>();

		String sql = "select * from model_login where  lower(nome) like lower(?) and useradmin is false and usuario_id = ?";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, "%" + nome + "%");
		statement.setLong(2, usuarioLogado);

		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setLogin(resultSet.getString("login"));
//			modelLogin.setSenha(resultSet.getString("senha"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			modelLogin.setSexo(resultSet.getString("sexo"));

			list.add(modelLogin);
		}

		return list;
	}
	
	//	Lista todos os usuário
	public List<ModelLogin> pesquisar(Long usuarioLogado) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		List<ModelLogin> list = new ArrayList<ModelLogin>();

		String sql = "select * from model_login where useradmin is false and usuario_id = " + usuarioLogado + " limit 5";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setLogin(resultSet.getString("login"));
//			modelLogin.setSenha(resultSet.getString("senha"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			modelLogin.setSexo(resultSet.getString("sexo"));

			list.add(modelLogin);
		}

		return list;
	}
	
	public List<ModelLogin> pesquisarUsuarioLista(String nome, Long usuarioLogado) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		List<ModelLogin> list = new ArrayList<ModelLogin>();

		String sql = "select * from model_login where upper(nome) like upper (?) and useradmin is false and usuario_id  = ? limit 5";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setLogin(resultSet.getString("login"));
//			modelLogin.setSenha(resultSet.getString("senha"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			modelLogin.setSexo(resultSet.getString("sexo"));

			list.add(modelLogin);
		}

		return list;
	}
	
	public List<ModelLogin> consultaUsuarioListPaginada(Long usuarioLogado, Integer offset) throws Exception {
		
		ModelLogin modelLogin = new ModelLogin();

		List<ModelLogin> list = new ArrayList<ModelLogin>();

		String sql = "select * from model_login where useradmin is false and usuario_id = " + usuarioLogado + " order by nome offset " +offset+ " limit 5";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {
			modelLogin.setId(resultSet.getLong("id"));
			modelLogin.setNome(resultSet.getString("nome"));
			modelLogin.setEmail(resultSet.getString("email"));
			modelLogin.setLogin(resultSet.getString("login"));
//			modelLogin.setSenha(resultSet.getString("senha"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			modelLogin.setSexo(resultSet.getString("sexo"));

			list.add(modelLogin);
		}

		return list;
	}
	
	public int totalPagina(Long usuarioLogado) throws Exception {
		
		String sql = "select count(1) as total from model_login ml where usuario_id = " + usuarioLogado + " limit 5";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultSet = statement.executeQuery();
		resultSet.next();
		
		Double cadastros = resultSet.getDouble("total");
		Double porPagina = 5.0;
		Double pagina = cadastros / porPagina;
		Double resto = pagina % 2;
		
		if (resto > 0) {
			pagina++;
		}
		
		return pagina.intValue();
	}
}







