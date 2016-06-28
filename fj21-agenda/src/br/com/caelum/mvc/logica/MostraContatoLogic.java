package br.com.caelum.mvc.logica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.agenda.dao.ContatoDao;
import br.com.caelum.agenda.modelo.Contato;

public class MostraContatoLogic implements Logica{

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		long id = Long.parseLong(req.getParameter("id"));
				
		ContatoDao dao = new ContatoDao();
		
		Contato contato = dao.buscaPorId(id);
		
		req.setAttribute("contato", contato);
		
		return "mostra.jsp";
	}

}
