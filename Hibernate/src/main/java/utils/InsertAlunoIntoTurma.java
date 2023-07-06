package utils;

import dao.DaoAluno;
import dao.DaoTurma;
import modelo.Aluno;
import modelo.RA;
import modelo.Turma;

public class InsertAlunoIntoTurma {

	public static void main(String[] args) {
		DaoTurma daoTurma = new DaoTurma();
		DaoAluno daoAluno = new DaoAluno();
		
		Turma turma = daoTurma.selectById(1);
		
		Aluno aluno = new Aluno();
		RA ra1 = new RA("1111");
		aluno.setNome("Aula ManyToOne");
		aluno.seteMail("relacionamento@mail.com");
		aluno.setTurma(turma);
		aluno.setRa(ra1);
		
		Aluno aluno2 = new Aluno("Aluno 2", "Aluno2@email.com");
		RA ra2 = new RA("2222");
		aluno2.setTurma(turma);
		aluno2.setRa(ra2);
		
		Aluno aluno3 = new Aluno("Aluno 3", "Aluno3@email.com");
		RA ra3 = new RA("3333");
		Turma turma2 = daoTurma.selectById(2);
		aluno3.setTurma(turma2);
		aluno3.setRa(ra3);
		
		daoAluno.insert(aluno);
		daoAluno.insert(aluno2);
		daoAluno.insert(aluno3);
	}

}
