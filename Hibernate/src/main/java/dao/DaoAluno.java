package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

import banco.Conexao;
import modelo.Aluno;
import modelo.RA;

public class DaoAluno {
	private EntityManagerFactory emf;
	private EntityManager em;
	
	public DaoAluno() {
		emf = Conexao.getConnection();
		em = emf.createEntityManager();
	}
	
	public void insert(Aluno aluno) {	
		em.getTransaction().begin();
		em.persist(aluno);
		em.getTransaction().commit();
	}
	
	public void delete(Aluno aluno) {
		em.getTransaction().begin();
		aluno = em.find(Aluno.class, aluno.getId());
		em.remove(aluno);
		em.getTransaction().commit();
	}
	
	public void update(Aluno aluno) {
		Aluno alunoBanco = new Aluno();
		
		DaoTurma dao = new DaoTurma();

		em.getTransaction().begin();
		
		alunoBanco = em.find(Aluno.class, aluno.getId());
		RA raBanco = em.find(RA.class, alunoBanco.getRa().getId());
		raBanco.setNumero(aluno.getRa().getNumero());
		
		em.persist(raBanco);
		
		alunoBanco.setNome(aluno.getNome());
		alunoBanco.seteMail(aluno.geteMail());
		alunoBanco.setTurma(dao.selectById(aluno.getTurma().getId()));
		alunoBanco.setRa(raBanco);
		alunoBanco.setDisciplinas(aluno.getDisciplinas());
		
		em.getTransaction().commit();
	}
	
	public List<Aluno> selectAll() {
		List<Aluno> listaAlunos = em.createQuery("SELECT a FROM Aluno a", Aluno.class).getResultList(); 
		return listaAlunos;
	}
	
	public Aluno selectById(int id) {
		Aluno aluno = em.find(Aluno.class, id);
		return aluno;
	}
	
	public List<Aluno> selectByNome(String nome){
		String sql = "SELECT a FROM Aluno a where a.nome like :nomePesquisa";
		TypedQuery<Aluno> typedQuery = em.createQuery(sql, Aluno.class);
		typedQuery.setParameter("nomePesquisa", "%" + nome + "%");
		List<Aluno> listaAlunos = typedQuery.getResultList();
		return listaAlunos;
	}
}