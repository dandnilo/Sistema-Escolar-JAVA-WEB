package visao;

import dao.DaoAluno;
import modelo.Aluno;

public class FormUpdate {

	public static void main(String[] args) {
		DaoAluno dao = new DaoAluno();
		Aluno aluno = new Aluno("Rodrigo Santos", "santos@email.com");
		aluno.setId(8);
		
		dao.update(aluno);

	}

}
