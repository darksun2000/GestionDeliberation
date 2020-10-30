package com.umi.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Etape")
public class Etape {

	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_etape")
	private int id_etape;
	
	@Column(name="libelle_etape")
	private String libelle_etape;
	
	@ManyToOne
	@JoinColumn(name = "filiere", foreignKey = @ForeignKey(name = "fk_filiere"))
	private Filiere filiere;
	
	public Etape() {
		
	}

	public Etape(int id_etape, String libelle_etape) {
		super();
		this.id_etape = id_etape;
		this.libelle_etape = libelle_etape;
	}

	public int getId_etape() {
		return id_etape;
	}

	public void setId_etape(int id_etape) {
		this.id_etape = id_etape;
	}

	public String getLibelle_etape() {
		return libelle_etape;
	}

	public void setLibelle_etape(String libelle_etape) {
		this.libelle_etape = libelle_etape;
	}

	
}
