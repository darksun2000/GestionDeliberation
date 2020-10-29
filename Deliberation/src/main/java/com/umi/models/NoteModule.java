package com.umi.models;

import javax.persistence.*;

@Entity
@Table(name="NoteModule")
public class NoteModule {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="idNoteModule")
	private int idNoteModule;
	
	@Column(name="noteModule")
	private double noteModule;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idModule")
	private Module module;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idIP")
	private InscriptionPedagogique ip;

	public NoteModule() {
	}

	public NoteModule(int idNoteModule, double noteModule, Module module, InscriptionPedagogique ip) {
		super();
		this.idNoteModule = idNoteModule;
		this.noteModule = noteModule;
		this.module = module;
		this.ip = ip;
	}

	public int getIdNoteModule() {
		return idNoteModule;
	}

	public void setIdNoteModule(int idNoteModule) {
		this.idNoteModule = idNoteModule;
	}

	public double getNoteModule() {
		return noteModule;
	}

	public void setNoteModule(double noteModule) {
		this.noteModule = noteModule;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public InscriptionPedagogique getIp() {
		return ip;
	}

	public void setIp(InscriptionPedagogique ip) {
		this.ip = ip;
	}
	
}
