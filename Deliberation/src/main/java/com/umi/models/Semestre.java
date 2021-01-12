package com.umi.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Semestre")
public class Semestre {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id_semestre")
    private int id_semestre;
    @Column(name="validation")
    private Double validation;
    @Column(name="libelle_semestre")
    private String libelle_semestre;
    @ManyToOne
    @JoinColumn(name="filiere", foreignKey=@ForeignKey(name="fk_filiere"))
    private Filiere filiere;
    @ManyToOne
    @JoinColumn(name="etape", foreignKey=@ForeignKey(name="fk_etape"))
    private Etape etape;

    public Semestre() {
    }

    public Semestre(int id_semestre, Double validation, String libelle_semestre, Filiere filiere, Etape etape) {
        this.id_semestre = id_semestre;
        this.validation = validation;
        this.libelle_semestre = libelle_semestre;
        this.filiere = filiere;
        this.etape = etape;
    }

    public Double getValidation() {
        return this.validation;
    }

    public void setValidation(Double validation) {
        this.validation = validation;
    }

    public int getId_semestre() {
        return this.id_semestre;
    }

    public void setId_semestre(int id_semestre) {
        this.id_semestre = id_semestre;
    }

    public String getLibelle_semestre() {
        return this.libelle_semestre;
    }

    public void setLibelle_semestre(String libelle_semestre) {
        this.libelle_semestre = libelle_semestre;
    }

    public Filiere getFiliere() {
        return this.filiere;
    }

    public void setFiliere(Filiere filiere) {
        this.filiere = filiere;
    }

    public Etape getEtape() {
        return this.etape;
    }

    public void setEtape(Etape etape) {
        this.etape = etape;
    }
}