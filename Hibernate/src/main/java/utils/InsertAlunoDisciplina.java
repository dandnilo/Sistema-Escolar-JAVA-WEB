package utils;

import dao.DaoAluno;
import dao.DaoAlunoDisciplina;
import dao.DaoDisciplina;
import modelo.Aluno;
import modelo.AlunoDisciplina;
import modelo.Disciplina;

public class InsertAlunoDisciplina {

	public static void main(String[] args) {
		DaoAluno daoAluno = new DaoAluno();
		DaoDisciplina daoDisciplina = new DaoDisciplina();
		
		Aluno aluno = daoAluno.selectById(1);
		Disciplina disciplina = daoDisciplina.selectById(1);
		
		AlunoDisciplina ad = new AlunoDisciplina(0, 0, aluno, disciplina);
		DaoAlunoDisciplina daoAD = new DaoAlunoDisciplina();
		
		daoAD.insert(ad);

	}

}
