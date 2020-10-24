package com.umi.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BasicController {
	@RequestMapping("/")
	public ModelAndView helloworld() {
		ModelAndView model = new ModelAndView("index");
		model.addObject("message", "HELLO WORLD");
		return model;
	}
}
