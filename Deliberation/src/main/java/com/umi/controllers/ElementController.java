package com.umi.controllers;

import com.umi.models.Etape;
import com.umi.models.Semestre;
import com.umi.models.Module;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import com.umi.models.NoteElement;
import com.umi.models.Professeur;
import com.umi.models.InscriptionPedagogique;
import com.umi.models.InscriptionPedagogiqueModule;
import com.umi.enums.TypeNote;
import com.umi.models.Element;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.umi.repositories.InscriptionPedagogiqueRepository;
import com.umi.repositories.EtapeRepository;
import com.umi.repositories.SemestreRepository;
import com.umi.repositories.ModuleRepository;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.InscriptionPedagogiqueModuleRepository;
import com.umi.repositories.ElementRepository;
import com.umi.repositories.NoteElementRepository;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Controller;

@Controller
public class ElementController
{
	@PersistenceContext
	EntityManager entityManager;
	NoteElementRepository noteElementRepository;
	ElementRepository elementRepository;
	FiliereRepository filiereRepository;
	ModuleRepository moduleRepository;
	SemestreRepository semestreRepository;
	EtapeRepository etapeRepository;
	private InscriptionPedagogiqueModuleRepository inscriptionpedagogiquemoduleRepository;
	InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository;

	public ElementController( FiliereRepository filiereRepository,  NoteElementRepository noteElementRepository,  ElementRepository elementRepository, ModuleRepository moduleRepository,  SemestreRepository semestreRepository, EtapeRepository etapeRepository
			,  InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository,
			InscriptionPedagogiqueModuleRepository inscriptionpedagogiquemoduleRepository) {
		this.noteElementRepository = noteElementRepository;
		this.elementRepository = elementRepository;
		this.moduleRepository = moduleRepository;
		this.semestreRepository = semestreRepository;
		this.filiereRepository = filiereRepository;
		this.etapeRepository = etapeRepository;
		this.inscriptionPedagogiqueRepository = inscriptionPedagogiqueRepository;
		this.inscriptionpedagogiquemoduleRepository=inscriptionpedagogiquemoduleRepository;
	}

	
	@GetMapping({ "/note/choixList" })
	public ModelAndView choixElementList() {
		ModelAndView model = new ModelAndView("choixNoteList");
		model.addObject("filieres", filiereRepository.findAll());
		model.addObject("etapes",etapeRepository.findAll());
		model.addObject("semestres", semestreRepository.findAll());
		model.addObject("modules", moduleRepository.findAll());
		model.addObject("elements",elementRepository.findAll());
		return model;
	}
	@PostMapping({ "/note/listNote" })
	public ModelAndView listNote(@RequestParam("element")  Integer id_el) {
		ModelAndView model = new ModelAndView("listNoteElement");
		//
		Element element = this.elementRepository.getOne(id_el);
		Module module= element.getModule();

		//
		List<InscriptionPedagogiqueModule> ipms=inscriptionpedagogiquemoduleRepository.getInscriptionPedagogiqueModuleByModule(module);
		Iterator<InscriptionPedagogiqueModule>  ipm=ipms.iterator();
		//
		
		List<NoteElement>  resultats=new ArrayList<NoteElement>();
		
		while(ipm.hasNext()) {
			InscriptionPedagogique etudiant= ipm.next().getInscription_pedagogique();
			Double moyenne=moyenEleve( element,  etudiant);
			NoteElement resultat = new NoteElement();
			resultat.setInscription_pedagogique(etudiant);
			resultat.setNote_element(moyenne);
			resultats.add(resultat);
			
		}
		model.addObject("resultats", resultats);
		model.addObject("element", element);
		return model;
	}

