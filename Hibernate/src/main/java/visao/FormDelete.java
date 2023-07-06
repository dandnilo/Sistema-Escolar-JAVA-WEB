package visao;

import dao.DaoAluno;
import modelo.Aluno;

public class FormDelete {

	public static void main(String[] args) {
		Aluno aluno = new Aluno();
		aluno.setId(3);
		aluno.setNome("Tulio");
		aluno.seteMail("mail");
		
		DaoAluno dao = new DaoAluno();
		dao.delete(aluno);
	}

}
