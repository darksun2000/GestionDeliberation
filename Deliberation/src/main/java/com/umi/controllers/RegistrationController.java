package com.umi.controllers;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umi.enums.Gender;
import com.umi.models.Etudiant;
import com.umi.models.InscriptionEnLigne;
import com.umi.repositories.EtudiantRepository;
import com.umi.repositories.InscriptionEnLigneRepository;

@Controller
public class RegistrationController {
	
	@PersistenceContext
	private EntityManager entiryManager;
	private EtudiantRepository studentRepository;
	private InscriptionEnLigneRepository inscriptionEnligne;
	
	public RegistrationController(EtudiantRepository studentRepository, InscriptionEnLigneRepository inscriptionEnligne) {
		this.studentRepository = studentRepository;
		this.inscriptionEnligne=inscriptionEnligne;
	}
	
	@GetMapping("/student/create")
	public ModelAndView createANewStudent() {
		ModelAndView model = new ModelAndView("createStudent");
		model.addObject("createStudent", "mm-active");//will be used in the nav-bar
		return model;
	}
	
	@PostMapping("/student/create")
	public ModelAndView receiveStudentData(@RequestParam("last_name_fr") String last_name_fr
			, @RequestParam("last_name_ar") String last_name_ar, @RequestParam("first_name_fr") String first_name_fr
			, @RequestParam("first_name_ar") String first_name_ar, @RequestParam("massar_edu") String massar_edu
			, @RequestParam("cne") String cne, @RequestParam("nationality") String nationality
			, @RequestParam("gender") Gender gender, @RequestParam("birth_date") Date birth_date
			, @RequestParam("birth_place") String birth_place, @RequestParam("city") String city
			, @RequestParam("province") String province, @RequestParam("bac_year") Integer bac_year
			, @RequestParam("bac_type") String bac_type, @RequestParam("mention") String mention
			, @RequestParam("high_school") String high_school, @RequestParam("bac_place") String bac_place
			, @RequestParam("academy") String academy, @RequestParam("establishment") String establishment) {
		
		Etudiant student = new Etudiant();
		student.setLast_name_fr(last_name_fr);
		student.setLast_name_ar(last_name_ar);
		student.setFirst_name_fr(first_name_fr);
		student.setFirst_name_ar(first_name_ar);
		student.setMassar_edu(massar_edu);
		student.setCne(cne);
		student.setNationality(nationality);
		student.setGender(gender);
		student.setBirth_date(birth_date);
		student.setBirth_place(birth_place);
		student.setCity(city);
		student.setProvince(province);
		student.setBac_year(bac_year);
		student.setBac_type(bac_type);
		student.setMention(mention);
		student.setHigh_school(high_school);
		student.setBac_place(bac_place);
		student.setAcademy(academy);
		student.setEstablishment(establishment);
		student.setRegistration_date(new java.util.Date());
		
		studentRepository.save(student);
		
		
		return new ModelAndView("redirect:/student/list");
	}
	
	
	@GetMapping("/student/InscriptionEnLigne")
	public ModelAndView createANewInscriptionEnLigne() {
		ModelAndView model = new ModelAndView("InscriptionEnLigne");
		model.addObject("InscriptionEnLigne", "mm-active");//will be used in the nav-bar
		return model;
	}
	@PostMapping("/student/InscriptionEnLigne")
	public ModelAndView receiveInscriptionEnligneData(@RequestParam("last_name_fr") String last_name_fr
			, @RequestParam("last_name_ar") String last_name_ar, @RequestParam("first_name_fr") String first_name_fr
			, @RequestParam("first_name_ar") String first_name_ar, @RequestParam("massar_edu") String massar_edu
			, @RequestParam("cne") String cne, @RequestParam("nationality") String nationality
			, @RequestParam("gender") Gender gender, @RequestParam("birth_date") Date birth_date
			, @RequestParam("birth_place") String birth_place, @RequestParam("city") String city
			, @RequestParam("province") String province, @RequestParam("bac_year") Integer bac_year
			, @RequestParam("bac_type") String bac_type, @RequestParam("mention") String mention
			, @RequestParam("high_school") String high_school, @RequestParam("bac_place") String bac_place
			, @RequestParam("academy") String academy, @RequestParam("establishment") String establishment) {
		
		InscriptionEnLigne student = new InscriptionEnLigne();
		student.setLast_name_fr(last_name_fr);
		student.setLast_name_ar(last_name_ar);
		student.setFirst_name_fr(first_name_fr);
		student.setFirst_name_ar(first_name_ar);
		student.setMassar_edu(massar_edu);
		student.setCne(cne);
		student.setNationality(nationality);
		student.setGender(gender);
		student.setBirth_date(birth_date);
		student.setBirth_place(birth_place);
		student.setCity(city);
		student.setProvince(province);
		student.setBac_year(bac_year);
		student.setBac_type(bac_type);
		student.setMention(mention);
		student.setHigh_school(high_school);
		student.setBac_place(bac_place);
		student.setAcademy(academy);
		student.setEstablishment(establishment);
		student.setRegistration_date(new java.util.Date());
		
		inscriptionEnligne.save(student);
		
		
		return new ModelAndView("redirect:/student/list");
	}
	
