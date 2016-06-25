package br.com.caelum.mvc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.mvc.logica.Logica;

@WebServlet("/mvc")
public class ControllerServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String parametro = request.getParameter("logica");
		String nomeDaClasse = "br.com.caelum.mvc.logica." + parametro;
		
		try {
			//Procura pela classe "Class.forName()" e coloca em um objeto generico "classe" de Classe
			Class classe = Class.forName(nomeDaClasse);
			
			// instanciando a classe procurada
			// Devolve um object e forca a conversao para Logica pq Logica tem o metodo executa 
			Logica logica = (Logica) classe.newInstance(); 
			// 
			String pagina = logica.executa(request, response);
			
			request.getRequestDispatcher(pagina).forward(request, response);
		} catch (Exception e) {
			throw new ServletException("A logica de negocios causou uma exececao", e);
		}
	}
}
