<%@page import="dao.DaoDisciplina"%>
<%@page import="modelo.Disciplina"%>
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
int cargaHoraria = Integer.parseInt(request.getParameter("cargaHoraria"));

Disciplina disciplina = new Disciplina();
DaoDisciplina dao = new DaoDisciplina();

if(id == 0){
	disciplina.setNome(nome);
	disciplina.setCargaHoraria(cargaHoraria);
	dao.insert(disciplina);	
}else{
	disciplina.setId(id);
	disciplina.setNome(nome);
	disciplina.setCargaHoraria(cargaHoraria);
	dao.update(disciplina);
}
%>
<script>
alert("Registo incluído/alterado com sucesso.")
window.location.replace("index.jsp");
</script>
</body>
</html>