package utils;

import java.util.List;

import dao.DaoAluno;
import modelo.Aluno;
import modelo.AlunoDisciplina;

public class SelectDisciplinasFromAluno {

	public static void main(String[] args) {
		DaoAluno daoAluno = new DaoAluno();
		Aluno aluno = daoAluno.selectById(1);
		
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
