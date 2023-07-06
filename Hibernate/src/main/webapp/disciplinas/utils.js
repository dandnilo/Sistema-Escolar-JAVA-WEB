function editarDisciplina(id){
	var uri = 'http://localhost:8080/Hibernate/DisciplinaServlet'

    $.get(uri + '?id=' + id, function (turma) {
        $('#idRef').val(turma.id)
        $('#nome').val(turma.nome)
        $('#cargaHoraria').val(turma.cargaHoraria)
    })
}

function incluirDisciplina(){
	$('#idRef').val(0)
}

function limparPesquisa(){
	$('#pesquisa').val('')
	$('#pesquisar').click()
	
}