package com.umi.models;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="InscriptionAdministrative")
public class InscriptionAdministrative {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_ia")
	private int id_ia;
	
	@ManyToOne
	@JoinColumn(name = "etudiant", foreignKey = @ForeignKey(name = "fk_etudiant"))
	private Etudiant etudiant;
	
	@OneToOne(fetch=FetchType.LAZY)
	private Filiere filieres;
	
	@Column(name="annee_academique")
	private String annee_academique; // not an integer ???
	
//	@Column(name="DatePreInscription")
//	private String DatePreInscription;
	
	@Column(name="date_pre_inscription")
	private Date date_pre_inscription;
	
	@Column(name="date_valid_inscription")
	private Date date_valid_inscription;
	
	@Column(name="operateur")
	private String operateur;

	public InscriptionAdministrative() {
	}

	public InscriptionAdministrative(int id_ia, Etudiant etudiant, Filiere filieres, String annee_academique,
			Date date_pre_inscription, Date date_valid_inscription,String operateur) {
		this.id_ia = id_ia;
		this.etudiant = etudiant;
		this.filieres = filieres;
		this.annee_academique = annee_academique;
		this.date_pre_inscription = date_pre_inscription;
		this.date_valid_inscription = date_valid_inscription;
		this.operateur=operateur;
	}

	public String getOperateur() {
		return operateur;
	}

	public void setOperateur(String operateur) {
		this.operateur = operateur;
	}

	public Etudiant getEtudiant() {
		return etudiant;
	}

	public int getId_ia() {
		return id_ia;
	}

	public void setId_ia(int id_ia) {
		this.id_ia = id_ia;
	}

	

	public Etudiant getId_etudiant() {
		return etudiant;
	}

	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}

	public Filiere getFilieres() {
		return filieres;
	}

	public void setFilieres(Filiere filieres) {
		this.filieres = filieres;
	}

	public String getAnnee_academique() {
		return annee_academique;
	}

	public void setAnnee_academique(String annee_academique) {
		this.annee_academique = annee_academique;
	}

	public Date getDate_pre_inscription() {
		return date_pre_inscription;
	}

	public void setDate_pre_inscription(Date date_pre_inscription) {
		this.date_pre_inscription = date_pre_inscription;
	}

	public Date getDate_valid_inscription() {
		return date_valid_inscription;
	}

	public void setDate_valid_inscription(Date date_valid_inscription) {
		this.date_valid_inscription = date_valid_inscription;
	}

}
