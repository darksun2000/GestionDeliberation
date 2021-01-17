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
import com.umi.models.Etudiant;
import com.umi.models.Historique;
import com.umi.models.InscriptionPedagogique;
import com.umi.models.InscriptionPedagogiqueModule;
import com.umi.models.Module;
import com.umi.models.Professeur;
import com.umi.repositories.EtudiantRepository;
import com.umi.repositories.HistoriqueRepository;
import com.umi.repositories.InscriptionPedagogiqueModuleRepository;
import com.umi.repositories.InscriptionPedagogiqueRepository;
import com.umi.repositories.ModuleRepository;
import com.umi.repositories.ProfesseurRepository;
import com.umi.repositories.UserRepository;

@Controller
public class ProfesseurController {
	@PersistenceContext
	EntityManager entityManager;
	ProfesseurRepository professeurRepository;
	PasswordEncoder passwordEncoder;
	UserRepository userRepository;
	ModuleRepository moduleRepository;
	EtudiantRepository etudiantRepository;
	InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository;
	InscriptionPedagogiqueModuleRepository inscriptionPedagogiqueModuleRepository;
	HistoriqueRepository historiqueRepository;
	
	ProfesseurController(ProfesseurRepository professeurRepository
			, PasswordEncoder passwordEncoder
			, UserRepository userRepository
			, ModuleRepository moduleRepository
			, EtudiantRepository etudiantRepository
			, InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository
			, InscriptionPedagogiqueModuleRepository inscriptionPedagogiqueModuleRepository
			, HistoriqueRepository historiqueRepository){
		this.professeurRepository = professeurRepository;
		this.passwordEncoder = passwordEncoder;
		this.userRepository = userRepository;
		this.moduleRepository = moduleRepository;
		this.etudiantRepository = etudiantRepository;
		this.inscriptionPedagogiqueRepository = inscriptionPedagogiqueRepository;
		this.inscriptionPedagogiqueModuleRepository = inscriptionPedagogiqueModuleRepository;
		this.historiqueRepository = historiqueRepository;
	}
	
	@GetMapping("/professeur/creer")
	public ModelAndView professeurCreatePage() {
		ModelAndView model = new ModelAndView("ProfesseurCreate");
		model.addObject("ProfesseurCreate", "mm-active");
		return model;
	}
	
	@PostMapping("/professeur/creer")
	public ModelAndView professeurCreate(@RequestParam("first_name") String first_name
			, @RequestParam("last_name") String last_name
			, @RequestParam("email") String email) {
		Professeur professeur = new Professeur(first_name, last_name, email);
		User user = new User();
		user.setUsername(email);
		user.setActive(1);
		user.setPassword(passwordEncoder.encode(first_name));
		user.setRoles("PROF");
		user = userRepository.save(user);
		professeur.setUser(user);
		professeurRepository.save(professeur);
		historiqueRepository.save(new Historique("Professeur " + first_name + " " + last_name + " créé", new java.util.Date()));
		return new ModelAndView("redirect:/professeur/liste");
	}
	
	@GetMapping("/professeur/liste")
	public ModelAndView listProfesseur() {
		ModelAndView model = new ModelAndView("ListProfesseur");
		List<Professeur> professeurs = professeurRepository.findAll();
		if(professeurs != null)model.addObject("professeurs", professeurs);
		model.addObject("listProfesseur", "mm-active");
		return model;
	}
	
	@GetMapping("/professeur/profile/{id}")
	public ModelAndView professeurProfile(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("ProfesseurProfile");
		Professeur professeur = professeurRepository.getOne(id);
		model.addObject("professeur", professeur);
		return model;
	}
	
