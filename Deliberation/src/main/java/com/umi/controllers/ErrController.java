package com.umi.controllers;

import java.io.File;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.docx4j.jaxb.Context;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.exceptions.InvalidFormatException;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart;
import org.docx4j.wml.*;
import org.docx4j.wml.ObjectFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
/**
 * the controller of 404 pages and 403 pages
 * if a page requested does not exist or
 * if the user attempts to access a page
 * while he is not authorized to
 *
 */
@Controller
public class ErrController implements ErrorController{

	
	@RequestMapping(value = "/error")	
	public ModelAndView error(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(status != null) {
			Integer statusCode = Integer.valueOf(status.toString());
			
			
			if(statusCode == HttpStatus.NOT_FOUND.value()) {
				model.setViewName("404");
				model.addObject("exception","Cette page n'existe pas.");
				return model;
			}
			else if(statusCode == HttpStatus.FORBIDDEN.value()) {
				
				if(authentication instanceof AnonymousAuthenticationToken == false) {
					model.setViewName("403");
					
					model.addObject("typeError","Accès refusé.");
					model.addObject("exception","Vous n'etes pas autorisé à accéder à cette page.");
					return model;
				}
				model.setViewName("login");
				
				model.addObject("err","Vous devez etre connecté pour avoir accès à cette page.");
				return model;
			}
		}
		
		return model;
	}

	@Override
	public String getErrorPath() {
		return "/error";
	}
	
	
	
}
