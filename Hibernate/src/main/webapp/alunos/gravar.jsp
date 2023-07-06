<%@page import="dao.DaoTurma"%>
<%@page import="modelo.Turma"%>
<%@page import="modelo.RA"%>

<%@page import="dao.DaoAluno"%>
<%@page import="modelo.Aluno"%>
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
String email = request.getParameter("email");
String numero = request.getParameter("ra");
int id_turma = Integer.parseInt(request.getParameter("turma"));

DaoAluno dao = new DaoAluno();
DaoTurma daoTurma = new DaoTurma();

Aluno aluno = new Aluno();
Turma turma = daoTurma.selectById(id_turma);
RA ra = new RA(numero);

aluno.setNome(nome);
aluno.seteMail(email);
aluno.setTurma(turma);
aluno.setRa(ra);

if(id == 0){	
	dao.insert(aluno);	
}else{
	aluno.setId(id);
	
	dao.update(aluno);
}
%>
<script>
alert("Registo incluído/alterado com sucesso.")
window.location.replace("index.jsp");
</script>
</body>
</html>