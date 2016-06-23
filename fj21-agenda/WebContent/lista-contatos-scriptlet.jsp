<%@ page
	import="java.util.*,
	     br.com.caelum.agenda.dao.*,
	     br.com.caelum.agenda.modelo.*,
	     java.util.Calendar,
	     java.text.SimpleDateFormat,
	     java.text.DateFormat,
	     java.text.Format,
	     java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Nome</th>
				<th>Email</th>
				<th>Endereco</th>
				<th>Data de Nascimento</th>
			</tr>
		</thead>
		<%
			ContatoDao dao = new ContatoDao();
			List<Contato> contatos = dao.getLista();
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			for (Contato contato : contatos) {
		%>
		<tbody>
			<tr>
				<td><%=contato.getNome()%></td>
				<td><%=contato.getEmail()%></td>
				<td><%=contato.getEndereco()%></td>
				<td><%=sdf.format(contato.getDataNascimento().getTime())%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>