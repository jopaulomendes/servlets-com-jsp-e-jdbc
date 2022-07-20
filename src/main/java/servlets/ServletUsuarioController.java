package servlets;

import java.io.IOException;
import java.util.List;

import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DaoUsuarioRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.ModelLogin;

//@WebServlet(urlPatterns = {"ServletUsuarioController"})
@MultipartConfig
public class ServletUsuarioController extends ServletGenericUtils {
	
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
				
				List<ModelLogin> list = usuarioRepository.pesquisar(pesquisar, super.getUsuarioLogado(request));
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(list);
				response.getWriter().write(json);
			
			}
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {				
				String id = request.getParameter("id");
				
				ModelLogin modelLogin = usuarioRepository.pesquisarId(id, super.getUsuarioLogado(request));
				
				request.setAttribute("msg", "Editando Usuário");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUsuario")) {
				List<ModelLogin> list = usuarioRepository.pesquisar(super.getUsuarioLogado(request));
				
				request.setAttribute("msg", "Lista de usuários");
				request.setAttribute("list", list);
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
			String perfil = request.getParameter("perfil");
			String sexo = request.getParameter("sexo");

			ModelLogin modelLogin = new ModelLogin();
			
			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelLogin.setNome(nome);
			modelLogin.setEmail(email);
			modelLogin.setLogin(login);
			modelLogin.setSenha(senha);
			modelLogin.setPerfil(perfil);
			modelLogin.setSexo(sexo);
			
			if (ServletFileUpload.isMultipartContent(request)) {
				Part part = request.getPart("filefoto"); // pega foto da tela
				byte[] foto = IOUtils.toByteArray(part.getInputStream()); // converte imagem para byte
				String imagemBase64 = "data:/image" + part.getContentType().split("\\/")[1] + ";base64," + new Base64().encodeBase64String(foto);
				
				System.out.println(imagemBase64);
				
				modelLogin.setFoto(imagemBase64);
				modelLogin.setFotoextensao(part.getContentType().split("\\/")[1]);
			}

			if (usuarioRepository.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {
				msg = "Login em uso";
			} else {
				if (modelLogin.isNovo()) {
					msg = "Usuário salvo com sucesso!";
				} else {
					msg = "Usuário editado com sucesso!";
				}
				modelLogin = usuarioRepository.salvar(modelLogin, super.getUsuarioLogado(request));
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
