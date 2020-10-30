package com.umi.models;

import javax.persistence.*;

import com.umi.models.Module;

@Entity
@Table(name="Module")
public class Module {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_module")
	private int id_module;
	
	@Column(name="libelle_module")
	private String libelle_module;
	
//	@OneToMany(fetch = FetchType.LAZY)
//	@JoinColumn(name="idSemestre")
	
	
	@ManyToOne
	@JoinColumn(name = "semestre", foreignKey = @ForeignKey(name = "fk_semestre"))
	private Semestre semestre;
	
	public Module() {
	
	}

	public Module(int id_module, String libelle_module, Semestre semestre) {
		this.id_module = id_module;
		this.libelle_module = libelle_module;
		this.semestre = semestre;
	}



	public int getId_module() {
		return id_module;
	}

	public void setId_module(int id_module) {
		this.id_module = id_module;
	}

	public String getLibelle_module() {
		return libelle_module;
	}

	public void setLibelle_module(String libelle_module) {
		this.libelle_module = libelle_module;
	}

	public Semestre getSemestre() {
		return semestre;
	}
	
	public void setSemestre(Semestre semestre) {
		this.semestre = semestre;
	}
	
}
