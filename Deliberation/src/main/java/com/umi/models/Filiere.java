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

	@OneToMany( cascade = CascadeType.REMOVE, mappedBy = "filiere")
	private List<Etape> etapes = new ArrayList<Etape>();
	
	@ManyToMany(fetch=FetchType.LAZY)
	private List<InscriptionAdministrative> inscriptions_administrative = new ArrayList<InscriptionAdministrative>();
	
	@ManyToMany(fetch=FetchType.LAZY)
	private List<InscriptionPedagogique> inscriptions_pedagogique = new ArrayList<InscriptionPedagogique>();

	public Filiere() {

	}
	
	
	
	public List<InscriptionAdministrative> getInscriptions_administrative() {
		return inscriptions_administrative;
	}



	public void setInscriptions_administrative(List<InscriptionAdministrative> inscriptions_administrative) {
		this.inscriptions_administrative = inscriptions_administrative;
	}



	public List<InscriptionPedagogique> getInscriptions_pedagogique() {
		return inscriptions_pedagogique;
	}



	public void setInscriptions_pedagogique(List<InscriptionPedagogique> inscriptions_pedagogique) {
		this.inscriptions_pedagogique = inscriptions_pedagogique;
	}



	public Filiere(int id_filiere, String nom_filiere, List<Etape> etapes,
			List<InscriptionAdministrative> inscriptions_administrative,
			List<InscriptionPedagogique> inscriptions_pedagogique) {
		super();
		this.id_filiere = id_filiere;
		this.nom_filiere = nom_filiere;
		this.etapes = etapes;
		this.inscriptions_administrative = inscriptions_administrative;
		this.inscriptions_pedagogique = inscriptions_pedagogique;
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
	public List<Etape> getEtapes() {
		return etapes;
	}
	public void setEtapes(List<Etape> etapes) {
		this.etapes = etapes;
	}
	

}