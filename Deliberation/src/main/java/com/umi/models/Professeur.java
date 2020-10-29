package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="Professeur")
public class Professeur {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idProfesseur")
	private int idProfesseur;
	
	@Column(name="nomProfesseur")
	private String nomProfesseur;
	
	@Column(name="emailProfesseur")
	private String emailProfesseur;
	
	@Column(name="mdpProfesseur")
	private String mdpProfesseur;
	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name="idElement")
	private Element element;

	public Professeur() {
	}

	public Professeur(int idProfesseur, String nomProfesseur, String emailProfesseur, String mdpProfesseur,
			Element element) {
		super();
		this.idProfesseur = idProfesseur;
		this.nomProfesseur = nomProfesseur;
		this.emailProfesseur = emailProfesseur;
		this.mdpProfesseur = mdpProfesseur;
		this.element = element;
	}

	public int getIdProfesseur() {
		return idProfesseur;
	}

	public void setIdProfesseur(int idProfesseur) {
		this.idProfesseur = idProfesseur;
	}

	public String getNomProfesseur() {
		return nomProfesseur;
	}

	public void setNomProfesseur(String nomProfesseur) {
		this.nomProfesseur = nomProfesseur;
	}

	public String getEmailProfesseur() {
		return emailProfesseur;
	}

	public void setEmailProfesseur(String emailProfesseur) {
		this.emailProfesseur = emailProfesseur;
	}

	public String getMdpProfesseur() {
		return mdpProfesseur;
	}

	public void setMdpProfesseur(String mdpProfesseur) {
		this.mdpProfesseur = mdpProfesseur;
	}

	public Element getElement() {
		return element;
	}

	public void setElement(Element element) {
		this.element = element;
	}

	
	
	
}
