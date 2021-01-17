package com.umi.controllers;

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

import com.umi.models.Etablissement;
import com.umi.models.Etape;
import com.umi.models.Filiere;
import com.umi.models.Historique;
import com.umi.models.Semestre;
import com.umi.repositories.EtablissementRepository;
import com.umi.repositories.EtapeRepository;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.HistoriqueRepository;
import com.umi.repositories.SemestreRepository;

@Controller
public class FiliereController {
	@PersistenceContext
	EntityManager entityManager;
	FiliereRepository filiereRepository;
	EtablissementRepository etablissementRepository;
	EtapeRepository etapeRepository;
	SemestreRepository semestreRepository;
	HistoriqueRepository historiqueRepository;
	
	FiliereController(FiliereRepository filiereRepository
			, EtablissementRepository etablissmentRepository
			, EtapeRepository etapeRepository
			, SemestreRepository semestreRepository
			, HistoriqueRepository historiqueRepository){
		this.filiereRepository = filiereRepository;
		this.etablissementRepository = etablissmentRepository;
		this.etapeRepository = etapeRepository;
		this.semestreRepository = semestreRepository;
		this.historiqueRepository = historiqueRepository;
	}
	
	@GetMapping("/filiere/creer")
	public ModelAndView filiereCreaetPage() {
		ModelAndView model = new ModelAndView("FiliereCreate");
		List<Etablissement> etablissements = etablissementRepository.findAll();
		model.addObject("etablissements", etablissements);
		model.addObject("FiliereCreate", "mm-active");
		return model;
	}
	
	@PostMapping("/filiere/creer")
	public ModelAndView getFiliereCreate(@RequestParam("name") String name, @RequestParam("etablissement") Integer etablissement_id
			, @RequestParam("semester_number") Integer semester_number) {
		Etablissement etablissement = etablissementRepository.getOne(etablissement_id);
		Filiere filiere = new Filiere(name, etablissement);
		filiere = filiereRepository.save(filiere);
		int years = (int)(semester_number/2) + semester_number%2;
		
		for(int i = 1 ; i<= years; i++) {
			Etape etape = new Etape(((i==1)?"1ère Année":i + "ème Année"), 0, filiere);
			etape = etapeRepository.save(etape);
			Semestre semestre1 = new Semestre(10d, "Semestre " + ((2*i)-1), filiere, etape);
			Semestre semestre2 = new Semestre(10d, "Semestre " + ((2*i)), filiere, etape);
			semestreRepository.save(semestre1);
			if(i != years || (i == years && semester_number%2 == 0)) semestreRepository.save(semestre2);
		}
		historiqueRepository.save(new Historique("filiere " + name + " créée", new Date()));
		return new ModelAndView("redirect:/filiere/liste");
	}
	
	@GetMapping("/filiere/liste")
	public ModelAndView getFiliereListe() {
		List<Filiere> filieres = filiereRepository.findAll();
		ModelAndView model = new ModelAndView("ListFiliere");
		model.addObject("listFiliere", "mm-active");
		model.addObject("filieres", filieres);
		return model;
	}
	
	@GetMapping("/filiere/profile/{id}")
	public ModelAndView getFiliereProfile(@PathVariable("id") Integer id) {
		Filiere filiere = filiereRepository.getOne(id);
		ModelAndView model = new ModelAndView("FiliereProfile");
		model.addObject("filiere", filiere);
		List<Etablissement> etablissements = etablissementRepository.findAll();
		model.addObject("etablissements", etablissements);
		List<Semestre> semestres = semestreRepository.getSemestresByFiliere(filiere);
		model.addObject("semester_number", (semestres == null) ? 0 : semestres.size());
		if(filiere != null && filiere.getEtablissement() != null)
		model.addObject("etab_fili", filiere.getEtablissement().getId());
		return model;
	}
	
	@PostMapping("/filiere/modifer/{id}")
	public ModelAndView modifyFiliere(@PathVariable("id") Integer id, @RequestParam("name") String name
			, @RequestParam("etablissement_id") Integer etablissement_id
			, @RequestParam("semester_number") Integer semester_number) {
		Filiere filiere = filiereRepository.getOne(id);
		List<Semestre> old_semestres = semestreRepository.getSemestresByFiliere(filiere);
		int old_semester_num = (old_semestres == null) ? 0 : old_semestres.size();
		historiqueRepository.save(new Historique("filiere " + filiere.getNom_filiere() + " modifié en " + name + ", nombre de semestre changé de " + old_semester_num + " en " + semester_number , new Date()));
		if(filiere != null) {
			filiere.setNom_filiere(name);
			Etablissement etablissement = etablissementRepository.getOne(etablissement_id);
			if(etablissement != null)
				filiere.setEtablissement(etablissement);
			filiere = filiereRepository.save(filiere);
			List<Etape> etapes = etapeRepository.getEtapeByFiliere(filiere);
			List<Semestre> semestres = semestreRepository.getSemestresByFiliere(filiere);
			if(old_semester_num != semester_number)
			if(etapes != null) {
				for(Semestre semestre: semestres) {
					semestreRepository.delete(semestre);
				}
			}
			if(old_semester_num != semester_number)
			if(etapes != null) {
				for(Etape etape: etapes) {
					
					etapeRepository.delete(etape);
				}
			}
			int years = (int)(semester_number/2) + semester_number%2;
			if(old_semester_num != semester_number)
			for(int i = 1 ; i<= years; i++) {
				Etape etape = new Etape(((i==1)?"1ère Année":i + "ème Année"), 0, filiere);
				etape = etapeRepository.save(etape);
				Semestre semestre1 = new Semestre(10d, "Semestre " + ((2*i)-1), filiere, etape);
				Semestre semestre2 = new Semestre(10d, "Semestre " + ((2*i)), filiere, etape);
				semestreRepository.save(semestre1);
				if(i != years || (i == years && semester_number%2 == 0)) semestreRepository.save(semestre2);
			}
		}
		return new ModelAndView("redirect:/filiere/profile/" + id);
	}
	
	@PostMapping("/filiere/supprimer/{id}")
	public ModelAndView deleteFiliere(@PathVariable("id") Integer id) {
		String name = filiereRepository.getOne(id).getNom_filiere();
		historiqueRepository.save(new Historique("filiere " + name + " supprimée", new Date()));
		filiereRepository.deleteById(id);
		return new ModelAndView("redirect:/filiere/liste");
	}
	
	//@GetMapping("/filiere/")
}
