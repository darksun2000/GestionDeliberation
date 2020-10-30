package com.umi.models;

import javax.persistence.*;


@Entity
@Table(name="Element")
public class Element {
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_element")
	private int id_element;
	
	@Column(name="libelle_element")
	private String libelle_element;
	
//	@OneToMany(fetch = FetchType.LAZY)
//	@JoinColumn(name="idModule")
	
	@ManyToOne
	@JoinColumn(name = "module", foreignKey = @ForeignKey(name = "fk_module"))
	private Module module;
	
	@ManyToOne
	@JoinColumn(name = "professeur", foreignKey = @ForeignKey(name = "fk_professeur"))
	private Professeur professeur;

	public Element() {
	}

	public Element(int id_element, String libelle_element, Module module) {
		this.id_element = id_element;
		this.libelle_element = libelle_element;
		this.module = module;
	}

	public int getId_element() {
		return id_element;
	}

	public void setId_element(int id_element) {
		this.id_element = id_element;
	}

	public String getLibelle_element() {
		return libelle_element;
	}

	public void setLibelle_element(String libelle_element) {
		this.libelle_element = libelle_element;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

}
