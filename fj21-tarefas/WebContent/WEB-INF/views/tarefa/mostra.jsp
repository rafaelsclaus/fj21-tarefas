<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editar Tarefas</title>
<link type="text/css" href="resources/css/tarefas.css" rel="stylesheet" />
</head>
<body>
	<h3>Alterar Tarefa - ${tarefa.id} </h3>
	<form action="alteraTarefa" method="post">

		<input type="hidden" name="id" value="${tarefa.id}" /> Descricao: <br />
		<textarea name="descricao" rows="5" cols="100">
				${tarefa.descricao}
			</textarea>
		<br />
		
		Finalizado?<input type="checkbox" name="finalizado"
					value="true" ${tarefa.finalizado? 'checked' : ''} /> <br />
					
		Data de finalizacão: <br />
		
		<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" var="data" />
		<input type="text" name="dataFinalizacao" value="${data}" />			
		
		<br />
		
		<input type="submit" value="Alterar" />
	</form>
</body>
</html>