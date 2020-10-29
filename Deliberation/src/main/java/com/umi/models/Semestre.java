package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="Semestre")
public class Semestre {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idSemestre")
	private int idSemestre;
	
	@Column(name="LibelleSemestre")
	private String LibelleSemestre;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="IdEtape")
	private Etape etape;

	
	
	public Semestre() {
	}


	public Semestre(int idSemestre, String libelleSemestre) {
		super();
		this.idSemestre = idSemestre;
		LibelleSemestre = libelleSemestre;
	}


	public int getIdSemestre() {
		return idSemestre;
	}


	public void setIdSemestre(int idSemestre) {
		this.idSemestre = idSemestre;
	}


	public String getLibelleSemestre() {
		return LibelleSemestre;
	}


	public void setLibelleSemestre(String libelleSemestre) {
		LibelleSemestre = libelleSemestre;
	}


	
	
	
	
	
}
