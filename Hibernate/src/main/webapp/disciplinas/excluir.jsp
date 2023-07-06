<%@page import="dao.DaoDisciplina"%>
<%@page import="modelo.Disciplina"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Disciplina disciplina = new Disciplina();
	disciplina.setId(id);
	
	DaoDisciplina dao = new DaoDisciplina();
	dao.delete(disciplina);
%>
<script>
alert("Registo excluído com sucesso.")
window.location.replace("index.jsp");
</script>
</body>
</html>