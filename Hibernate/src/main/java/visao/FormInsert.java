package visao;

import dao.DaoAluno;
import modelo.Aluno;

public class FormInsert {

	public static void main(String[] args) {
		Aluno a = new Aluno("Tulio Calixto2", "tulio@email.com");
		Aluno b = new Aluno("Tulio Calixto", "tulio@email.com");
		DaoAluno dao = new DaoAluno();
		dao.insert(a);
		dao.insert(b);
		
		System.out.println("Registro inserido com sucesso.");
	}

}
