package com.umi.controllers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.umi.authentication.User;
import com.umi.models.Etudiant;
import com.umi.models.Filiere;
import com.umi.models.Professeur;
import com.umi.models.Responsable;
import com.umi.repositories.EtudiantRepository;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.ProfesseurRepository;
import com.umi.repositories.ResponsableRepository;
import com.umi.repositories.UserRepository;

@Controller
public class LoginController {

	@PersistenceContext
	EntityManager entityManager;
	UserRepository userRepository;
	EtudiantRepository etudiantRepository;
	ProfesseurRepository professeurRepository;
	ResponsableRepository responsableRepository;
	FiliereRepository filiereRepository;
	
	public LoginController(UserRepository userRepository
			, EtudiantRepository etudiantRepositroy
			, ProfesseurRepository professeurRepository
			, ResponsableRepository responsableRepository
			, FiliereRepository filiereRepository) {
		this.userRepository = userRepository;
		this.etudiantRepository = etudiantRepositroy;
		this.professeurRepository = professeurRepository;
		this.responsableRepository = responsableRepository;
		this.filiereRepository = filiereRepository;
	}
	
	@GetMapping("/login")
	public ModelAndView getLogin(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("login");
		String err = request.getParameter("error");
		//System.out.println();
		if(err != null && err.equals("true")) {
			System.out.println("error is :" + err);
			model.addObject("err","Vos identifiants sont incorrects.");
			return model;
		}
		return model;
	}
	
	@GetMapping("/")
	public ModelAndView home() {

		ModelAndView model;
		String username = "";
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			username = authentication.getName();
			//System.out.println(authentication.getPrincipal().toString());
			System.out.println("username : " + username);
		}else {
			System.out.println("username is null !!!");
			return new ModelAndView("redirect:/login");
		}
		
		User user = userRepository.getUserByUsername(username);
		if(user == null) {
			System.out.println("user is null !!!");
			return new ModelAndView("redirect:/login");
		}
		System.out.println(user.getRoles());
		
		if(user.getRoles().equals("ADMIN")){
			System.out.println("admin is in index");
			model = new ModelAndView("index");
			List<Etudiant> etudiants = etudiantRepository.findAll();
			model.addObject("nombreEtudiants", etudiants == null ? 0 : etudiants.size());
			List<Professeur> professeurs = professeurRepository.findAll();
			model.addObject("nombreProfesseurs", professeurs == null ? 0 : professeurs.size());
			List<Responsable> responsables = responsableRepository.findAll();
			model.addObject("nombreResponsables", responsables == null ? 0 : responsables.size());
			List<Filiere> filieres = filiereRepository.findAll();
			model.addObject("nombreFilieres", filieres == null ? 0 : filieres.size());
			
			
		}else if(user.getRoles().equals("PROF")){
			System.out.println("prof is in index");
			model = new ModelAndView("index-prof");
		}else if (user.getRoles().equals("RESPONSABLE")) {
			System.out.println("responsable is in index");
			model = new ModelAndView("index-resp");					
		}else {
			//redirect to 404.jsp here
			System.out.println("ERROR IN /, REDIRECTING TO 404");
			
			model = new ModelAndView("404");
		}
		model.addObject("dashboard", "mm-active");
		model.addObject("message", "HELLO WORLD");
		return model;

	}
	
}
