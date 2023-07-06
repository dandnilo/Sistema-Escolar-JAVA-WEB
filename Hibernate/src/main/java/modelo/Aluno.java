package modelo;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "tb_aluno")
public class Aluno implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nome;
	private String eMail;
	
	@ManyToOne
	@JoinColumn(name = "turma_id", foreignKey = @ForeignKey(name = "fk_aluno_turma"))
	private Turma turma;
	
	@OneToOne(orphanRemoval = true)
	@JoinColumn(name = "ra_id")
	@Cascade(CascadeType.ALL)
	private RA ra;
	
	@OneToMany(mappedBy = "aluno")
	@JsonIgnore
	private List<AlunoDisciplina> disciplinas;
	
	public Aluno() {
		
	}

	public Aluno(String nome, String eMail) {
		super();
		this.nome = nome;
		this.eMail = eMail;
	}

	public RA getRa() {
		return ra;
	}

	public void setRa(RA ra) {
		this.ra = ra;
	}

	public Turma getTurma() {
		return turma;
	}

	public void setTurma(Turma turma) {
		this.turma = turma;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public List<AlunoDisciplina> getDisciplinas() {
		return disciplinas;
	}

	public void setDisciplinas(List<AlunoDisciplina> disciplinas) {
		this.disciplinas = disciplinas;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Aluno other = (Aluno) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Aluno [id=" + id + ", nome=" + nome + ", eMail=" + eMail + "]";
	}
}
