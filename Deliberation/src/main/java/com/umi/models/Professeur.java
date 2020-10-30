package com.umi.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="Professeur")
public class Professeur {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_professeur")
	private int id_professeur;
	
	@Column(name="nom_professeur")
	private String nom_professeur;
	
	@Column(name="email_professeur")
	private String email_professeur;
	
	@Column(name="mdp_professeur")
	private String mdp_professeur;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE, mappedBy = "professeur")
	private List<Element> elements = new ArrayList<Element>();

	public Professeur() {
	}

	public Professeur(int id_professeur, String nom_professeur, String email_professeur, String mdp_professeur,
			List<Element> elements) {
		this.id_professeur = id_professeur;
		this.nom_professeur = nom_professeur;
		this.email_professeur = email_professeur;
		this.mdp_professeur = mdp_professeur;
		this.elements = elements;
	}

	public int getId_professeur() {
		return id_professeur;
	}

	public void setId_professeur(int id_professeur) {
		this.id_professeur = id_professeur;
	}

	public String getNom_professeur() {
		return nom_professeur;
	}

	public void setNom_professeur(String nom_professeur) {
		this.nom_professeur = nom_professeur;
	}

	public String getEmail_professeur() {
		return email_professeur;
	}

	public void setEmail_professeur(String email_professeur) {
		this.email_professeur = email_professeur;
	}

	public String getMdp_professeur() {
		return mdp_professeur;
	}

	public void setMdp_professeur(String mdp_professeur) {
		this.mdp_professeur = mdp_professeur;
	}

	public List<Element> getElements() {
		return elements;
	}

	public void setElements(List<Element> elements) {
		this.elements = elements;
	}
	
	
}
