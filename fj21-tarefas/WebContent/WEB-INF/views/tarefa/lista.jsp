<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="novaTarefa"> Criar uma nova tarefa</a>

	<br />
	<br />

	<table border="1">
		<tr>
			<th>Id</th>
			<th>Descricão</th>
			<th>Finalizado ?</th>
			<th>Data de Finalizacao</th>
		</tr>
	
		<c:forEach items="${tarefas}" var="tarefa">
			<tr>
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>

				<c:if test="${tarefa.finalizado eq false }">
					<td>Não Finalizado</td>
				</c:if>
				
				<c:if test="${tarefa.finalizado eq true }">
					<td>Finalizado.</td>
				</c:if>
				
				<td>
					<fmt:formatDate 
					   value="${tarefa.dataFinalizacao.time}" 
					   pattern="dd/MM/yyyy"/>
				</td>
				
				<td>
					<a href="removeTarefa?id=${tarefa.id}">Remover</a>	
				</td>
			
				<td>
					<a href="mostraTarefa?id=${tarefa.id}">Alterar</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>