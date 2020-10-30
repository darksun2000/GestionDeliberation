package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="Semestre")
public class Semestre {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_semestre")
	private int id_semestre;
	
	@Column(name="libelle_semestre")
	private String libelle_semestre;
	
	@ManyToOne
	@JoinColumn(name = "etape", foreignKey = @ForeignKey(name = "fk_etape"))
	private Etape etape;

	public Semestre() {
	}


	public Semestre(int id_semestre, String libelle_semestre, Etape etape) {
		this.id_semestre = id_semestre;
		this.libelle_semestre = libelle_semestre;
		this.etape = etape;
	}


	public int getId_semestre() {
		return id_semestre;
	}


	public void setId_semestre(int id_semestre) {
		this.id_semestre = id_semestre;
	}


	public String getLibelle_semestre() {
		return libelle_semestre;
	}


	public void setLibelle_semestre(String libelle_semestre) {
		this.libelle_semestre = libelle_semestre;
	}


	public Etape getEtape() {
		return etape;
	}


	public void setEtape(Etape etape) {
		this.etape = etape;
	}
	
}
