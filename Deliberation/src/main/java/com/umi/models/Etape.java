
package com.umi.models;

import java.util.ArrayList;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import java.util.List;
import javax.persistence.ForeignKey;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Column;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name = "Etape")
public class Etape
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_etape")
    private int id_etape;
    @Column(name = "libelle_etape")
    private String libelle_etape;
    @Column(name = "diplomante")
    private int diplomante;
    @Column(name = "validation")
    private Double validation = 10d;
    @ManyToOne
    @JoinColumn(name = "filiere", foreignKey = @ForeignKey(name = "fk_filiere"))
    private Filiere filiere;
    @OneToMany(cascade = { CascadeType.REMOVE }, mappedBy = "etape")
    private List<Semestre> semestres;
    
    public Etape() {
        this.semestres = new ArrayList<Semestre>();
    }
    
   
    
    public Etape(int id_etape, String libelle_etape, int diplomante, Double validation, Filiere filiere,
			List<Semestre> semestres) {
		super();
		this.id_etape = id_etape;
		this.libelle_etape = libelle_etape;
		this.diplomante = diplomante;
		this.validation = validation;
		this.filiere = filiere;
		this.semestres = semestres;
	}

    public Etape(String libelle_etape, int diplomante, Filiere filiere) {
    	this.libelle_etape = libelle_etape;
    	this.diplomante = diplomante;
    	this.filiere = filiere;
    }

	public Double getValidation() {
		return validation;
	}



	public void setValidation(Double validation) {
		this.validation = validation;
	}



	public int getId_etape() {
        return this.id_etape;
    }
    
    public void setId_etape(final int id_etape) {
        this.id_etape = id_etape;
    }
    
    public String getLibelle_etape() {
        return this.libelle_etape;
    }
    
    public void setLibelle_etape(final String libelle_etape) {
        this.libelle_etape = libelle_etape;
    }
    
    public int getDiplomante() {
        return this.diplomante;
    }
    
    public void setDiplomante(final int diplomante) {
        this.diplomante = diplomante;
    }
    
    public Filiere getFiliere() {
        return this.filiere;
    }
    
    public void setFiliere( Filiere filiere) {
        this.filiere = filiere;
    }
    
    public List<Semestre> getSemestres() {
        return this.semestres;
    }
    
    public void setSemestres( List<Semestre> semestres) {
        this.semestres = semestres;
    }
}