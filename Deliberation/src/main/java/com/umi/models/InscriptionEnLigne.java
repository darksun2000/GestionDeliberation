package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="InscriptionEnLigne")
public class InscriptionEnLigne {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idIE")
	private int idIE;
	
}
