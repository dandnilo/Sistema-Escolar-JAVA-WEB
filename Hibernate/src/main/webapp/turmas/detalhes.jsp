
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Turma"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoTurma"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="utils.js"></script>
<meta charset="UTF-8">
<title>Sistema de Gerenciamento Acadêmico</title>
</head>
<body class="bg-light pt-3">
	<div class="container">
		<h1 class="text-center">Sistema de Gerenciamento Acadêmico</h1>
		<hr>
		
		<!-- INICIO DO NAVBAR -->
		<nav class="navbar navbar-expand-sm bg-light">
		  <div class="container-fluid">
		    <!-- Links -->
		    <ul class="navbar-nav">
		      <li class="nav-item">
		        <a class="nav-link" href="../alunos">Alunos</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link active" href="#">Turmas</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="../disciplinas">Disciplinas</a>
		      </li>
		    </ul>
		  </div>
		</nav>
		<!--  FIM DO NAVBAR -->
		
		<!-- INICIO DO CARD -->
		<div class="card">
			<div class="card-header">
				<h5>Controle de Turmas</h5>
			</div>
			<div class="card-body">
			<%
			int id = Integer.parseInt(request.getParameter("id"));
			DaoTurma dao = new DaoTurma();
			Turma turma = dao.selectById(id);
			%>
			<h6>Relação de alunos da turma: <%=turma.getNome()%></h6>

                <hr>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Código</th>
							<th>RA</th>
							<th>Nome</th>
							<th>Email</th>
						</tr>
					</thead>
					<tbody>
						<%	
						List<Aluno> alunos = turma.getAlunos();
						
						for(Aluno alunoTMP : alunos) {
						%>
						<tr>
							<td><%=alunoTMP.getId()%></td>
							<td><%=alunoTMP.getRa().getNumero()%></td>
							<td><%=alunoTMP.getNome()%></td>
							<td><%=alunoTMP.geteMail()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="card-footer">
			<a href="index.jsp" class="btn btn-sm btn-primary">Voltar</a>
			</div>
		</div>
	</div>
	<!-- FIM DO CARD -->
</body>
</html>