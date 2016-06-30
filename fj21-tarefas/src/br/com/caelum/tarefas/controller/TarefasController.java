package br.com.caelum.tarefas.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {
		
		if(result.hasFieldErrors("descricao")){
			return form();
		}
		
		JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.adiciona(tarefa);
		return "tarefa/adicionada";
	}
	@RequestMapping("listaTarefas")
	public String lista(Model model) {
		JdbcTarefaDao dao = new JdbcTarefaDao();
		model.addAttribute("tarefas", dao.lista());
		return "tarefa/lista";
	}
	
	@RequestMapping("listaTarefasModelAndView")
	public ModelAndView lista() {
		JdbcTarefaDao dao = new JdbcTarefaDao();
		List<Tarefa> tarefas = dao.lista();
		
		ModelAndView mv = new ModelAndView("tarefa/lista");
		mv.addObject("tarefas", tarefas);
		return mv;
	}
	
	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa){
		new JdbcTarefaDao().remove(tarefa);
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model){
		JdbcTarefaDao dao = new JdbcTarefaDao();
		model.addAttribute("tarefa", dao.buscaPorId(id));
		return "tarefa/mostra";
	}

	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa){
		new JdbcTarefaDao().altera(tarefa);
		return "redirect:listaTarefas";
	}

}
