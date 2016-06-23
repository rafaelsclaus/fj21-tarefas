<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:import url="cabecalho.jsp"></c:import>
	<jsp:useBean id="dao" class="br.com.caelum.agenda.dao.ContatoDao"></jsp:useBean>

	<table border="1">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Email</th>
				<th>Endereco</th>
				<th>Data Nascimento</th>
			</tr>
		</thead>
		<tbody>
			<!-- percorre contatos montando as linhas da tabela -->
			<c:forEach var="contato" items="${dao.lista}" varStatus="id">
				<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }">
					<td>${contato.nome }</td>

					<td><c:if test="${not empty contato.email }">
							<a href="mailto:${contato.email}">${contato.email }</a>
						</c:if> <c:if test="${empty contato.email }">
							Email nao informado.
						</c:if></td>
					<td>${contato.endereco }</td>
					<td>${contato.dataNascimento.time }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:import url="rodape.jsp"></c:import>
</body>
</html>