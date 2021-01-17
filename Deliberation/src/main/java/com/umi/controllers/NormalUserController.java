package com.umi.controllers;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NormalUserController {

	@PersistenceContext
	EntityManager entityManager;
	
	NormalUserController(){
		
	}
	
	@GetMapping("/accueil")
	public ModelAndView accueil() {
		return new ModelAndView("accueil");
	}
}
