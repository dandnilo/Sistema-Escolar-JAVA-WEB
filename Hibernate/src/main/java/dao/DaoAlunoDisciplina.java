package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import banco.Conexao;
import modelo.AlunoDisciplina;
import modelo.Disciplina;

public class DaoAlunoDisciplina {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	
	public DaoAlunoDisciplina() {
		emf = Conexao.getConnection();
		em = emf.createEntityManager();
	}
	
	public void insert(AlunoDisciplina ad) {
		em.getTransaction().begin();
		em.persist(ad);
		em.getTransaction().commit();
	}
	
	public void update(AlunoDisciplina alunoDisciplina) {
		em.getTransaction().begin();
		
		AlunoDisciplina alunoDisciplinaBanco = new AlunoDisciplina();
		
		alunoDisciplinaBanco = em.find(AlunoDisciplina.class, alunoDisciplina.getId());
		alunoDisciplinaBanco.setAluno(alunoDisciplina.getAluno());
		alunoDisciplinaBanco.setDisciplina(alunoDisciplina.getDisciplina());
		alunoDisciplinaBanco.setNota1(alunoDisciplina.getNota1());
		alunoDisciplinaBanco.setNota2(alunoDisciplina.getNota2());
		
		em.getTransaction().commit();
	}
	
	public void delete(AlunoDisciplina alunoDisciplina) {
		em.getTransaction().begin();
		alunoDisciplina = em.find(AlunoDisciplina.class, alunoDisciplina.getId());
		em.remove(alunoDisciplina);
		em.getTransaction().commit();
	}
	
	public AlunoDisciplina selectById(int id) {
		AlunoDisciplina ad = em.find(AlunoDisciplina.class, id);
		em.refresh(ad);
		return ad;
	}
}
