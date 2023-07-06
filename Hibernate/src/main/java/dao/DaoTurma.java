package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

import banco.Conexao;
import modelo.Turma;

public class DaoTurma {
	private EntityManagerFactory emf;
	private EntityManager em;
	
	public DaoTurma() {
		emf = Conexao.getConnection();
		em = emf.createEntityManager();
	}
	
	public void insert(Turma turma) {
		em.getTransaction().begin();
		em.persist(turma);
		em.getTransaction().commit();
	}
	
	public void delete(Turma turma) {
		em.getTransaction().begin();
		turma = em.find(Turma.class, turma.getId());
		em.remove(turma);
		em.getTransaction().commit();
	}
	
	public void update(Turma turma) {
		Turma turmaBanco = new Turma();

		em.getTransaction().begin();
		
		turmaBanco = em.find(Turma.class, turma.getId());
		turmaBanco.setNome(turma.getNome());
		turmaBanco.setAno(turma.getAno());
		
		em.getTransaction().commit();
	}
	
	public List<Turma> selectAll() {
		List<Turma> listaTurma = em.createQuery("SELECT t FROM Turma t", Turma.class).getResultList(); 
		return listaTurma;
	}
	
	public Turma selectById(int id) {
		Turma turma = em.find(Turma.class, id);
		return turma;
	}
	
	public List<Turma> selectByNome(String nome){
		String sql = "SELECT t FROM Turma t where t.nome like :nomePesquisa";
		TypedQuery<Turma> typedQuery = em.createQuery(sql, Turma.class);
		typedQuery.setParameter("nomePesquisa", "%" + nome + "%");
		List<Turma> listaTurmas = typedQuery.getResultList();
		return listaTurmas;
	}
}
