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
	
	@ManyToMany(fetch=FetchType.LAZY, mappedBy = "filieres")
	private List<InscriptionAdministrative> inscriptions_administrative = new ArrayList<InscriptionAdministrative>();
	
	@ManyToMany(fetch=FetchType.LAZY, mappedBy = "filieres")
	private List<InscriptionPedagogique> inscriptions_pedagogique = new ArrayList<InscriptionPedagogique>();

	public Filiere() {

	}
	public Filiere(int id_filiere,String nom_filiere){
		//	 super();
		this.id_filiere = id_filiere;
		this.nom_filiere = nom_filiere;
		
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