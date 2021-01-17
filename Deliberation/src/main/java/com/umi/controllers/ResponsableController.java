package com.umi.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umi.authentication.User;
import com.umi.models.Filiere;
import com.umi.models.InscriptionAdministrative;
import com.umi.models.Responsable;
import com.umi.models.Semestre;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.InscriptionAdministrativeRepository;
import com.umi.repositories.ModuleRepository;
import com.umi.repositories.ResponsableRepository;
import com.umi.repositories.SemestreRepository;
import com.umi.repositories.UserRepository;

@Controller
public class ResponsableController {
	@PersistenceContext
	EntityManager entityManager;
	ResponsableRepository responsableRepository;
	UserRepository userRepository;
	PasswordEncoder passwordEncoder;
	ModuleRepository moduleRepository;
	SemestreRepository semestreRepository;
	InscriptionAdministrativeRepository inscriptionAdministrativeRepository;
	FiliereRepository filiereRepository;
	
	ResponsableController(ResponsableRepository responsableRepository
			, UserRepository userRepository, PasswordEncoder passwordEncoder
			, ModuleRepository moduleRepository, SemestreRepository semestreRepository
			, InscriptionAdministrativeRepository inscriptionAdministrativeRepository
			, FiliereRepository filiereRepository){
		this.responsableRepository = responsableRepository;
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
		this.moduleRepository = moduleRepository;
		this.semestreRepository = semestreRepository;
		this.inscriptionAdministrativeRepository = inscriptionAdministrativeRepository;
		this.filiereRepository = filiereRepository;
	}
	
	@GetMapping("/responsable/creer")
	public ModelAndView createReponsable() {
		ModelAndView model = new ModelAndView("creerResponsable");
		List<Filiere> filieres = filiereRepository.findAll();
		model.addObject("filieres", filieres);
		return model;
	}
	
	@PostMapping("/responsable/creer")
	public ModelAndView responsableCreate(@RequestParam("nom_responsable") String nom_responsable
			, @RequestParam("prenom_responsable") String prenom_responsable
			, @RequestParam("email_responsable") String email_responsable
			, @RequestParam("filiere_id") Integer filiere_id) {
		Filiere filiere = filiereRepository.getOne(filiere_id);
		Responsable responsable = new Responsable(nom_responsable, prenom_responsable, email_responsable, filiere);
		
		User user = new User(email_responsable, passwordEncoder.encode(prenom_responsable), "RESPONSABLE", "");
		user.setActive(1);
		user = userRepository.save(user);
		responsable.setUser(user);
		responsableRepository.save(responsable);
		
		return new ModelAndView("redirect:/responsable/liste");
	}
	
	@GetMapping("/responsable/liste")
	public ModelAndView responsableList() {
		ModelAndView model = new ModelAndView("ListResponsable");
		model.addObject("responsables", responsableRepository.findAll());
		return model;
	}
	
	@GetMapping("/responsable/profile/{id}")
	public ModelAndView responsableProfile(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("ResponsableProfile");
		Responsable responsable = responsableRepository.getOne(id);
		model.addObject("responsable", responsable);
		return model;
	}
	
	@PostMapping("/responsable/modifier/{id}")
	public ModelAndView modifyResponsable(@PathVariable("id") Integer id
			, @RequestParam("nom_responsable") String nom_responsable
			, @RequestParam("prenom_responsable") String prenom_responsable
			, @RequestParam("email_responsable") String email_responsable
			, @RequestParam("username") String username
			, @RequestParam("password") String password
			, @RequestParam("password_conf") String password_conf) {
		Responsable responsable = responsableRepository.getOne(id);
		if(responsable != null) {
			responsable.setNom_responsable(nom_responsable);
			responsable.setPrenom_responsable(prenom_responsable);
			responsable.setEmail_responsable(email_responsable);
			User user = responsable.getUser();
			if(user != null) {
				if(username != null) user.setUsername(username);
				if(password != null && password.equals(password_conf)) {
					user.setPassword(passwordEncoder.encode(password));
				}
				user.setActive(1);
				userRepository.save(user);
			}else {
				user = new User(username, passwordEncoder.encode(password), "RESPONSABLE", "");
				user.setActive(1);
				userRepository.save(user);
			}
			responsableRepository.save(responsable);
		}return new ModelAndView("redirect:/responsable/profile/" + id);
	}
	
	@PostMapping("/responsable/supprimer/{id}")
	public ModelAndView deleteResponsable(@PathVariable("id") Integer id) {
		responsableRepository.deleteById(id);
		return new ModelAndView("redirect:/responsable/liste");
	}
	
	@GetMapping("/resp/mafiliere")
	public ModelAndView myFiliere() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = "";
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			username = authentication.getName();
			//System.out.println(authentication.getPrincipal().toString());
			System.out.println("username : " + username);
		}else {
			return new ModelAndView("redirect:/login");
		}
		User user = userRepository.getUserByUsername(username);
		if(user.getRoles().equals("RESPONSABLE")) {
			Responsable responsable = responsableRepository.getResponsableByUser(user);
			if(responsable != null) {
				ModelAndView model = new ModelAndView("myFiliereResp");
				model.addObject("filiere", responsable.getFiliere());
				List<Semestre> semestres = semestreRepository.getSemestresByFiliere(responsable.getFiliere());
				model.addObject("semester_number", (semestres == null) ? 0 : semestres.size());
				return model;
			}else return new ModelAndView("redirect:/login");
		}return new ModelAndView("redirect:/login");
		
	}
	
	@GetMapping("/resp/mesmodules")
	public ModelAndView myModulesResp() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = "";
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			username = authentication.getName();
			//System.out.println(authentication.getPrincipal().toString());
			System.out.println("username : " + username);
		}else {
			return new ModelAndView("redirect:/login");
		}
		User user = userRepository.getUserByUsername(username);
		if(user.getRoles().equals("RESPONSABLE")) {
			Responsable responsable = responsableRepository.getResponsableByUser(user);
			if(responsable != null) {
				ModelAndView model = new ModelAndView("myModulesResp");
				List<com.umi.models.Module> modules = new ArrayList<com.umi.models.Module>();
				List<Semestre> semestres = semestreRepository.getSemestresByFiliere(responsable.getFiliere());
				if(semestres != null)
					for(Semestre semestre: semestres) {
						modules.addAll(moduleRepository.getModuleBySemestre(semestre));
					}
				model.addObject("modules", modules);
				return model;
			}else return new ModelAndView("redirect:/login");
		}return new ModelAndView("redirect:/login");
		
	}
	
	@GetMapping("/resp/mesetudiants")
	public ModelAndView myEtudiantsResp() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = "";
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			username = authentication.getName();
			//System.out.println(authentication.getPrincipal().toString());
			System.out.println("username : " + username);
		}else {
			return new ModelAndView("redirect:/login");
		}
		User user = userRepository.getUserByUsername(username);
		if(user.getRoles().equals("RESPONSABLE")) {
			Responsable responsable = responsableRepository.getResponsableByUser(user);
			if(responsable != null) {
				Filiere filiere = responsable.getFiliere();
				List<InscriptionAdministrative> inscription_administratives =
						inscriptionAdministrativeRepository.getInscriptionsAdministrativeByFiliere(filiere);
				ModelAndView model = new ModelAndView("myEtudiantsResp");
				model.addObject("inscription_administratives", inscription_administratives);
				return model;
			}else return new ModelAndView("redirect:/login");
		}
		return new ModelAndView("redirect:/login");
	}
	
	
	
	
}
