package com.umi.controllers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umi.authentication.User;
import com.umi.models.Element;
import com.umi.models.Historique;
import com.umi.models.Module;
import com.umi.models.Professeur;
import com.umi.models.Semestre;
import com.umi.repositories.ElementRepository;
import com.umi.repositories.HistoriqueRepository;
import com.umi.repositories.ModuleRepository;
import com.umi.repositories.ProfesseurRepository;
import com.umi.repositories.SemestreRepository;
import com.umi.repositories.UserRepository;

@Controller
public class ModuleController {
	@PersistenceContext
	EntityManager entityManager;
	ModuleRepository moduleRepository;
	ProfesseurRepository professeurRepository;
	SemestreRepository semestreRepository;
	ElementRepository elementRepository;
	UserRepository userRepository;
	PasswordEncoder passwordEncoder;
	HistoriqueRepository historiqueRepository;
	
	ModuleController(ProfesseurRepository professeurRepository
			, ModuleRepository moduleRepository
			, SemestreRepository semestreRepository
			, ElementRepository elementRepository
			, PasswordEncoder passwordEncoder
			, UserRepository userRepository
			, HistoriqueRepository historiqueRepository){
		this.professeurRepository = professeurRepository;
		this.moduleRepository = moduleRepository;
		this.semestreRepository = semestreRepository;
		this.elementRepository = elementRepository;
		this.passwordEncoder = passwordEncoder;
		this.userRepository = userRepository;
		this.historiqueRepository = historiqueRepository;
	}
	
	@GetMapping("/module/creer")
	public ModelAndView moduleCreatePage() {
		ModelAndView model = new ModelAndView("ModuleCreate");
		List<Semestre> semestres = semestreRepository.findAll();
		model.addObject("semestres", semestres);
		List<Professeur> professeurs = professeurRepository.findAll();
		model.addObject("professeurs", professeurs);
		model.addObject("ModuleCreate", "mm-active");
		return model;
	}
	
	@PostMapping("/module/creer")
	public ModelAndView moduleCreate(@RequestParam("semestre_id") Integer semestre_id
			, @RequestParam("professeur_id") Integer professeur_id
			, @RequestParam("name") String name) {
		Semestre semestre = semestreRepository.getOne(semestre_id);
		com.umi.models.Module module = new com.umi.models.Module(name, semestre);
		Professeur professeur = professeurRepository.getOne(professeur_id);
		if(professeur != null) {
			User user = professeur.getUser();;
			if(user != null) {
				user = professeur.getUser();
			}else {
				user = new User();
				user.setUsername(professeur.getEmail_professeur());
				user.setPassword(passwordEncoder.encode(professeur.getPrenom_professeur()));
			}
			userRepository.save(user);
		}
		module.setProfesseur(professeur);
		module = moduleRepository.save(module);
		Element element = new Element(name, 1d, 10d, module, professeur);
		elementRepository.save(element);
		historiqueRepository.save(new Historique("Module " + name + " créé", new java.util.Date()));
		return new ModelAndView("redirect:/module/liste");
	}
	
	@GetMapping("/module/liste")
	public ModelAndView listModule() {
		ModelAndView model = new ModelAndView("ListModule");
		List<com.umi.models.Module> modules = moduleRepository.findAll();
		if(modules != null)model.addObject("modules", modules);
		model.addObject("listModules", "mm-active");
		return model;
	}
	
	@GetMapping("/module/profile/{id}")
	public ModelAndView moduleProfile(@PathVariable("id") Integer id) {
		ModelAndView model = new ModelAndView("ModuleProfile");
		com.umi.models.Module module = moduleRepository.getOne(id);
		model.addObject("module", module);
		List<Semestre> semestres = semestreRepository.findAll();
		model.addObject("semestres", semestres);
		List<Professeur> professeurs = professeurRepository.findAll();
		model.addObject("professeurs", professeurs);
		return model;
	}
	
	@PostMapping("/module/modifier/{id}")
	public ModelAndView modifyModule(@PathVariable("id") Integer id
			, @RequestParam("name") String name
			, @RequestParam("semestre_id") Integer semestre_id
			, @RequestParam("professeur_id") Integer professeur_id) {
		com.umi.models.Module module = moduleRepository.getOne(id);
		historiqueRepository.save(new Historique("Module " + module.getLibelle_module() + " modifié en " + name , new java.util.Date()));
		if(module != null) {
			module.setLibelle_module(name);
			Professeur professeur = professeurRepository.getOne(professeur_id);
			if(professeur != null) module.setProfesseur(professeur);
			Semestre semestre = semestreRepository.getOne(semestre_id);
			if(semestre != null) module.setSemestre(semestre);
			module = moduleRepository.save(module);
			List<Element> elements = elementRepository.getElementByModule(module);
			if(elements != null) {
				if(elements.size() == 1) {
					Element elem = elements.get(0);
					elem.setLibelle_element(name);
					elementRepository.save(elem);
				}else if(elements.size() == 0) {
					Element element = new Element(name, 1d, 10d, module, professeur);
					elementRepository.save(element);
				}
			}else {
				Element element = new Element(name, 1d, 10d, module, professeur);
				elementRepository.save(element);
			}
			
		}
		return new ModelAndView("redirect:/module/profile/" + id);
	}
	
	@PostMapping("/module/supprimer/{id}")
	public ModelAndView deleteModule(@PathVariable("id") Integer id) {
		com.umi.models.Module module = moduleRepository.getOne(id);
		historiqueRepository.save(new Historique("Module " + module.getLibelle_module() + " supprimé", new java.util.Date()));
		if(module != null) moduleRepository.delete(module);
		return new ModelAndView("redirect:/module/liste");
	}
}