	@PostMapping("/professeur/modifier/{id}")
	public ModelAndView modifyProfesseur(@PathVariable("id") Integer id
			, @RequestParam("last_name") String last_name
			, @RequestParam("first_name") String first_name
			, @RequestParam("email") String email
			, @RequestParam(name = "username", required = false) String username
			, @RequestParam(name = "password", required = false) String password
			, @RequestParam(name = "password_conf", required = false) String password_conf) {
		Professeur professeur = professeurRepository.getOne(id);
		if(professeur != null) {
			professeur.setPrenom_professeur(first_name);
			professeur.setNom_professeur(last_name);
			professeur.setEmail_professeur(email);
			
			User user = professeur.getUser();
			if(user != null) {
				if(password != null && !password.equals(user.getPassword())) {
					if(password.equals(password_conf)) {
						user.setUsername(passwordEncoder.encode(password));
						user.setActive(1);
						System.out.println("the new professeur's password is: " + password);
					}
				}
				if(username != null)user.setUsername(username);
				user = userRepository.save(user);
				professeur.setUser(user);
				
			}else {
				if(username != null && password != null) {
					user = new User();
					user.setRoles("PROF");
					user.setActive(1);
					user.setUsername(username);
					if(password.equals(password_conf)) {
						user.setPassword(passwordEncoder.encode(password));
						user = userRepository.save(user);
						professeur.setUser(user);
					}					
				}
			}
			historiqueRepository.save(new Historique("Professeur " + first_name + " " + last_name + " modifié", new java.util.Date()));
			professeurRepository.save(professeur);
		}
		return new ModelAndView("redirect:/professeur/profile/" + id);
	}
	
	@PostMapping("/professeur/supprimer/{id}")
	public ModelAndView deleteProfesseur(@PathVariable("id") Integer id) {
		Professeur professeur = professeurRepository.getOne(id);
		historiqueRepository.save(new Historique("Professeur " + professeur.getPrenom_professeur() + " " + professeur.getNom_professeur()+ " supprimé", new java.util.Date()));
		if(professeur != null) professeurRepository.delete(professeur);
		return new ModelAndView("redirect:/professeur/liste");
	}
	
	@GetMapping("/prof/mesmodules")
	public ModelAndView mymodules() {
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
		if(user.getRoles().equals("PROF")) {
			Professeur professeur = professeurRepository.getProfesseurByUser(user);
			if(professeur != null) {
				List<Module> modules = moduleRepository.getModulesByProfesseur(professeur);
				ModelAndView model = new ModelAndView("myModulesProf");
				model.addObject("modules", modules);
				return model;
			}else return new ModelAndView("redirect:/login");
		}
		return new ModelAndView("redirect:/login");
	}
	
	@GetMapping("/prof/mymodule/profile/{id}")
	public ModelAndView myModuleProfile(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("myModuleProfileProf");
		model.addObject("module", moduleRepository.getOne(id));
		return model;
	}
	
	
	@GetMapping("/prof/mesetudiants")
	public ModelAndView myStudents() {
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
		if(user.getRoles().equals("PROF")) {			
			Professeur professeur = professeurRepository.getProfesseurByUser(user);
			if(professeur != null) {
				ModelAndView model = new ModelAndView("MyEtudiantsProf");
				List<Etudiant> etudiants = new ArrayList<Etudiant>();
				List<Module> modules = moduleRepository.getModulesByProfesseur(professeur);
				List<Etudiant> all_etudiants = etudiantRepository.findAll();
				if(modules != null)
					if(all_etudiants != null) 
						for(Etudiant etudiant : all_etudiants) {
							List<InscriptionPedagogique> inscription_pedagogiques = 
									inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueByEtudiant(etudiant);
							if(inscription_pedagogiques != null) {
								for(InscriptionPedagogique inscriptionPedagogique : inscription_pedagogiques) {
									List<Module> mod = moduleRepository.getModuleBySemestre(inscriptionPedagogique.getSemestre());
									if(mod != null) {
										for(Module module : mod) {
											if(modules.contains(module) && !etudiants.contains(etudiant))etudiants.add(etudiant);
										}
									}									
									List<InscriptionPedagogiqueModule> inscriptionPedagogiqueModules =
											inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiant(inscriptionPedagogique);
									if(inscriptionPedagogiqueModules != null) {
										for(InscriptionPedagogiqueModule inscriptionPedagogiqueModule : inscriptionPedagogiqueModules) {
											if(inscriptionPedagogiqueModule.getModule() != null) {
												Module module = inscriptionPedagogiqueModule.getModule();
													if(modules.contains(module) && !etudiants.contains(etudiant))etudiants.add(etudiant);
											}
										}
									}
								}
							}
						}
				model.addObject("etudiants", etudiants);
				return model;
			}else return new ModelAndView("redirect:/login");
		}
		return new ModelAndView("redirect:/login");
	}
	
	
	
	
}
