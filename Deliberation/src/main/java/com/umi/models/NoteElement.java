package com.umi.models;

import com.umi.enums.TypeNote;
import com.umi.models.Element;
import com.umi.models.InscriptionPedagogique;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="NoteElement")
public class NoteElement {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id_note_element")
    private int id_note_element;
    @Column(name="note_element")
    private Double note_element;
    @Column(name="coeficient")
    private Double coeficient;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="element")
    private Element element;
    @Column(name="type_note")
    @Enumerated(value=EnumType.STRING)
    private TypeNote type_note;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="inscription_pedagogique")
    private InscriptionPedagogique inscription_pedagogique;

    public NoteElement() {
    }

    public NoteElement(int id_note_element, double note_element, Element element, TypeNote type_note, InscriptionPedagogique inscription_pedagogique) {
        this.id_note_element = id_note_element;
        this.note_element = note_element;
        this.element = element;
        this.type_note = type_note;
        this.inscription_pedagogique = inscription_pedagogique;
    }

    

    public void setCoeficient(Double coeficient) {
        this.coeficient = coeficient;
    }

    public Double getCoeficient() {
        return this.coeficient;
    }
    
public int getId_note_element() {
        return this.id_note_element;
    }
    public void setId_note_element(int id_note_element) {
        this.id_note_element = id_note_element;
    }

    public Double getNote_element() {
        return this.note_element;
    }

  

    public Element getElement() {
        return this.element;
    }

    public void setElement(Element element) {
        this.element = element;
    }

    public InscriptionPedagogique getInscription_pedagogique() {
        return this.inscription_pedagogique;
    }

    public void setInscription_pedagogique(InscriptionPedagogique inscription_pedagogique) {
        this.inscription_pedagogique = inscription_pedagogique;
    }

	public TypeNote getType_note() {
		return type_note;
	}

	public void setType_note(TypeNote type_note) {
		this.type_note = type_note;
	}

	public void setNote_element(Double note_element) {
		this.note_element = note_element;
	}
    
    
}