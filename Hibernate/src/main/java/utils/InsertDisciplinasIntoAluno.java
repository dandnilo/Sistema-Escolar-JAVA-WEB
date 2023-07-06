package utils;

import dao.DaoAluno;
import dao.DaoAlunoDisciplina;
import dao.DaoDisciplina;
import modelo.Aluno;
import modelo.AlunoDisciplina;
import modelo.Disciplina;

public class InsertDisciplinasIntoAluno {

	public static void main(String[] args) {
		DaoAluno daoAluno = new DaoAluno();
		DaoDisciplina daoDisciplina = new DaoDisciplina();
		DaoAlunoDisciplina dao = new DaoAlunoDisciplina();
		
		Aluno a1 = daoAluno.selectById(1);
		Aluno a2 = daoAluno.selectById(2);
		
		Disciplina d1 = daoDisciplina.selectById(1);
		Disciplina d2 = daoDisciplina.selectById(2);
		Disciplina d3 = daoDisciplina.selectById(3);
		
		AlunoDisciplina ad1 = new AlunoDisciplina(10, 7, a1, d1);
		AlunoDisciplina ad2 = new AlunoDisciplina(8, 6, a1, d2);
		AlunoDisciplina ad3 = new AlunoDisciplina(6, 2, a2, d2);
		AlunoDisciplina ad4 = new AlunoDisciplina(4, 10, a2, d3);
		
		dao.insert(ad1);
		dao.insert(ad2);
		dao.insert(ad3);
		dao.insert(ad4);

	}

}
