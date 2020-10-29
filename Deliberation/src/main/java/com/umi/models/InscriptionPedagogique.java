package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="InscriptionPedagogique")
public class InscriptionPedagogique {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idIP")
	private int idIP;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id")
	private Etudiant etudiant;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="idFiliere")
	private Filiere filiere;
	
	@Column(name="AnneeAcademique")
	private String AnneeAcademique;
	
	@Column(name="DatePreInscription")
	private String DatePreInscription;
	
	@Column(name="DateValidInscription")
	private String DateValidInscription;

	public InscriptionPedagogique() {
	}

	public InscriptionPedagogique(int idIP, Etudiant etudiant, Filiere filiere, String anneeAcademique,
			String datePreInscription, String dateValidInscription) {
		super();
		this.idIP = idIP;
		this.etudiant = etudiant;
		this.filiere = filiere;
		AnneeAcademique = anneeAcademique;
		DatePreInscription = datePreInscription;
		DateValidInscription = dateValidInscription;
	}

	public int getIdIP() {
		return idIP;
	}

	public void setIdIP(int idIP) {
		this.idIP = idIP;
	}

	public Etudiant getEtudiant() {
		return etudiant;
	}

	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}

	public Filiere getFiliere() {
		return filiere;
	}

	public void setFiliere(Filiere filiere) {
		this.filiere = filiere;
	}

	public String getAnneeAcademique() {
		return AnneeAcademique;
	}

	public void setAnneeAcademique(String anneeAcademique) {
		AnneeAcademique = anneeAcademique;
	}

	public String getDatePreInscription() {
		return DatePreInscription;
	}

	public void setDatePreInscription(String datePreInscription) {
		DatePreInscription = datePreInscription;
	}

	public String getDateValidInscription() {
		return DateValidInscription;
	}

	public void setDateValidInscription(String dateValidInscription) {
		DateValidInscription = dateValidInscription;
	}
	
}
