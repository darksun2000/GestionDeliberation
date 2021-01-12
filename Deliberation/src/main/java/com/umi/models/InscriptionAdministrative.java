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
	
	@Lob
	private byte[] photo;
	
	@Lob
	private byte[] bac;
	
	@Lob
	private byte[] rn;
	
	@Lob
	private byte[] an;

	@Lob
	private byte[] cin;
	
	@Lob
	private byte[] document1;
	
	@Lob
	private byte[] document2;
	
	
	private String encodedPhoto;
	
	private String encodedBac;
	
	private String encodedRv;
	
	private String encodedAn;
	
	private String encodedCin;
	
	private String encodedDocument1;
	
	private String encodedDocument2;

	

	





	public InscriptionAdministrative(int id_ia, Etudiant etudiant, Filiere filieres, String annee_academique,
			Date date_pre_inscription, Date date_valid_inscription, String operateur, byte[] photo, byte[] bac,
			byte[] rn, byte[] an, byte[] cin, byte[] document1, byte[] document2, String encodedPhoto,
			String encodedBac, String encodedRv, String encodedAn, String encodedCin, String encodedDocument1,
			String encodedDocument2) {
		super();
		this.id_ia = id_ia;
		this.etudiant = etudiant;
		this.filieres = filieres;
		this.annee_academique = annee_academique;
		this.date_pre_inscription = date_pre_inscription;
		this.date_valid_inscription = date_valid_inscription;
		this.operateur = operateur;
		this.photo = photo;
		this.bac = bac;
		this.rn = rn;
		this.an = an;
		this.cin = cin;
		this.document1 = document1;
		this.document2 = document2;
		this.encodedPhoto = encodedPhoto;
		this.encodedBac = encodedBac;
		this.encodedRv = encodedRv;
		this.encodedAn = encodedAn;
		this.encodedCin = encodedCin;
		this.encodedDocument1 = encodedDocument1;
		this.encodedDocument2 = encodedDocument2;
	}





	public byte[] getBac() {
		return bac;
	}





	public void setBac(byte[] bac) {
		this.bac = bac;
	}





	public byte[] getRn() {
		return rn;
	}





	public void setRn(byte[] rn) {
		this.rn = rn;
	}





	public byte[] getAn() {
		return an;
	}





	public void setAn(byte[] an) {
		this.an = an;
	}





	public byte[] getCin() {
		return cin;
	}





	public void setCin(byte[] cin) {
		this.cin = cin;
	}





	public byte[] getDocument2() {
		return document2;
	}





	public void setDocument2(byte[] document2) {
		this.document2 = document2;
	}





	public String getEncodedBac() {
		return encodedBac;
	}





	public void setEncodedBac(String encodedBac) {
		this.encodedBac = encodedBac;
	}





	public String getEncodedRv() {
		return encodedRv;
	}





	public void setEncodedRv(String encodedRv) {
		this.encodedRv = encodedRv;
	}





	public String getEncodedAn() {
		return encodedAn;
	}





	public void setEncodedAn(String encodedAn) {
		this.encodedAn = encodedAn;
	}





	public String getEncodedCin() {
		return encodedCin;
	}





	public void setEncodedCin(String encodedCin) {
		this.encodedCin = encodedCin;
	}





	public String getEncodedDocument2() {
		return encodedDocument2;
	}





	public void setEncodedDocument2(String encodedDocument2) {
		this.encodedDocument2 = encodedDocument2;
	}





	public String getEncodedDocument1() {
		return encodedDocument1;
	}





	public void setEncodedDocument1(String encodedDocument1) {
		this.encodedDocument1 = encodedDocument1;
	}





	public String getEncodedPhoto() {
		return encodedPhoto;
	}





	public void setEncodedPhoto(String encodedPhoto) {
		this.encodedPhoto = encodedPhoto;
	}





	public byte[] getDocument1() {
		return document1;
	}





	public void setDocument1(byte[] document1) {
		this.document1 = document1;
	}





	public byte[] getPhoto() {
		return photo;
	}





	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}





	public InscriptionAdministrative() {
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
