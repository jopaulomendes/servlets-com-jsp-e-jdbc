package servlets;

import java.io.Serializable;

import dao.DaoUsuarioRepository;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class ServletGenericUtils extends HttpServlet implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private DaoUsuarioRepository repository = new DaoUsuarioRepository();

	public long getUsuarioLogado(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		String usuarioLogado = (String) session.getAttribute("usuario");
		
		return repository.pesquisarUsuarioLogado(usuarioLogado).getId();
	}
}
