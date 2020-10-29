package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="Filiere")
public class Filiere {
	
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idFiliere")
	private int idFiliere;
	
	@Column(name="nomFiliere")
	private String nomFiliere;
	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name="idEtape")
	private Etape etape;
	


 public Filiere() {
	 
 }
 public Filiere(int idFiliere,String nomFiliere , Etape Etape){
	 super();
	 this.idFiliere=idFiliere;
	 this.nomFiliere=nomFiliere;
	 this.etape=Etape;
	 
 }
public int getIdFiliere() {
	return idFiliere;
}
public void setIdFiliere(int idFiliere) {
	this.idFiliere = idFiliere;
}
public String getNomFiliere() {
	return nomFiliere;
}
public void setNomFiliere(String nomFiliere) {
	this.nomFiliere = nomFiliere;
}
public Etape getEtape() {
	return etape;
}
public void setEtape(Etape etape) {
	this.etape = etape;
}
 
}