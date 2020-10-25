package com.umi.controllers;

import java.sql.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umi.enums.Gender;
import com.umi.models.Student;
import com.umi.repositories.StudentRepository;

@Controller
public class RegistrationController {
	
	@PersistenceContext
	private EntityManager entiryManager;
	private StudentRepository studentRepository;
	
	public RegistrationController(StudentRepository studentRepository) {
		this.studentRepository = studentRepository;
	}
	
	@GetMapping("/student/create")
	public ModelAndView createANewStudent() {
		return new ModelAndView("createStudent");
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
		
		Student student = new Student();
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
	
	@GetMapping("/student/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("listStudent");
		model.addObject("students", studentRepository.getAllStudents());
		return model;
	}
	
}
