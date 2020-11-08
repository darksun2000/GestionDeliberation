package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="Note")
public class Note {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_note_module")
	private int id_note_module;
	
	@Column(name="note_module")
	private double note_module;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="element")
	private Element element;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="inscription_pedagogique")
	private InscriptionPedagogique inscription_pedagogique;

	public Note() {
	}

	public Note(int id_note_module, double note_module, Element element, InscriptionPedagogique inscription_pedagogique) {
		this.id_note_module = id_note_module;
		this.note_module = note_module;
		this.element = element;
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

	public Element getElement() {
		return element;
	}

	public void setElement(Element element) {
		this.element = element;
	}

	public InscriptionPedagogique getInscription_pedagogique() {
		return inscription_pedagogique;
	}

	public void setInscription_pedagogique(InscriptionPedagogique inscription_pedagogique) {
		this.inscription_pedagogique = inscription_pedagogique;
	}
	
	
}
