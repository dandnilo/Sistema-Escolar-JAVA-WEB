package utils;

import java.util.List;

import dao.DaoTurma;
import modelo.Aluno;
import modelo.Turma;

public class SelectAlunosFromTurma {

	public static void main(String[] args) {
		DaoTurma dao = new DaoTurma();
		
		Turma turma = dao.selectById(1);
		
		System.out.println("Nome: " + turma.getNome());
		System.out.println("Ano: " + turma.getAno());
		
		List<Aluno> alunos = turma.getAlunos();
		
		for(Aluno alunoTMP : alunos) {
			System.out.println("Nome: " + alunoTMP.getNome());
			System.out.println("E-mail: " + alunoTMP.geteMail());
		}
	}

}
