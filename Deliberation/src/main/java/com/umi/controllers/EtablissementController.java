package com.umi.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umi.models.Element;
import com.umi.models.Etablissement;
import com.umi.models.Filiere;
import com.umi.models.Historique;
import com.umi.models.Professeur;
import com.umi.repositories.ElementRepository;
import com.umi.repositories.EtablissementRepository;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.HistoriqueRepository;
import com.umi.repositories.ProfesseurRepository;

@Controller
public class EtablissementController {
	
	@PersistenceContext
	EntityManager entityManager;
	EtablissementRepository etablissementRepository;
	FiliereRepository filiereRepository;
	ProfesseurRepository professeurRepository;
	ElementRepository elementRepository;
	HistoriqueRepository historiqueRepository;
	
	EtablissementController(EtablissementRepository etablissementRepository
			, FiliereRepository filiereRepository
			, ProfesseurRepository professeurRepository
			, ElementRepository elementRepository
			, HistoriqueRepository historiqueRepository){
		this.etablissementRepository = etablissementRepository;
		this.filiereRepository = filiereRepository;
		this.professeurRepository = professeurRepository;
		this.elementRepository = elementRepository;
		this.historiqueRepository = historiqueRepository;
	}
	
	@GetMapping("/etablissement/creer")
	public ModelAndView createEstablissmentPage() {
		ModelAndView model = new ModelAndView("EtablissementCreate");
		model.addObject("EtablissementCreate", "mm-active");
		return model;
	}

	@PostMapping("/etablissement/creer")
	public ModelAndView createEstablissment(@RequestParam("name") String name) {
		Etablissement etablissement = new Etablissement(name);
		etablissementRepository.save(etablissement);
		historiqueRepository.save(new Historique("établissement " + name + " créé", new Date()));
		return new ModelAndView("redirect:/etablissement/liste");
	}
	
	@GetMapping("/etablissement/liste")
	public ModelAndView listEtablissement() {
		ModelAndView model = new ModelAndView("ListEtablissement");
		List<Etablissement> etablissements = etablissementRepository.findAll();
		model.addObject("etablissements", etablissements);
		model.addObject("listEtablissement", "mm-active");
		return model;
		
	}
	
	@GetMapping("/etablissement/profile/{id}")
	public ModelAndView etablissementProfile(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("EtablissementProfile");
		model.addObject("etablissement", etablissementRepository.getOne(id));
		return model;
	}
	
	@PostMapping("/etablissement/modifier/{id}")
	public ModelAndView etablissementModify(@PathVariable("id") Integer id, @RequestParam("name") String name) {
		Etablissement etablissement = etablissementRepository.getOne(id);
		historiqueRepository.save(new Historique("etablissement " + etablissement.getName() + " modifié en " + name, new Date()));
		if(etablissement != null) {
			etablissement.setName(name);
			etablissementRepository.save(etablissement);
		}
		return new ModelAndView("redirect:/etablissement/profile/" + id);
	}
	
	@PostMapping("/etablissement/supprimer/{id}")
	public ModelAndView etablissemntDelete(@PathVariable("id") Integer id) {
		String name = etablissementRepository.getOne(id).getName();
		historiqueRepository.save(new Historique("etablissement " + name + " supprimé", new Date()));
		etablissementRepository.deleteById(id);
		return new ModelAndView("redirect:/etablissement/liste");
	}
	
	@GetMapping("/etablissement/profile/{id}/filiere/liste")
	public ModelAndView etablissementFiliereListe(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("EtablissementProfilesFiliereListe");
		Etablissement etablissement = etablissementRepository.getOne(id);
		if(etablissement != null) {			
			List<Filiere> filieres = filiereRepository.getFilieresByEtablissement(etablissement);
			model.addObject("filieres", filieres);
			model.addObject("etablissement", etablissement);
		}
		return model;
	}
	
	@GetMapping("/etablissement/profile/{id}/professeur/liste")
	public ModelAndView etablissementProfesseurListe(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("EtablissementProfilesProfesseurListe");
		Etablissement etablissement = etablissementRepository.getOne(id);
		if(etablissement != null) {			
			List<Professeur> professeurs = professeurRepository.findAll();
			List<Professeur> professeurs_etablissement = new ArrayList<Professeur>();
			List<Element> elements = elementRepository.findAll();
			if(elements != null)
				if(professeurs != null)
			for(Element element: elements) {
				if(professeurs.contains(element.getProfesseur())) {
					professeurs_etablissement.add(element.getProfesseur());
				}
			}
			model.addObject("professeurs", professeurs_etablissement);
			model.addObject("etablissement", etablissement);
		}
		return model;
	}
	
}
