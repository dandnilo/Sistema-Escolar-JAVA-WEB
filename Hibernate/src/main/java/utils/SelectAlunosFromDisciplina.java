package utils;

import java.util.List;

import dao.DaoDisciplina;
import modelo.AlunoDisciplina;
import modelo.Disciplina;

public class SelectAlunosFromDisciplina {

	public static void main(String[] args) {
		DaoDisciplina daoDisciplina = new DaoDisciplina();
		
		Disciplina disciplina = daoDisciplina.selectById(2);
		
		List<AlunoDisciplina> alunos = disciplina.getAlunos();
		
		System.out.println("\nDisciplina: " + disciplina.getNome());
		
		for(AlunoDisciplina ad : alunos) {
			System.out.println("RA: " + ad.getAluno().getRa().getNumero());
			System.out.println("Nome: " + ad.getAluno().getNome());
			System.out.println("Turma: " + ad.getAluno().getTurma().getNome());
			System.out.println("Nota 1: " + ad.getNota1());
			System.out.println("Nota 2: " + ad.getNota2());
			System.out.println("-------------------");
		}
	}
}
