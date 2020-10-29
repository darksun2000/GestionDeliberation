package com.umi.models;

import javax.persistence.*;

import com.umi.models.Module;

@Entity
@Table(name="Module")
public class Module {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idModule")
	private int idModule;
	
	@Column(name="LibelleModule")
	private String LibelleModule;
	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name="idSemestre")
	private Semestre semestre;
	
	public Module() {
	
	}

	

	public Semestre getSemestre() {
		return semestre;
	}



	public void setSemestre(Semestre semestre) {
		this.semestre = semestre;
	}



	public Module(int idModule, String libelleModule, Semestre semestre) {
		super();
		this.idModule = idModule;
		LibelleModule = libelleModule;
		this.semestre = semestre;
	}



	public int getIdModule() {
		return idModule;
	}

	public void setIdModule(int idModule) {
		this.idModule = idModule;
	}

	public String getLibelleModule() {
		return LibelleModule;
	}

	public void setLibelleModule(String libelleModule) {
		LibelleModule = libelleModule;
	}

	
	
	
}
