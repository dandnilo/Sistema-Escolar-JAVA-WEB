<%@page import="modelo.Aluno"%>
<%@page import="dao.DaoAluno"%>
<%@page import="dao.DaoAlunoDisciplina"%>
<%@page import="modelo.AlunoDisciplina"%>
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
int id_aluno = Integer.parseInt(request.getParameter("idAluno"));
int id_disciplina = Integer.parseInt(request.getParameter("disciplina"));
int id_alunoDisciplina = Integer.parseInt(request.getParameter("idAlunoDisciplina"));

double nota1 = 0.00;
double nota2 = 0.00;

String nome = request.getParameter("disciplina");

try{
	nota1 = Double.parseDouble(request.getParameter("nota1"));
	nota2 = Double.parseDouble(request.getParameter("nota2"));
}catch(Exception e){
	
}

DaoAluno daoAluno = new DaoAluno();
Aluno aluno = daoAluno.selectById(id_aluno);

DaoDisciplina daoDisciplina = new DaoDisciplina();
Disciplina disciplina = daoDisciplina.selectById(id_disciplina);

AlunoDisciplina ad = new AlunoDisciplina();
DaoAlunoDisciplina daoAD = new DaoAlunoDisciplina();

if(id_alunoDisciplina == 0){
	ad.setNota1(nota1);
	ad.setNota2(nota2);
	ad.setAluno(aluno);
	ad.setDisciplina(disciplina);
	
	daoAD.insert(ad);
}
else{
	ad = daoAD.selectById(id_alunoDisciplina);
	ad.setNota1(nota1);
	ad.setNota2(nota2);
	
	daoAD.update(ad);
}
%>
<script>
alert("Registro incluído/alterado com sucesso.")
window.location.replace("detalhes.jsp?id=<%=request.getParameter("idAluno")%>")
</script>
</body>
</html>