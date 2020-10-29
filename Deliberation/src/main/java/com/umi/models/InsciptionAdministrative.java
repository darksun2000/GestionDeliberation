package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="InscriptionAdministrative")
public class InsciptionAdministrative {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idIA")
	private int idIA;
	
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

	public InsciptionAdministrative() {
	}

	public InsciptionAdministrative(int idIA, Etudiant etudiant, Filiere filiere, String anneeAcademique,
			String datePreInscription, String dateValidInscription) {
		super();
		this.idIA = idIA;
		this.etudiant = etudiant;
		this.filiere = filiere;
		AnneeAcademique = anneeAcademique;
		DatePreInscription = datePreInscription;
		DateValidInscription = dateValidInscription;
	}

	public int getIdIA() {
		return idIA;
	}

	public void setIdIA(int idIA) {
		this.idIA = idIA;
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
