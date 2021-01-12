package com.umi.models;

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
@Table(name = "Element")
public class Element
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_element")
    private int id_element;
    @Column(name = "libelle_element")
    private String libelle_element;
    @Column(name = "coeficient")
    private Double coeficient;
    @Column(name = "validation")
    private Double validation;
    @ManyToOne
    @JoinColumn(name = "module", foreignKey = @ForeignKey(name = "fk_module"))
    private Module module;
    @ManyToOne
    @JoinColumn(name = "professeur", foreignKey = @ForeignKey(name = "fk_professeur"))
    private Professeur professeur;
    
    public Element() {
    }
    
    public Element(final int id_element, final String libelle_element, final Module module) {
        this.id_element = id_element;
        this.libelle_element = libelle_element;
        this.module = module;
    }
    
    public Element( String libelle_element,  Double coeficient,  Double validation,  Module module,  Professeur professeur) {
        this.libelle_element = libelle_element;
        this.coeficient = coeficient;
        this.validation = validation;
        this.module = module;
        this.professeur = professeur;
    }
    
    public int getId_element() {
        return this.id_element;
    }
    
    public void setId_element( int id_element) {
        this.id_element = id_element;
    }
    
    public String getLibelle_element() {
        return this.libelle_element;
    }
    
    public void setLibelle_element( String libelle_element) {
        this.libelle_element = libelle_element;
    }
    
    public Module getModule() {
        return this.module;
    }
    
    public void setModule( Module module) {
        this.module = module;
    }
    
    public Double getCoeficient() {
        return this.coeficient;
    }
    
    public void setCoeficient( Double coeficient) {
        this.coeficient = coeficient;
    }
    
    public Double getValidation() {
        return this.validation;
    }
    
    public void setValidation(Double validation) {
        this.validation = validation;
    }
    
    public Professeur getProfesseur() {
        return this.professeur;
    }
    
    public void setProfesseur( Professeur professeur) {
        this.professeur = professeur;
    }
}