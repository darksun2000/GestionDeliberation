package com.umi.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="InscriptionPedagogiqueModule")
public class InscriptionPedagogiqueModule {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private int id;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="module")
    private Module module;
    @Column(name="note_module")
    private Double note_module;
    @Column(name="validation")
    private Double validation;
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="inscription_pedagogique")
    private InscriptionPedagogique inscription_pedagogique;



	public InscriptionPedagogiqueModule(int id, Module module, Double note_module, Double validation,
			InscriptionPedagogique inscription_pedagogique) {
		super();
		this.id = id;
		this.module = module;
		this.note_module = note_module;
		this.validation = validation;
		this.inscription_pedagogique = inscription_pedagogique;
	}

	public Double getNote_module() {
		return note_module;
	}

	public void setNote_module(Double note_module) {
		this.note_module = note_module;
	}

	public Double getValidation() {
		return validation;
	}

	public void setValidation(Double validation) {
		this.validation = validation;
	}

	public InscriptionPedagogiqueModule() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public InscriptionPedagogique getInscription_pedagogique() {
		return inscription_pedagogique;
	}

	public void setInscription_pedagogique(InscriptionPedagogique inscription_pedagogique) {
		this.inscription_pedagogique = inscription_pedagogique;
	}
	
	
	
}
