package utils;

import java.util.List;

import dao.DaoAluno;
import modelo.Aluno;
import modelo.AlunoDisciplina;
import modelo.Turma;

public class SelectTodasInformacoes {

	public static void main(String[] args) {
		DaoAluno daoAluno = new DaoAluno();
		Aluno aluno = daoAluno.selectById(2);
		
		System.out.println("Informações do aluno " + aluno.getNome());
		
		System.out.println("RA: " + aluno.getRa().getNumero());
		System.out.println("Nome: " + aluno.getNome());
		System.out.println("Email: " + aluno.geteMail());
		System.out.println("-------------------");
		
		System.out.println("Informações da turma do aluno: " + aluno.getNome());
		
		Turma turma = aluno.getTurma();
		
		System.out.println("Nome: " + aluno.getTurma().getNome());
		System.out.println("Ano: " + aluno.getTurma().getAno());
		System.out.println("-------------------");
		
        List<AlunoDisciplina> disciplinas = aluno.getDisciplinas();
		
		System.out.println("Relação de disciplinas do aluno: " + aluno.getNome());
		
		for(AlunoDisciplina ad : disciplinas) {
			System.out.println("ID: " + ad.getDisciplina().getId());
			System.out.println("Nome: " + ad.getDisciplina().getNome());
			System.out.println("Carga Horária: " + ad.getDisciplina().getCargaHoraria());
			System.out.println("Nota 1: " + ad.getNota1());
			System.out.println("Nota 2: " + ad.getNota2());
			System.out.println("-------------------");
		}
	}

}
