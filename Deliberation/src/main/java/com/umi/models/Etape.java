package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="Etape")
public class Etape {

	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="idEtape")
	private int idEtape;
	
	@Column(name="LibelleEtape")
	private String LibelleEtape;
	
	
	public Etape() {
		
	}

	public Etape(int idEtape, String libelleEtape) {
		super();
		this.idEtape = idEtape;
		LibelleEtape = libelleEtape;
	}

	public int getIdEtape() {
		return idEtape;
	}

	public void setIdEtape(int idEtape) {
		this.idEtape = idEtape;
	}

	public String getLibelleEtape() {
		return LibelleEtape;
	}

	public void setLibelleEtape(String libelleEtape) {
		LibelleEtape = libelleEtape;
	}

	
}
