<%@page import="dao.DaoTurma"%>
<%@page import="modelo.Turma"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inclusão de Registros</title>
</head>
<body>
<%
int id = Integer.parseInt(request.getParameter("idRef"));
String nome = request.getParameter("nome");
int ano = Integer.parseInt(request.getParameter("ano"));

Turma turma = new Turma();
DaoTurma dao = new DaoTurma();

if(id == 0){
	turma.setNome(nome);
	turma.setAno(ano);
	dao.insert(turma);	
}else{
	turma.setId(id);
	turma.setNome(nome);
	turma.setAno(ano);
	dao.update(turma);
}
%>
<script>
alert("Registo incluído/alterado com sucesso.")
window.location.replace("index.jsp");
</script>
</body>
</html>