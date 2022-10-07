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
				
				List<ModelLogin> logins = usuarioRepository.consultaUsuarioList(super.getUsuarioLogado(request));
				request.setAttribute("logins", logins);
				
				request.setAttribute("msg", "Usuário excluído com sucesso!");
				request.setAttribute("totalPagina", usuarioRepository.totalPagina(this.getUsuarioLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			
			} 
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("excluirajax")) {				
				String idUser = request.getParameter("id");
				usuarioRepository.excluir(idUser);	
				response.getWriter().write("Usuário excluído com sucesso!");
			
			}
			
			// pesquisa usuário por Ajax
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjax")) {
				 
				 String nomeBusca = request.getParameter("nomeBusca");
				 
				 List<ModelLogin> dadosJsonUser =  usuarioRepository.consultaUsuarioList(nomeBusca, super.getUsuarioLogado(request));
				 
				 ObjectMapper mapper = new ObjectMapper();
				 
				 String json = mapper.writeValueAsString(dadosJsonUser);
				 
				 response.addHeader("totalPagina", ""+ usuarioRepository.pesquisarUsuarioListaPaginacao(nomeBusca, super.getUsuarioLogado(request)));
				 response.getWriter().write(json);
				 
			 }
			
			// pesquisa usuário por Ajax Paginado
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjaxPage")) {
				 
				 String nomeBusca = request.getParameter("nomeBusca");
				 String pagina = request.getParameter("pagina");
				 
				 List<ModelLogin> dadosJsonUser =  usuarioRepository.consultaUsuarioListOffSet(nomeBusca, super.getUsuarioLogado(request), Integer.parseInt(pagina));
				 
				 ObjectMapper mapper = new ObjectMapper();
				 
				 String json = mapper.writeValueAsString(dadosJsonUser);
				 
				 response.addHeader("totalPagina", ""+ usuarioRepository.pesquisarUsuarioListaPaginacao(nomeBusca, super.getUsuarioLogado(request)));
				 response.getWriter().write(json);
				 
			 }
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("pesquisar")) {				
				
				String pesquisar = request.getParameter("pesquisar");
				
				List<ModelLogin> logins = usuarioRepository.pesquisar(pesquisar, super.getUsuarioLogado(request));
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(logins);
				
				response.addHeader("totalPagina", ""+ usuarioRepository.pesquisarListaPaginada(pesquisar, super.getUsuarioLogado(request)));
				response.getWriter().write(json);
			
			}
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {				
				
				String id = request.getParameter("id");
				
				ModelLogin modelLogin = usuarioRepository.pesquisarId(id, super.getUsuarioLogado(request));
				
				List<ModelLogin> logins = usuarioRepository.consultaUsuarioList(super.getUsuarioLogado(request));
				request.setAttribute("logins", logins);
				
				request.setAttribute("msg", "Editando Usuário");
				request.setAttribute("modelLogin", modelLogin);
				request.setAttribute("totalPagina", usuarioRepository.totalPagina(this.getUsuarioLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUsuario")) {
				
				List<ModelLogin> logins = usuarioRepository.consultaUsuarioList(super.getUsuarioLogado(request));
				
				request.setAttribute("msg", "Lista de usuários");
				request.setAttribute("logins", logins);
				request.setAttribute("totalPagina", usuarioRepository.totalPagina(this.getUsuarioLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("downloadFoto")) {
				String idUser = request.getParameter("id");
				
				ModelLogin modelLogin = usuarioRepository.pesquisarId(idUser, super.getUsuarioLogado(request));
				
				if (modelLogin.getFoto() != null && !modelLogin.getFoto().isEmpty()) {
					response.setHeader("Content-Disposition", "attachment;filename=arquivo." + modelLogin.getFotoextensao());
					 response.getOutputStream().write(new Base64().decodeBase64(modelLogin.getFoto().split("\\,")[1]));
				}
			}
			
			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("paginar")) {
				
				Integer offset = Integer.parseInt(request.getParameter("pagina"));
				
				List<ModelLogin> logins = usuarioRepository.consultaUsuarioListPaginada(this.getUsuarioLogado(request), offset);
				
				request.setAttribute("logins", logins);
				request.setAttribute("totalPagina", usuarioRepository.totalPagina(this.getUsuarioLogado(request)));
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
			}
			
			else {
				List<ModelLogin> logins = usuarioRepository.consultaUsuarioList(this.getUsuarioLogado(request));
				
				request.setAttribute("logins", logins);
				request.setAttribute("totalPagina", usuarioRepository.totalPagina(this.getUsuarioLogado(request)));
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
			String cep = request.getParameter("cep");
			String logradouro = request.getParameter("logradouro");
			String complemento = request.getParameter("complemento");
			String bairro = request.getParameter("bairro");
			String localidade = request.getParameter("localidade");
			String uf = request.getParameter("uf");
			String numero = request.getParameter("numero");
			String cpf = request.getParameter("cpf");
			String rg = request.getParameter("rg");
			String nascimento = request.getParameter("nascimento");
			String foneUm = request.getParameter("foneUm");
			String foneDois = request.getParameter("foneDois");
			String salario = request.getParameter("salario");
			
			salario = salario.replaceAll("\\.", "").replaceAll("\\,", ".");

			ModelLogin modelLogin = new ModelLogin();
			
			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelLogin.setNome(nome);
			modelLogin.setEmail(email);
			modelLogin.setLogin(login);
			modelLogin.setSenha(senha);
			modelLogin.setPerfil(perfil);
			modelLogin.setSexo(sexo);
			modelLogin.setCep(cep);
			modelLogin.setLogradouro(logradouro);
			modelLogin.setComplemento(complemento);
			modelLogin.setBairro(bairro);
			modelLogin.setLocalidade(localidade);
			modelLogin.setUf(uf);
			modelLogin.setNumero(numero);
			modelLogin.setCpf(cpf);
			modelLogin.setRg(rg);
			modelLogin.setNascimento(nascimento);
			modelLogin.setFoneUm(foneUm);
			modelLogin.setFoneDois(foneDois);
			modelLogin.setSalario(Double.valueOf(salario));
			
			if (ServletFileUpload.isMultipartContent(request)) {
				Part part = request.getPart("filefoto"); // pega foto da tela
				
//				if (part.getSize() >= 300000) {
//					request.setAttribute("msg", "O tamanho da foto de " +part.getSize()+ " não permitido. Por favor, insira uma foto com até 300 kb.");
//					System.out.println(part.getSize());
//				}
				
				if (part.getSize() > 0) {
					byte[] foto = IOUtils.toByteArray(part.getInputStream()); // converte imagem para byte
					String imagemBase64 = "data:/image" + part.getContentType().split("\\/")[1] + ";base64," + new Base64().encodeBase64String(foto);
					
					modelLogin.setFoto(imagemBase64);
					modelLogin.setFotoextensao(part.getContentType().split("\\/")[1]);					
				}
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
			request.setAttribute("totalPagina", usuarioRepository.totalPagina(this.getUsuarioLogado(request)));
			request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erros.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

}
