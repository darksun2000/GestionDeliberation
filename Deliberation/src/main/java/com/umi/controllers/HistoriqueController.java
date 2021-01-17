package com.umi.controllers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.umi.models.Historique;
import com.umi.repositories.HistoriqueRepository;

@Controller
public class HistoriqueController {
	
	@PersistenceContext
	EntityManager entityManager;
	HistoriqueRepository historiqueRepository;
	
	HistoriqueController(HistoriqueRepository historiqueRepository){
		this.historiqueRepository = historiqueRepository;
	}
	
	@GetMapping("/historique/liste")
	public ModelAndView list() {
		List<Historique> historiques = historiqueRepository.findAll();
		ModelAndView model = new ModelAndView("ListHistorique");
		model.addObject("historiques", historiques);
		return model;
	}
	
	@GetMapping("/historique/profile/{id}")
	public ModelAndView profileHistorique(@PathVariable("id") Integer id) {
		Historique historique = historiqueRepository.getOne(id);
		ModelAndView model = new ModelAndView("HistoriqueProfile");
		model.addObject("historique", historique);
		return model;
	}
}
