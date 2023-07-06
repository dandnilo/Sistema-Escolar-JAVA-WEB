<%@page import="dao.DaoAluno"%>
<%@page import="modelo.Aluno"%>
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
	Aluno aluno = new Aluno();
	aluno.setId(id);
	
	DaoAluno dao = new DaoAluno();
	dao.delete(aluno);
%>
<script>
alert("Registo excluído com sucesso.")
window.location.replace("index.jsp");
</script>
</body>
</html>