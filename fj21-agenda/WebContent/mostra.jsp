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

<c:import url="cabecalho.jsp" />

	<h1>Altera contatos</h1>

	<hr />

	<form action="mvc" method="get">
 			  <input type="hidden" name="logica" value="AlteraContatoLogic"/>  <!-- Variavel e valor para direcionar para classe-->
			  <input type="hidden" name="id" value="${contato.id }"/>          <!-- Variavel e valor do primeiro parametro id -->
			Nome: <input type="text" name="nome" value="${contato.nome }"/><br /> 
			E-mail: <input type="text" name="email" value="${contato.email }"/><br /> 
			Endereco: <input type="text" name="endereco" value="${contato.endereco }"/><br /> 
			<fmt:formatDate value="${contato.dataNascimento.time}" pattern="dd/MM/yyyy" var="data"/>
			Data Nascimento: <input type="text" name="dataNascimento" value="${data}"/><br /> 
			
			<input type="submit" value="Alterar"/>
	</form>
	<c:import url="rodape.jsp" />
</body>
</html>