	@GetMapping({ "/note/choix" })
	public ModelAndView choixElement() {
		ModelAndView model = new ModelAndView("choixNote");
		model.addObject("filieres", filiereRepository.findAll());
		model.addObject("etapes",etapeRepository.findAll());
		model.addObject("semestres", semestreRepository.findAll());
		model.addObject("modules", moduleRepository.findAll());
		model.addObject("elements",elementRepository.findAll());
		return model;
	}
	@PostMapping({ "/note/list" })
	public ModelAndView ajouterNotePage(@RequestParam("element")  Integer id_el) {
		ModelAndView model = new ModelAndView("ajouterNote");
		Element element = this.elementRepository.getOne(id_el);
		Module module= element.getModule();
		ArrayList <InscriptionPedagogique>etudiants= new ArrayList<InscriptionPedagogique>();


		List<InscriptionPedagogiqueModule> ipms=inscriptionpedagogiquemoduleRepository.getInscriptionPedagogiqueModuleByModule(module);

		Iterator<InscriptionPedagogiqueModule>  ipm=ipms.iterator();
		while(ipm.hasNext())etudiants.add(ipm.next().getInscription_pedagogique());
		// traitement pour n'avoir qu'un examen final et un rattrapage
		int cmp=0;
		List<NoteElement> nt = noteElementRepository.getNoteElementByElement(element);
		Iterator<NoteElement>  nts=nt.iterator();
		while(nts.hasNext()) {
			
			NoteElement note =nts.next();
			System.out.println(note.getType_note().toString());
			if(note.getType_note().toString().equals("EXAM_RATTRAPAGE"))cmp=-1;
			else if(note.getType_note().toString().equals("EXAM_ORDINAIRE") && cmp==0)cmp=1;
		}
		model.addObject("cmp", cmp);
		model.addObject("Inscription", etudiants);
		model.addObject("element", element);
		return model;
	}
	@PostMapping({ "/note/ajouter" })
	public ModelAndView ajouterNote(HttpServletRequest request, @RequestParam("element")  Integer id_element,
			@RequestParam("coef")  Double coef, @RequestParam("type")  String type  ) {
		ModelAndView model = new ModelAndView("redirect:/note/choix");
		Element element = this.elementRepository.getOne(id_element);
		Module module= element.getModule();
		ArrayList <InscriptionPedagogique>etudiants= new ArrayList<InscriptionPedagogique>();


		List<InscriptionPedagogiqueModule> ipms=inscriptionpedagogiquemoduleRepository.getInscriptionPedagogiqueModuleByModule(module);

		Iterator<InscriptionPedagogiqueModule>  ipm=ipms.iterator();
		while(ipm.hasNext())etudiants.add(ipm.next().getInscription_pedagogique());
		Iterator<InscriptionPedagogique> etd= etudiants.iterator();
		while(etd.hasNext()) {
			InscriptionPedagogique etudiant = etd.next();
			NoteElement noteElement=new NoteElement();
			noteElement.setCoeficient(coef);
			noteElement.setElement(element);
			noteElement.setInscription_pedagogique(etudiant);
			noteElement.setType_note(TypeNote.valueOf(type));
			double note=Double.parseDouble(request.getParameter("note_" + etudiant.getId_ip())) ;
			if(note>=0)noteElement.setNote_element(note);

			noteElementRepository.save(noteElement);
		}

		return model;
	}  


	public double moyenEleve( Element element,  InscriptionPedagogique etudiant) {
		double moyenne = 0.0;
		double c = 0.0;
		List<NoteElement> notes = noteElementRepository.getNoteElementEtudiantElement(etudiant, element);
		for ( NoteElement note2 : notes) {
			if(note2.getNote_element()!=null &&note2.getCoeficient()!=null) {
				moyenne += note2.getCoeficient() * note2.getNote_element();
			c += note2.getCoeficient();
			}
			
		}
		moyenne /= c;
		return moyenne;
	}

	public double moyenEleveModule( Module module,  InscriptionPedagogique etudiant) {
		double moyenne = 0.0;
		double c = 0.0;
		List<Element> elements = elementRepository.getElementByModule(module);
		for ( Element element : elements) {
			moyenne += this.moyenEleve(element, etudiant);
			c += element.getCoeficient();
		}
		moyenne /= c;
		return moyenne;
	}

	public double moyenEleveSemestre( Semestre semestre,  InscriptionPedagogique etudiant) {
		double moyenne = 0.0;
		double c = 0.0;
		List<Module> modules = moduleRepository.getModuleBySemestre(semestre);
		for (Module module : modules) {
			moyenne += moyenEleveModule(module, etudiant);
			c += module.getCoeficient();
		}
		moyenne /= c;
		return moyenne;
	}

	public double moyenEleveEtape( Etape etape,  InscriptionPedagogique etudiant) {
		double moyenne = 0.0;
		double c = 0.0;
		List<Semestre> semestres = semestreRepository.getSemestreByEtape(etape);
		for (Semestre semestre : semestres) {
			moyenne += moyenEleveSemestre(semestre, etudiant);
			
		}
		moyenne /= 2;
		return moyenne;
	}

	public boolean validEleveElement( Element element,  InscriptionPedagogique etudiant) {
		return moyenEleve(element, etudiant) < element.getValidation();
	}

	public boolean validEleveModule( Module module,  InscriptionPedagogique etudiant) {
		return moyenEleveModule(module, etudiant) < module.getValidation();
	}
}