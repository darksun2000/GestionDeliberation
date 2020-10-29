package com.umi.models;

import javax.persistence.*;


@Entity
@Table(name="Element")
public class Element {
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idElement")
	private int idElement;
	
	@Column(name="LibelleElement")
	private String LibelleElement;
	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name="idModule")
	private Module module;

	public Element() {
	}

	public Element(int idElement, String libelleElement, Module module) {
		super();
		this.idElement = idElement;
		LibelleElement = libelleElement;
		this.module = module;
	}

	public int getIdElement() {
		return idElement;
	}

	public void setIdElement(int idElement) {
		this.idElement = idElement;
	}

	public String getLibelleElement() {
		return LibelleElement;
	}

	public void setLibelleElement(String libelleElement) {
		LibelleElement = libelleElement;
	}

	public Module getLibelleModule() {
		return module;
	}

	public void setLibelleModule(Module module) {
		this.module = module;
	}
	
	

}
