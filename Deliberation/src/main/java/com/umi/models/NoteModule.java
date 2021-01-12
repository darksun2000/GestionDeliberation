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
@Table(name="NoteModule")
public class NoteModule {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id_note_module")
    private int id_note_module;
    @Column(name="note_module")
    private Double note_module;
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
        return this.id_note_module;
    }

    public void setId_note_module(int id_note_module) {
        this.id_note_module = id_note_module;
    }

    public double getNote_module() {
        return this.note_module;
    }

    public void setNote_module(double note_module) {
        this.note_module = note_module;
    }

    public Module getModule() {
        return this.module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public InscriptionPedagogique getInscription_pedagogique() {
        return this.inscription_pedagogique;
    }

    public void setInscription_pedagogique(InscriptionPedagogique inscription_pedagogique) {
        this.inscription_pedagogique = inscription_pedagogique;
    }
}