
<%@page import="modelo.Disciplina"%>
<%@page import="dao.DaoDisciplina"%>
<%@page import="modelo.AlunoDisciplina"%>
<%@page import="dao.DaoAluno"%>
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Turma"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoTurma"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
int id = Integer.parseInt(request.getParameter("id"));
DaoAluno dao = new DaoAluno();
Aluno aluno = dao.selectById(id);

DaoDisciplina daoDisciplina = new DaoDisciplina();
List<Disciplina> listaDisciplinas = daoDisciplina.selectAll();
%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
					<li class="nav-item"><a class="nav-link" href="../alunos">Alunos</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="#">Turmas</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="../disciplinas">Disciplinas</a>
					</li>
				</ul>
			</div>
		</nav>
		<!--  FIM DO NAVBAR -->

		<hr>

		<!-- INICIO DO CARD -->
		<div class="card">
			<div class="card-header" style="background-color: darkblue;">
				<h5 style="text-align: center; color: white; font-family:arial; font-size: 150%">Informações Pessoais:</h5>
			</div>
			<div class="card-body">
				<%
				DaoTurma daoTurma = new DaoTurma();
				Turma turma = aluno.getTurma();
				%>
				<h6>
					Informações do aluno: <%=aluno.getNome()%></h6>

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
						<tr>
							<td><%=aluno.getId()%></td>
							<td><%=aluno.getRa().getNumero()%></td>
							<td><%=aluno.getNome()%></td>
							<td><%=aluno.geteMail()%></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="card-footer"></div>
		</div>
		<!-- FIM DO CARD -->

<hr>

		<!-- INICIO DO CARD -->
		<div class="card">
			<div class="card-header" style="background-color: lime;">
				<h5 style="text-align: center; color: white; font-family:arial; font-size: 150%">Informações Acadêmicas:</h5>
			</div>
			<div class="card-body">
				<h6>
					Turma do aluno: <%=aluno.getNome()%></h6>

				<hr>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Código</th>
							<th>Nome</th>
							<th>Ano</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=aluno.getTurma().getId()%>
							<td><%=aluno.getTurma().getNome()%></td>
							<td><%=aluno.getTurma().getAno()%></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="card-footer"></div>
		</div>
		<!-- FIM DO CARD -->

<hr>

		<!-- INICIO DO CARD -->
		<div class="card">
			<div class="card-header" style="background-color: aqua">
				<h5 style="text-align: center; color: white; font-family:arial; font-size: 150%">Relação de disciplinas:</h5>
			</div>
			<div class="card-body">
				<h6>
					Relação de disciplinas do aluno: <%=aluno.getNome()%></h6>

				<hr>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Código</th>
							<th>Nome</th>
							<th>Carga Horária</th>
							<th>Nota 1</th>
							<th>Nota 2</th>
							<th colspan="2">Operações</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (AlunoDisciplina ad : aluno.getDisciplinas()) {
						%>

						<tr>
							<td><%=ad.getId()%></td>
							<td><%=ad.getDisciplina().getNome()%></td>
							<td><%=ad.getDisciplina().getCargaHoraria()%></td>
							<td><%=ad.getNota1()%></td>
							<td><%=ad.getNota2()%></td>
							<td><button data-bs-toggle="modal" data-bs-target="#modalDisciplina" class="btn btn-warning btn-sm" onclick="editarAlunoDisciplina(<%=ad.getId()%>)">Editar</button></td>
							<td><a
								href="excluirDisciplina.jsp?idAlunoDisciplina=<%=ad.getId()%>&idAluno=<%=ad.getAluno().getId() %>" class="btn btn-danger btn-sm">Excluir</a>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="card-footer">
				<button class="btn btn-primary btn-small" type="submit" onclick="incluirAD()" data-bs-toggle="modal" data-bs-target="#modalDisciplina">Incluir Disciplina</button>
			</div>
		</div>
		<!-- FIM DO CARD -->

		<!-- INÍCIO MODAL INCLUSÃO E ALTERAÇÃO DE REGISTROS -->
		<div class="modal fade" id="modalDisciplina" data-bs-backdrop="static" data-bs-keyboard="false">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<h4 class="modal-title">Cadastro de Disciplinas</h4>
					</div>

					<div class="modal-body">
						<form action="gravarDisciplina.jsp" method="post">
						
							<input type="hidden" name="idAluno" id="idAluno" value=<%=aluno.getId()%>> 
							
							<input type="hidden" name="idAlunoDisciplina" id="idAlunoDisciplina"> 
							
							<select name="disciplina" id="disciplina" class="form-select">
								<%
								for (Disciplina disciplina : listaDisciplinas) {
								%>
								<option value="<%=disciplina.getId()%>"><%=disciplina.getNome()%></option>
								<%
								}
								%>
							</select> <label class="form-label" for="nota1">Nota 1: </label><input class="form-control" type="text" name="nota1" id="nota1">

							<label class="form-label" for="nota2">Nota 2: </label><input class="form-control" type="text" name="nota2" id="nota2">
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Gravar</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<!-- FIM MODAL INCLUSÃO E ALTERAÇÃO DE REGISTROS -->
		
</body>
</html>