package com.umi.controllers;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.umi.repositories.EtapeRepository;

@Controller
public class BasicController {
	
	
	
//	@RequestMapping("/")
//	public ModelAndView helloworld() {
//		ModelAndView model = new ModelAndView("index");
//		model.addObject("dashboard", "mm-active");
//		model.addObject("message", "HELLO WORLD");
//		return model;
////		return new ModelAndView("redirect:/student/list");
//	}
	
	@RequestMapping("/foobar")
	public ModelAndView foobar() {
		ModelAndView model = new ModelAndView("foo_bar");
		return model;
//		return new ModelAndView("redirect:/student/list");
	}
	
}
