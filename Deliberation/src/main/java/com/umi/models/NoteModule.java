package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="NoteModule")
public class NoteModule {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_note_module")
	private int id_note_module;
	
	@Column(name="note_module")
	private double note_module;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="module")
	private Module module;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="inscription_pedagogique")
	private InscriptionPedagogique inscription_pedagogique;

	public NoteModule() {
	}

	public NoteModule(int id_note_module, double note_module, Module module, InscriptionPedagogique inscription_pedagogique) {
		this.id_note_module = id_note_module;
		this.note_module = note_module;
		this.module = module;
		this.inscription_pedagogique = inscription_pedagogique;
	}

	public int getId_note_module() {
		return id_note_module;
	}

	public void setId_note_module(int id_note_module) {
		this.id_note_module = id_note_module;
	}

	public double getNote_module() {
		return note_module;
	}

	public void setNote_module(double note_module) {
		this.note_module = note_module;
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
