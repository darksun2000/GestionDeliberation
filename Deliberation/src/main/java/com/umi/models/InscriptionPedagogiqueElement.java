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
@Table(name="InscriptionPedagogiqueElement")
public class InscriptionPedagogiqueElement {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private int id;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="element")
    private Element element;
    
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="inscription_pedagogique")
    private InscriptionPedagogique inscription_pedagogique;

	public InscriptionPedagogiqueElement(int id, Element element,
			InscriptionPedagogique inscription_pedagogique) {
		super();
		this.id = id;
		this.element = element;
		this.inscription_pedagogique = inscription_pedagogique;
	}

	public InscriptionPedagogiqueElement() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
