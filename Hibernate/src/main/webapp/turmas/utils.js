function editarTurma(id){
	var uri = 'http://localhost:8080/Hibernate/TurmaServlet'

    $.get(uri + '?id=' + id, function (turma) {
        $('#idRef').val(turma.id)
        $('#nome').val(turma.nome)
        $('#ano').val(turma.ano)
    })
}

function incluirTurma(){
	$('#idRef').val(0)
}

function limparPesquisa(){
	$('#pesquisa').val('')
	$('#pesquisar').click()
	
}

