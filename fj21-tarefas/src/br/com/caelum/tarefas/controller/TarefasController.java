package br.com.caelum.tarefas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.dao.JdbcTarefaDao;
import br.com.caelum.tarefas.modelo.Tarefa;
 
@Controller
public class TarefasController {
	 
	//	Chamando o formulario para aparecer na tela atraves da URL mapeada.
	// novaTarefa e a URL do navegador
	@RequestMapping("novaTarefa")
	public String form(){
		// Retorna a pagina formulario que esta em WEB-INF
		return "tarefa/formulario"; 
	}
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(Tarefa tarefa) {
		JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.adiciona(tarefa);
		return "tarefa/adicionada";
	}
}
