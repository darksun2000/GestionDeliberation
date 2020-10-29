package com.umi.models;

import javax.persistence.*;


@Entity
@Table(name="Responsable")
public class Responsable {

	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idResponsable")
	private int idResponsable;
	
	@Column(name="nomResponsable")
	private String nomResponsable;
	
	@Column(name="emailResponsable")
	private String emailResponsable;
	
	@Column(name="mdpResponsable")
	private String mdpResponsable;
	
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="idFiliere")
	private Filiere filiere;


	public Responsable() {
	}


	public Responsable(int idResponsable, String nomResponsable, String emailResponsable, String mdpResponsable,
			Filiere filiere) {
		super();
		this.idResponsable = idResponsable;
		this.nomResponsable = nomResponsable;
		this.emailResponsable = emailResponsable;
		this.mdpResponsable = mdpResponsable;
		this.filiere = filiere;
	}


	public int getIdResponsable() {
		return idResponsable;
	}


	public void setIdResponsable(int idResponsable) {
		this.idResponsable = idResponsable;
	}


	public String getNomResponsable() {
		return nomResponsable;
	}


	public void setNomResponsable(String nomResponsable) {
		this.nomResponsable = nomResponsable;
	}


	public String getEmailResponsable() {
		return emailResponsable;
	}


	public void setEmailResponsable(String emailResponsable) {
		this.emailResponsable = emailResponsable;
	}


	public String getMdpResponsable() {
		return mdpResponsable;
	}


	public void setMdpResponsable(String mdpResponsable) {
		this.mdpResponsable = mdpResponsable;
	}


	public Filiere getFiliere() {
		return filiere;
	}


	public void setFiliere(Filiere filiere) {
		this.filiere = filiere;
	}
	
	
	
}
