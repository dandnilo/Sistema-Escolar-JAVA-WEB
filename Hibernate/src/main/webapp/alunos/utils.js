function editarAluno(id){
	var uri = 'http://localhost:8080/Hibernate/AlunoServlet'

    $.get(uri + '?id=' + id, function (aluno) {
        $('#idRef').val(aluno.id)
        $('#nome').val(aluno.nome)
        $('#email').val(aluno.eMail)
        $('#ra').val(aluno.ra.numero)
        $('#turma').val(aluno.turma.id).change()
    })
}

function editarAlunoDisciplina(id){
	var uri = 'http://localhost:8080/Hibernate/AlunoDisciplinaServlet'
	
	limpaCamposAD()
	
    $.get(uri + '?id=' + id, function (ad) {
	    $('#idAlunoDisciplina').val(ad.id)
	    $('#disciplina').val(ad.disciplina.id).change();
        $('#nota1').val(ad.nota1)
        $('#nota2').val(ad.nota2)
    })
}

function incluirAluno(){
	$('#idRef').val(0)
	
	limpaCampos()
}

function incluirAD(){
	limpaCamposAD()
	
	$('#idAlunoDisciplina').val(0)
}

function limpaCamposAD(){
    $('#idAlunoDisciplina').val('')
	$('#disciplina').val('').change();
	$('#nota1').val('')
	$('#nota2').val('')
}

function limpaCampos(){
    $('#nome').val('')
	$('#email').val('')
	$('#ra').val('')
	$('#turma').val('')
}