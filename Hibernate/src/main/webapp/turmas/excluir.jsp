<%@page import="dao.DaoTurma"%>
<%@page import="modelo.Turma"%>
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
	Turma turma = new Turma();
	turma.setId(id);
	
	DaoTurma dao = new DaoTurma();
	dao.delete(turma);
%>
<script>
alert("Registo excluído com sucesso.")
window.location.replace("index.jsp");
</script>
</body>
</html>