	@GetMapping("/student/ProfilInscriptionEnLigne")
	public ModelAndView profilInscriptionEnligneData(
			@RequestParam("idie")int id
			){
		
		List<InscriptionEnLigne> l=inscriptionEnligne.findById(id);
		ModelAndView model = new ModelAndView("ProfileInscriptionEnLigne");
		model.addObject("listInscriptions", "mm-active");
		model.addObject("Inscription", l.get(0));
		
		return model;
		
	}
	
	@GetMapping("/student/RefuserInscriptionEnLigne")
	public ModelAndView refuserInscription(
			@RequestParam("idie")int id
			) {
		
		inscriptionEnligne.deleteById(id);
		return new ModelAndView("redirect:/student/ListInscriptionEnligne");
	}
	
	@GetMapping("/student/AccepterInscriptionEnLigne")
	public ModelAndView accepterInscription(
			@RequestParam("idie")int id
			) {
		
		InscriptionEnLigne iel=inscriptionEnligne.getOne(id);
		iel.setAccepted(1);
		Etudiant student=new Etudiant();
		student.setLast_name_fr(iel.getLast_name_fr());
		student.setLast_name_ar(iel.getLast_name_ar());
		student.setFirst_name_fr(iel.getFirst_name_fr());
		student.setFirst_name_ar(iel.getFirst_name_ar());
		student.setMassar_edu(iel.getMassar_edu());
		student.setCne(iel.getCne());
		student.setNationality(iel.getNationality());
		student.setGender(iel.getGender());
		student.setBirth_date(iel.getBirth_date());
		student.setBirth_place(iel.getBirth_place());
		student.setCity(iel.getCity());
		student.setProvince(iel.getProvince());
		student.setBac_year(iel.getBac_year());
		student.setBac_type(iel.getBac_type());
		student.setMention(iel.getMention());
		student.setHigh_school(iel.getHigh_school());
		student.setBac_place(iel.getBac_place());
		student.setAcademy(iel.getAcademy());
		student.setEstablishment(iel.getEstablishment());
		inscriptionEnligne.save(iel);
		return new ModelAndView("redirect:/student/ListInscriptionEnligne");
	}
	
	@GetMapping("/student/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("listStudent");
		model.addObject("listStudent", "mm-active");
		model.addObject("students", studentRepository.getAllStudents());
		
		return model;
	}
	
	@GetMapping("/student/ListInscriptionEnligne")
	public ModelAndView listInscriptionEnligne() {
		ModelAndView model = new ModelAndView("ListInscriptionEnLigne");
		model.addObject("listInscriptions", "mm-active");
		model.addObject("Inscription", inscriptionEnligne.getAllInscriptionsEnLigne());
		
		return model;
	}
	
}
