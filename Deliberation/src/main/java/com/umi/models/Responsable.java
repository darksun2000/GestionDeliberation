package com.umi.models;

import javax.persistence.*;

import com.umi.authentication.User;


@Entity
@Table(name="Responsable")
public class Responsable {

	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_responsable")
	private int id_responsable;
	
	@Column(name="nom_responsable")
	private String nom_responsable;
	
	@Column(name="prenom_responsable")
	private String prenom_responsable;
	
	@Column(name="email_responsable")
	private String email_responsable;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="filiere")
	private Filiere filiere;

	@OneToOne
    @JoinColumn(name = "user", foreignKey = @ForeignKey(name = "fk_user"))
    private User user;

	public Responsable() {
	}


	public Responsable(int id_responsable, String nom_responsable, String prenom_responsable, String email_responsable,
			Filiere filiere) {
		this.id_responsable = id_responsable;
		this.nom_responsable = nom_responsable;
		this.prenom_responsable = prenom_responsable;
		this.email_responsable = email_responsable;
		this.filiere = filiere;
	}
	
	public Responsable(String nom_responsable, String prenom_responsable, String email_responsable, Filiere filiere) {
		this.nom_responsable = nom_responsable;
		this.prenom_responsable = prenom_responsable;
		this.email_responsable = email_responsable;
		this.filiere = filiere;
	}

	public int getId_responsable() {
		return id_responsable;
	}

	public void setId_responsable(int id_responsable) {
		this.id_responsable = id_responsable;
	}

	public String getNom_responsable() {
		return nom_responsable;
	}

	public void setNom_responsable(String nom_responsable) {
		this.nom_responsable = nom_responsable;
	}

	public String getEmail_responsable() {
		return email_responsable;
	}

	public void setEmail_responsable(String email_responsable) {
		this.email_responsable = email_responsable;
	}

	public Filiere getFiliere() {
		return filiere;
	}

	public void setFiliere(Filiere filiere) {
		this.filiere = filiere;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getPrenom_responsable() {
		return prenom_responsable;
	}


	public void setPrenom_responsable(String prenom_responsable) {
		this.prenom_responsable = prenom_responsable;
	}
	
	
	
}
