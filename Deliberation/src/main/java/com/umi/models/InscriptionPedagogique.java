package com.umi.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name="InscriptionPedagogique")
public class InscriptionPedagogique {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_ip")
	private int id_ip;
	
	@ManyToOne
	@JoinColumn(name="etudiant", foreignKey = @ForeignKey(name = "fk_etudiant"))
	private Etudiant etudiant;
	
	
	@ManyToOne
	@JoinColumn(name="semestre", foreignKey = @ForeignKey(name = "fk_semestre"))
	@NotFound(action = NotFoundAction.IGNORE)
	private Semestre semestre;
	
	@Column(name="annee_academique")
	private String annee_academique; // not an integer ?? //ofc
	
	@Column(name="note_semestre")
	private Double note_semestre;
	
	@Column(name="validation")
	private Double validation;
	
	@Column(name="date_pre_inscription")
	private Date date_pre_inscription;
	
	@Column(name="date_valid_inscription")
	private Date date_valid_inscription;

	public InscriptionPedagogique() {
	}

	

	
	public InscriptionPedagogique(int id_ip, Etudiant etudiant, Semestre semestre, String annee_academique,
			Double note_semestre, Double validation, Date date_pre_inscription, Date date_valid_inscription) {
		super();
		this.id_ip = id_ip;
		this.etudiant = etudiant;
		this.semestre = semestre;
		this.annee_academique = annee_academique;
		this.note_semestre = note_semestre;
		this.validation = validation;
		this.date_pre_inscription = date_pre_inscription;
		this.date_valid_inscription = date_valid_inscription;
	}





	public Semestre getSemestre() {
		return semestre;
	}




	public void setSemestre(Semestre semestre) {
		this.semestre = semestre;
	}







	public Date getDate_pre_inscription() {
		return date_pre_inscription;
	}













	public Double getNote_semestre() {
		return note_semestre;
	}













	public void setNote_semestre(Double note_semestre) {
		this.note_semestre = note_semestre;
	}













	public Double getValidation() {
		return validation;
	}













	public void setValidation(Double validation) {
		this.validation = validation;
	}













	public int getId_ip() {
		return id_ip;
	}

	public void setId_ip(int id_ip) {
		this.id_ip = id_ip;
	}

	public Etudiant getEtudiant() {
		return etudiant;
	}

	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}


	public String getAnnee_academique() {
		return annee_academique;
	}

	public void setAnnee_academique(String annee_academique) {
		this.annee_academique = annee_academique;
	}

	public Date getdate_pre_inscription() {
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
