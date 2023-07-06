<%@page import="modelo.Disciplina"%>
<%@page import="dao.DaoDisciplina"%>
<%@page import="java.util.List"%>
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
		        <a class="nav-link" href="../turmas">Turmas</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link active" href="#">Disciplinas</a>
		      </li>
		    </ul>
		  </div>
		</nav>
		<!--  FIM DO NAVBAR -->
		
		<!-- INICIO DO CARD -->
		<div class="card">
			<div class="card-header">
				<h5>Controle de Disciplinas</h5>
			</div>
			<div class="card-body">
				<form action="index.jsp" method="post">
				<div class="row">
                    <label for="pesquisa" class="text-end mt-2 col-md-4 col-sm-6 col-form-label">Nome:</label>
                    <div class="col-md-4 col-sm-6 mt-2">
                        <input type="text" class="form-control" id="pesquisa" placeholder="Nome da disciplina" name="pesquisa">
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
							<th>Nome</th>
							<th>Carga Horária</th>
							<th colspan="2">Operações</th>
						</tr>
					</thead>
					<tbody>
						<%
						DaoDisciplina dao = new DaoDisciplina();
						List<Disciplina> listaDisciplina;
						String pesquisa = "";
						
						try{
							pesquisa = request.getParameter("pesquisa");
						}catch (Exception e){
							
						}
						
						if((pesquisa == null) || (pesquisa == "")){
							listaDisciplina = dao.selectAll();
						}else{
							listaDisciplina = dao.selectByNome(pesquisa);
						}
						
						for (Disciplina disciplina : listaDisciplina) {
						%>
						<tr>
							<td><%=disciplina.getId()%></td>
							<td><%=disciplina.getNome()%></td>
							<td><%=disciplina.getCargaHoraria()%></td>
							<td><button data-bs-toggle="modal" data-bs-target="#modalInclusao" class="btn btn-warning btn-sm" onclick="editarDisciplina(<%=disciplina.getId() %>)">Editar</button></td>
							<td><a href="excluir.jsp?id=<%=disciplina.getId() %>" class="btn btn-danger btn-sm">Excluir</a></td>
							<td></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="card-footer">
				<button class="btn btn-primary btn-small" type="submit" onclick="incluirDisciplina()"
						data-bs-toggle="modal" data-bs-target="#modalInclusao">Novo Registro
				</button>
			</div>
		</div>
	</div>
	<!-- FIM DO CARD -->

	<!-- INÍCIO MODAL INCLUSÃO E ALTERAÇÃO DE REGISTROS -->
	<div class="modal fade" id="modalInclusao" data-bs-backdrop="static"
		data-bs-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title">Cadastro de Disciplinas</h4>
				</div>

				<div class="modal-body">
					<form action="gravar.jsp" method="post">
						<input type="hidden" name="idRef" id="idRef">
					
						<label class="form-label" for="nome">Nome</label> 
						<input class="form-control" type="text" name="nome" id="nome">

						<label class="form-label" for="cargaHoraria">Carga horária</label> 
						<input class="form-control" type="text" name="cargaHoraria" id="cargaHoraria">
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