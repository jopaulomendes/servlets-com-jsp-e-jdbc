package servlets;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoUsuarioRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;

public class ServletUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuarioRepository usuarioRepository = new DaoUsuarioRepository();

	public ServletUsuarioController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("excluir")) {
				
				String idUser = request.getParameter("id");
				usuarioRepository.excluir(idUser);
				request.setAttribute("msg", "Usuário excluído com sucesso!");
				
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("excluirajax")) {
				
				String idUser = request.getParameter("id");
				usuarioRepository.excluir(idUser);	
				response.getWriter().write("Usuário excluído com sucesso!");
			
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("pesquisar")) {				
				
				String pesquisar = request.getParameter("pesquisar");
				
				List<ModelLogin> list = usuarioRepository.pesquisar(pesquisar);
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(list);
				response.getWriter().write(json);
			
			}
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {
				
				String id = request.getParameter("id");
				
				ModelLogin modelLogin = usuarioRepository.pesquisarId(id);
				
				request.setAttribute("msg", "Editando Usuário");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}
			
			else {
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erros.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String msg = "Usuário salvo com sucesso!";

			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			ModelLogin modelLogin = new ModelLogin();
			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelLogin.setNome(nome);
			modelLogin.setEmail(email);
			modelLogin.setLogin(login);
			modelLogin.setSenha(senha);

			if (usuarioRepository.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {
				msg = "Login em uso";
			} else {
				if (modelLogin.isNovo()) {
					msg = "Usuário salvo com sucesso";
				} else {
					msg = "Usuário editado com sucesso";
				}
				modelLogin = usuarioRepository.salvar(modelLogin);
			}

			request.setAttribute("msg", msg);
			request.setAttribute("modelLogin", modelLogin); // mantém os dados na tela
			request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erros.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

}
