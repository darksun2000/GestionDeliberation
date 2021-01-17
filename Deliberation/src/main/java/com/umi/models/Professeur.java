package com.umi.models;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.umi.authentication.User;

@Entity
@Table(name="Professeur")
public class Professeur {
    
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id_professeur")
    private int id_professeur;
    
    @Column(name="nom_professeur")
    private String nom_professeur;
    
    @Column(name="prenom_professeur")
    private String prenom_professeur;
    
    @Column(name="email_professeur")
    private String email_professeur;
    
    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "user", foreignKey = @ForeignKey(name = "fk_user"))
    @NotFound(action = NotFoundAction.IGNORE)
    private User user;
    
    @OneToMany(fetch=FetchType.LAZY, cascade={CascadeType.REMOVE}, mappedBy="professeur")
    private List<Module> modules = new ArrayList<Module>(); 
    
    @OneToMany(fetch=FetchType.LAZY, cascade={CascadeType.REMOVE}, mappedBy="professeur")
    private List<Element> elements = new ArrayList<Element>();

    public Professeur() {
    }

    public Professeur(int id_professeur, String nom_professeur, String email_professeur, List<Element> elements) {
        this.id_professeur = id_professeur;
        this.nom_professeur = nom_professeur;
        this.email_professeur = email_professeur;
        this.elements = elements;
    }
    
    public Professeur(String nom_professeur, String prenom_professeur, String email_professeur) {
    	this.nom_professeur = nom_professeur;
    	this.prenom_professeur = prenom_professeur;
    	this.email_professeur = email_professeur;
    }

    public int getId_professeur() {
        return this.id_professeur;
    }

    public void setId_professeur(int id_professeur) {
        this.id_professeur = id_professeur;
    }

    public String getNom_professeur() {
        return this.nom_professeur;
    }

    public void setNom_professeur(String nom_professeur) {
        this.nom_professeur = nom_professeur;
    }

    public String getEmail_professeur() {
        return this.email_professeur;
    }

    public void setEmail_professeur(String email_professeur) {
        this.email_professeur = email_professeur;
    }

    public List<Element> getElements() {
        return this.elements;
    }

    public void setElements(List<Element> elements) {
        this.elements = elements;
    }

    public String getPrenom_professeur() {
        return this.prenom_professeur;
    }

    public void setPrenom_professeur(String prenom_professeur) {
        this.prenom_professeur = prenom_professeur;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}
    
    
}