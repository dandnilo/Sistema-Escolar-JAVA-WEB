<%@page import="modelo.Turma"%>
<%@page import="dao.DaoTurma"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoAluno"%>
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
		        <a class="nav-link active" href="#">Alunos</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="../turmas">Turmas</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="../disciplinas">Disciplinas</a>
		      </li>
		    </ul>
		  </div>
		</nav>
		<!--  FIM DO NAVBAR -->
		
		<div class="card">
			<div class="card-header">
				<h5>Controle de Alunos</h5>
			</div>
			<div class="card-body">
				<form action="index.jsp" method="post">
				<div class="row">
                    <label for="pesquisa" class="text-end mt-2 col-md-4 col-sm-6 col-form-label">Nome:</label>
                    <div class="col-md-4 col-sm-6 mt-2">
                        <input type="text" class="form-control" id="pesquisa" placeholder="Nome do aluno" name="pesquisa">
                    </div>
                    
                    <div class="col-md-2 col-sm-6 d-grid mt-2">
                        <button type="submit" class="btn btn-info btn-block" name="pesquisar" id="pesquisar">Procurar</button>
                    </div>

                    <div class="col-md-2 col-sm-6 d-grid mt-2">
                        <button class="btn btn-secondary btn-block" onclick="limparPesquisa()">Limpar</button>
                    </div>
                </div>
                </form>

                <hr>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Código</th>
							<th>RA</th>
							<th>Nome</th>
							<th>E-mail</th>
							<th>Turma</th>
							<th colspan="3">Operações</th>
						</tr>
					</thead>
					<tbody>
						<%
						DaoAluno dao = new DaoAluno();
						List<Aluno> listaAluno;
						String pesquisa = "";
						
						try{
							pesquisa = request.getParameter("pesquisa");
						}catch (Exception e){
							
						}
						
						if((pesquisa == null) || (pesquisa == "")){
							listaAluno = dao.selectAll();
						}else{
							listaAluno = dao.selectByNome(pesquisa);
						}
						
						for (Aluno aluno : listaAluno) {
						%>
						<tr>
							<td><%=aluno.getId()%></td>
							<td><%=aluno.getRa().getNumero()%></td>
							<td><%=aluno.getNome()%></td>
							<td><%=aluno.geteMail()%></td>
							<td><%=aluno.getTurma().getNome()%></td>
							<td><a href="detalhes.jsp?id=<%=aluno.getId() %>" class="btn btn-info btn-sm">Informações</a></td>
							<td><button data-bs-toggle="modal" data-bs-target="#modalInclusao" class="btn btn-warning btn-sm" onclick="editarAluno(<%=aluno.getId() %>)">Editar</button></td>
							<td><a href="excluir.jsp?id=<%=aluno.getId() %>" class="btn btn-danger btn-sm">Excluir</a></td>
							<td></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="card-footer">
				<button class="btn btn-primary btn-small" type="submit" onclick="incluirAluno()"
						data-bs-toggle="modal" data-bs-target="#modalInclusao">Novo Registro
				</button>
			</div>
		</div>
	</div>

	<!-- INÍCIO MODAL INCLUSÃO E ALTERAÇÃO DE REGISTROS -->
	<div class="modal fade" id="modalInclusao" data-bs-backdrop="static"
		data-bs-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title">Cadastro de Alunos</h4>
				</div>

				<div class="modal-body">
					<form action="gravar.jsp" method="post">
						<input type="hidden" name="idRef" id="idRef">
						<label class="form-label" for="ra">RA</label> 
						<input class="form-control" type="text" name="ra" id="ra">
					
						<label class="form-label" for="nome">Nome</label> 
						<input class="form-control" type="text" name="nome" id="nome">

						<label class="form-label" for="email">E-mail</label> 
						<input class="form-control" type="email" name="email" id="email">
						
						<label class="form-label" for="turma">Turma</label>
						<select name="turma" id="turma" class="form-select">
							<%
							DaoTurma daoTurma = new DaoTurma();
							List<Turma>turmas = daoTurma.selectAll();
							for(Turma turma : turmas){
							%>
								<option value="<%=turma.getId() %>"><%=turma.getNome() %></option>
							<%
							}
							%>
						</select>
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