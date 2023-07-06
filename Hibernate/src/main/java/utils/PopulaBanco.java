package utils;

import dao.DaoAluno;
import dao.DaoDisciplina;
import dao.DaoTurma;
import modelo.Aluno;
import modelo.Disciplina;
import modelo.RA;
import modelo.Turma;

public class PopulaBanco {

	public static void main(String[] args) {
		DaoTurma daoTurma = new DaoTurma();
		DaoDisciplina daoDisciplina = new DaoDisciplina();
		DaoAluno daoAluno = new DaoAluno();
		
		Turma t1 = new Turma("ADS - TURMA 01", 2000);
		Turma t2 = new Turma("GTI - TURMA 01", 2018);
		Turma t3 = new Turma("ADS - TURMA 03", 2020);
		daoTurma.insert(t1);
		daoTurma.insert(t2);
		daoTurma.insert(t3);
		
		Disciplina d1 = new Disciplina("Desenvolvimento Web I", 80);
		Disciplina d2 = new Disciplina("Desenvolvimento Web II", 80);
		Disciplina d3 = new Disciplina("Logica de Programacao", 80);
		daoDisciplina.insert(d1);
		daoDisciplina.insert(d2);
		daoDisciplina.insert(d3);
		
		Aluno a1 = new Aluno("Tulio Calixto", "tulio@email.com");
		Aluno a2 = new Aluno("Ana Maria", "ana@email.com");
		Aluno a3 = new Aluno("Joao Paulo", "jp@email.com");
		
		RA ra1 = new RA("111");
		RA ra2 = new RA("222");
		RA ra3 = new RA("333");
		
		a1.setRa(ra1);
		a2.setRa(ra2);
		a3.setRa(ra3);
		
		a1.setTurma(t1);
		a2.setTurma(t2);
		a3.setTurma(t3);
		
		daoAluno.insert(a1);
		daoAluno.insert(a2);
		daoAluno.insert(a3);
	}

}
