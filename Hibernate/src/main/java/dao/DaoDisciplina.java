package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

import banco.Conexao;
import modelo.Disciplina;

public class DaoDisciplina {
	private EntityManagerFactory emf;
	private EntityManager em;
	
	public DaoDisciplina() {
		emf = Conexao.getConnection();
		em = emf.createEntityManager();
	}
	
	public void insert(Disciplina disciplina) {
		em.getTransaction().begin();
		em.persist(disciplina);
		em.getTransaction().commit();
	}
	
	public void delete(Disciplina disciplina) {
		em.getTransaction().begin();
		disciplina = em.find(Disciplina.class, disciplina.getId());
		em.remove(disciplina);
		em.getTransaction().commit();
	}
	
	public void update(Disciplina disciplina) {
		Disciplina disciplinaBanco = new Disciplina();

		em.getTransaction().begin();
		
		disciplinaBanco = em.find(Disciplina.class, disciplina.getId());
		disciplinaBanco.setNome(disciplina.getNome());
		disciplinaBanco.setCargaHoraria(disciplina.getCargaHoraria());
		
		em.getTransaction().commit();
	}
	
	public List<Disciplina> selectAll() {
		List<Disciplina> listaDisciplinas = em.createQuery("SELECT d FROM Disciplina d", Disciplina.class).getResultList(); 
		return listaDisciplinas;
	}
	
	public Disciplina selectById(int id) {
		Disciplina disciplina = em.find(Disciplina.class, id);
		return disciplina;
	}
	
	public List<Disciplina> selectByNome(String nome){
		String sql = "SELECT d FROM Disciplina d where d.nome like :nomePesquisa";
		TypedQuery<Disciplina> typedQuery = em.createQuery(sql, Disciplina.class);
		typedQuery.setParameter("nomePesquisa", "%" + nome + "%");
		List<Disciplina> listaDisciplinas = typedQuery.getResultList();
		return listaDisciplinas;
	}
}
