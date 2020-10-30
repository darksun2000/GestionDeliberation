package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="InscriptionEnLigne")
public class InscriptionEnLigne {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_ie")
	private int id_ie;

	public InscriptionEnLigne() {
		
	}
	
	public InscriptionEnLigne(int id_ie) {
		this.id_ie = id_ie;
	}
	
	public int getId_ie() {
		return id_ie;
	}

	public void setId_ie(int id_ie) {
		this.id_ie = id_ie;
	}
	
	
	
}
