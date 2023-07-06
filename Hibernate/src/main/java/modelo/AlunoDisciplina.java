package modelo;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tb_aluno_disciplina")
public class AlunoDisciplina implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private double nota1;
	private double nota2;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "aluno_id")
	private Aluno aluno;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "disciplina_id")
	private Disciplina disciplina;
	
	public AlunoDisciplina() {
		
	}

	public AlunoDisciplina(double nota1, double nota2, Aluno aluno, Disciplina disciplina) {
		super();
		this.nota1 = nota1;
		this.nota2 = nota2;
		this.aluno = aluno;
		this.disciplina = disciplina;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getNota1() {
		return nota1;
	}

	public void setNota1(double nota1) {
		this.nota1 = nota1;
	}

	public double getNota2() {
		return nota2;
	}

	public void setNota2(double nota2) {
		this.nota2 = nota2;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	public Disciplina getDisciplina() {
		return disciplina;
	}

	public void setDisciplina(Disciplina disciplina) {
		this.disciplina = disciplina;
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
		AlunoDisciplina other = (AlunoDisciplina) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "AlunoDisciplina [id=" + id + ", nota1=" + nota1 + ", nota2=" + nota2 + ", aluno=" + aluno
				+ ", disciplina=" + disciplina + "]";
	}
}
