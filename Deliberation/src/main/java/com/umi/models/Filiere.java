package com.umi.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="Filiere")
public class Filiere {

	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_filiere")
	private int id_filiere;

	@Column(name="nom_filiere")
	private String nom_filiere;

	//	@OneToMany(fetch = FetchType.LAZY)
	//	@JoinColumn(name="IdEtape")

	@ManyToOne
	@JoinColumn(name = "etape", foreignKey = @ForeignKey(name = "fk_etape"))
	private Etape etape;

	@ManyToMany(fetch=FetchType.LAZY, mappedBy = "filieres")
	private List<InscriptionAdministrative> inscriptions_administrative = new ArrayList<InscriptionAdministrative>();
	
	@ManyToMany(fetch=FetchType.LAZY, mappedBy = "filieres")
	private List<InscriptionPedagogique> inscriptions_pedagogique = new ArrayList<InscriptionPedagogique>();

	public Filiere() {

	}
	public Filiere(int id_filiere,String nom_filiere , /*Etape Etape*/Etape etape){
		//	 super();
		this.id_filiere = id_filiere;
		this.nom_filiere = nom_filiere;
		this.etape = etape;

	}
	public int getId_filiere() {
		return id_filiere;
	}
	public void setId_filiere(int id_filiere) {
		this.id_filiere = id_filiere;
	}
	public String getNom_filiere() {
		return nom_filiere;
	}
	public void setNom_filiere(String nom_filiere) {
		this.nom_filiere = nom_filiere;
	}
	public Etape getEtape() {
		return etape;
	}
	public void setEtape(Etape etape) {
		this.etape = etape;
	}

}