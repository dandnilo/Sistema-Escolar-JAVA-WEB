<%@page import="dao.DaoAlunoDisciplina"%>
<%@page import="modelo.AlunoDisciplina"%>
<%@page import="dao.DaoAluno"%>
<%@page import="modelo.Aluno"%>
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
    int id_aluno = Integer.parseInt(request.getParameter("idAluno"));
	int id = Integer.parseInt(request.getParameter("idAlunoDisciplina"));
    DaoAluno daoAluno = new DaoAluno();
    DaoDisciplina daoDisciplina = new DaoDisciplina();

    Aluno aluno = daoAluno.selectById(id);

    DaoAlunoDisciplina daoAD = new DaoAlunoDisciplina();
    AlunoDisciplina ad = daoAD.selectById(id);
    
    daoAD.delete(ad);
%>
<script>
alert("Registro excluído com sucesso.")
window.location.replace("detalhes.jsp?id=<%=request.getParameter("idAluno")%>")	
</script>
</body>
</html>