package com.umi.controllers;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.Part ;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.data.repository.query.Param;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.net.HttpHeaders;
import com.umi.models.Etape;
import com.umi.models.Etudiant;
import com.umi.models.Filiere;
import com.umi.models.Historique;
import com.umi.models.InscriptionPedagogique;
import com.umi.models.InscriptionPedagogiqueModule;
import com.umi.models.Module;
import com.umi.models.Semestre;
import com.umi.repositories.ElementRepository;
import com.umi.repositories.EtapeRepository;
import com.umi.repositories.EtudiantRepository;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.HistoriqueRepository;
import com.umi.repositories.InscriptionPedagogiqueModuleRepository;
import com.umi.repositories.InscriptionPedagogiqueRepository;
import com.umi.repositories.ModuleRepository;
import com.umi.repositories.NoteElementRepository;
import com.umi.repositories.ProfesseurRepository;
import com.umi.repositories.ResponsableRepository;
import com.umi.repositories.SemestreRepository;
import com.umi.repositories.UserRepository;
import com.umi.models.Professeur;
import com.umi.models.Responsable;
import com.umi.authentication.User;



@Controller
public class DeliberationXclController {

	@PersistenceContext
	EntityManager entityManager;
	NoteElementRepository noteElementRepository;
	ElementRepository elementRepository;
	FiliereRepository filiereRepository;
	ModuleRepository moduleRepository;
	SemestreRepository semestreRepository;
	EtapeRepository etapeRepository;
	InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository;
	InscriptionPedagogiqueModuleRepository inscriptionPedagogiqueModuleRepository;
	EtudiantRepository etudiantRepository;
	UserRepository userRepository;
	ProfesseurRepository professeurRepository;
	ResponsableRepository responsableRepository;
	HistoriqueRepository historiqueRepository;



	public DeliberationXclController(EntityManager entityManager, NoteElementRepository noteElementRepository,
			ElementRepository elementRepository, FiliereRepository filiereRepository, ModuleRepository moduleRepository,
			SemestreRepository semestreRepository, EtapeRepository etapeRepository,
			InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository,
			InscriptionPedagogiqueModuleRepository inscriptionPedagogiqueModuleRepository,EtudiantRepository etudiantRepository,
			UserRepository userRepository, ProfesseurRepository professeurRepository,
			ResponsableRepository responsableRepository,
			HistoriqueRepository historiqueRepository) {
		super();
		this.entityManager = entityManager;
		this.noteElementRepository = noteElementRepository;
		this.elementRepository = elementRepository;
		this.filiereRepository = filiereRepository;
		this.moduleRepository = moduleRepository;
		this.semestreRepository = semestreRepository;
		this.etapeRepository = etapeRepository;
		this.inscriptionPedagogiqueRepository = inscriptionPedagogiqueRepository;
		this.inscriptionPedagogiqueModuleRepository= inscriptionPedagogiqueModuleRepository;
		this.etudiantRepository =etudiantRepository;
		this.userRepository = userRepository;
		this.professeurRepository = professeurRepository;
		this.responsableRepository = responsableRepository;
		this.historiqueRepository = historiqueRepository;
	}
	@GetMapping({ "/delib/menuDeliberation" })
	public ModelAndView choixSessionList() {
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
		ModelAndView model = new ModelAndView("redirect:/login");
		if(user.getRoles().equals("ADMIN")) {
			model = new ModelAndView("menuDeliberation");			
		}else if(user.getRoles().equals("PROF")) {
			model = new ModelAndView("menuDeliberationProf");
		}else if(user.getRoles().equals("RESPONSABLE")) {
			model = new ModelAndView("menuDeliberationResp");
		}
		return model;
	}
	@GetMapping({ "/delib/choixOrdinnaire" })
	public ModelAndView choixElementList() {
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
		if(user.getRoles().equals("ADMIN")) {
			ModelAndView model = new ModelAndView("ChoixOrdinnaire");
			model.addObject("filieres", filiereRepository.findAll());
			model.addObject("etapes",etapeRepository.findAll());
			model.addObject("semestres", semestreRepository.findAll());
			model.addObject("modules", moduleRepository.findAll());
			return model;			
		}else if (user.getRoles().equals("PROF")) {
			Professeur professeur = professeurRepository.getProfesseurByUser(user);
			if(professeur != null) {				
				ModelAndView model = new ModelAndView("ChoixOrdinnaireProf");
				model.addObject("modules", moduleRepository.getModulesByProfesseur(professeur));
				return model;
			}else return new ModelAndView("redirect:/login");
		}else if(user.getRoles().equals("RESPONSABLE")) {
			Responsable responsable = responsableRepository.getResponsableByUser(user);
			if(responsable != null) {
				ModelAndView model = new ModelAndView("ChoixOrdinnaireResp");
				Filiere filiere = responsable.getFiliere();
				model.addObject("modules", moduleRepository.getModulesByFiliere(filiere));
				return model;
			}else return new ModelAndView("redirect:/login");
		}
		return new ModelAndView("redirect:/login");
	}

	@GetMapping("/delib/importOrdinaire/{id}")
	public ModelAndView ajouterOrdinaireProf(@PathVariable("id")  Integer id_mdl) {
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
		if(user.getRoles().equals("ADMIN")) {
			ModelAndView model = new ModelAndView("importOrdinaire");
			Module module= moduleRepository.getOne(id_mdl);
			model.addObject("module", module);
			return model;			
		}else if(user.getRoles().equals("PROF")) {
			ModelAndView model = new ModelAndView("importOrdinaireProf");
			Module module= moduleRepository.getOne(id_mdl);
			model.addObject("module", module);
			return model;
		}else if(user.getRoles().equals("RESPONSABLE")) {
			ModelAndView model = new ModelAndView("importOrdinaireResp");
			Module module= moduleRepository.getOne(id_mdl);
			model.addObject("module", module);
			return model;
		}
		return new ModelAndView("redirect:/login");
	}


	@PostMapping({ "/delib/importOrdinaire" })
	public ModelAndView ajouterOrdinaire(@RequestParam("module")  Integer id_mdl) {
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
		if(user.getRoles().equals("ADMIN")) {
			ModelAndView model = new ModelAndView("importOrdinaire");
			Module module= moduleRepository.getOne(id_mdl);


			model.addObject("module", module);
			return model;

		}else if(user.getRoles().equals("PROF")) {
			ModelAndView model = new ModelAndView("importOrdinaireProf");
			Module module= moduleRepository.getOne(id_mdl);


			model.addObject("module", module);
			return model; 
		}else if(user.getRoles().equals("RESPONSABLE")) {
			ModelAndView model = new ModelAndView("importOrdinaireResp");
			Module module= moduleRepository.getOne(id_mdl);
			model.addObject("module", module);
			return model; 
		}
		return new ModelAndView("redirect:/login");
	}

	@PostMapping("/delib/UploadOrdinaire")//here
	public ResponseEntity UploadOrdinaire(@RequestParam("file") Part file ,@RequestParam("module") int id_mdl ) throws IOException {

		Module module= moduleRepository.getOne(id_mdl);
		InputStream   inputStream=null;
		if (file != null) {
			// prints out some information for debugging
			System.out.println(file.getName());
			System.out.println(file.getSize());
			System.out.println(file.getContentType());

			// obtains input stream of the upload file
			inputStream = file.getInputStream();
		}


		//excelImportDelib.write(file,module);
		addFromExcelOrdinnaire(inputStream, module);
		WriteXCLRattrapage(module);
		
		historiqueRepository.save(new Historique("Importation d'une déliberation ordinaire par excel", new Date()));
		
		return ResponseEntity.ok().contentType(MediaType.parseMediaType("APPLICATION/OCTET-STREAM"))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachement; filename=\"ResultatOrdinnaire.xlsx\"")
				.body(Files.readAllBytes(new File("List_Rattrapage.xlsx").toPath()));
	}
	@GetMapping("/delib/ListRatt")//here
	public ResponseEntity UploadOrdinaireNonvalide(@RequestParam("module") int id_mdl ) throws IOException {

		Module module= moduleRepository.getOne(id_mdl);


		WriteXCL(module);

		return ResponseEntity.ok().contentType(MediaType.parseMediaType("APPLICATION/OCTET-STREAM"))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachement; filename=\"Liste_Rattrapage.xlsx\"")
				.body(Files.readAllBytes(new File("List_Rattrapage.xlsx").toPath()));
	}

	@PostMapping("/delib/UploadRattrapage")//here
	public ResponseEntity UploadRattrapage(@RequestParam("file") Part file ,@RequestParam("module") int id_mdl ) throws IOException {
		Module module= moduleRepository.getOne(id_mdl);
		InputStream   inputStream=null;
		if (file != null) {
			// prints out some information for debugging
			System.out.println(file.getName());
			System.out.println(file.getSize());
			System.out.println(file.getContentType());

			// obtains input stream of the upload file
			inputStream = file.getInputStream();
		}

		//excelImportDelib.write(file,module);
		addFromExcelRattrapage(inputStream, module);
		WriteXCLRattrapage( module);
		historiqueRepository.save(new Historique("Importation d'une déliberation rattrapage par excel", new Date()));
		return ResponseEntity.ok().contentType(MediaType.parseMediaType("APPLICATION/OCTET-STREAM"))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachement; filename=\"Resultat "+module.getLibelle_module()+".xlsx\"")
				.body(Files.readAllBytes(new File("List_Rattrapage.xlsx").toPath()));
	}

	//////////////////////////RATTRAPAGE


	@GetMapping( "/delib/choixRattrapage")
	public ModelAndView choixRattrapage() {
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
		if(user.getRoles().equals("ADMIN")) {
			ModelAndView model = new ModelAndView("ChoixRattrapage");
			model.addObject("filieres", filiereRepository.findAll());
			model.addObject("etapes",etapeRepository.findAll());
			model.addObject("semestres", semestreRepository.findAll());
			model.addObject("modules", moduleRepository.findAll());			
			return model;
		}else if(user.getRoles().equals("PROF")) {
			Professeur professeur = professeurRepository.getProfesseurByUser(user);
			if(professeur != null) {
				ModelAndView model = new ModelAndView("ChoixRattrapageProf");
				model.addObject("modules", moduleRepository.getModulesByProfesseur(professeur));
				System.out.println("choix rattrapage prof");
				return model;
			}else {
				System.out.println("prof is : " + professeur);
				return new ModelAndView("redirect:/login");
			}
		}else if(user.getRoles().equals("RESPONSABLE")) {
			Responsable responsable = responsableRepository.getResponsableByUser(user);
			if(responsable!= null) {
				ModelAndView model = new ModelAndView("ChoixRattrapageResp");
				Filiere filiere = responsable.getFiliere();
				model.addObject("modules", moduleRepository.getModulesByFiliere(filiere));
				System.out.println("choix rattrapage resp");
				return model;
			}else {
				System.out.println("resp is : " + responsable);
				return new ModelAndView("redirect:/login");
			}
		}
		return new ModelAndView("redirect:/login");
	}

	@GetMapping("/delib/importRattrapage/{id}")
	public ModelAndView ajouterRattrapageProf(@PathVariable("id")  Integer id_mdl) {
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
		if(user.getRoles().equals("ADMIN")) {
			ModelAndView model = new ModelAndView("importRattrapage");
			Module module= moduleRepository.getOne(id_mdl);
			model.addObject("module", module);
			return model;			
		}else if(user.getRoles().equals("PROF")) {
			ModelAndView model = new ModelAndView("importRattrapageProf");
			Module module= moduleRepository.getOne(id_mdl);
			model.addObject("module", module);
			return model;
		}else if(user.getRoles().equals("RESPONSABLE")) {
			ModelAndView model = new ModelAndView("importRattrapageResp");
			Module module= moduleRepository.getOne(id_mdl);
			model.addObject("module", module);
			return model;
		}
		return new ModelAndView("redirect:/login");
	}

	@PostMapping({ "/delib/importRattrapage" })
	public ModelAndView ajouterRattrapage(@RequestParam("module")  Integer id_mdl) {
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
		if(user.getRoles().equals("ADMIN")) {
			ModelAndView model = new ModelAndView("importRattrapage");
			Module module= moduleRepository.getOne(id_mdl);


			model.addObject("module", module);
			return model;

		}else if (user.getRoles().equals("PROF")) {
			ModelAndView model = new ModelAndView("importRattrapageProf");
			Module module= moduleRepository.getOne(id_mdl);


			model.addObject("module", module);
			return model;
		}else if(user.getRoles().equals("RESPONSABLE")) {
			ModelAndView model = new ModelAndView("importRattrapageResp");
			Module module= moduleRepository.getOne(id_mdl);
			model.addObject("module", module);
			return model;
		}
		return new ModelAndView("redirect:/login");
	}


	// Liste Déliberation par module
	@GetMapping({ "/delib/choixList" })
	public ModelAndView choixList() {
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
		if(user.getRoles().equals("ADMIN")) {
			ModelAndView model = new ModelAndView("ChoixListDelibModule");
			model.addObject("filieres", filiereRepository.findAll());
			model.addObject("etapes",etapeRepository.findAll());
			model.addObject("semestres", semestreRepository.findAll());
			model.addObject("modules", moduleRepository.findAll());
			return model;
		}else if(user.getRoles().equals("PROF")) {
			Professeur professeur = professeurRepository.getProfesseurByUser(user);
			if(professeur != null) {
				ModelAndView model = new ModelAndView("ChoixListDelibModuleProf");
				model.addObject("modules", moduleRepository.getModulesByProfesseur(professeur));
				return model;
			}else new ModelAndView("redirect:/login");
		}else if(user.getRoles().equals("RESPONSABLE")) {
			Responsable responsable = responsableRepository.getResponsableByUser(user);
			if(responsable!= null) {
				ModelAndView model = new ModelAndView("ChoixListDelibModuleResp");
				Filiere filiere = responsable.getFiliere();
				model.addObject("modules", moduleRepository.getModulesByFiliere(filiere));
				return model;
			}else new ModelAndView("redirect:/login");
		}
		return new ModelAndView("redirect:/login");

	}

	@GetMapping("/delib/list/{id}")
	public ModelAndView ajouterWithProf(@PathVariable("id")  Integer id_mdl) {
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
			ModelAndView model = new ModelAndView("listValidationModuleProf");
			Module module= moduleRepository.getOne(id_mdl);
			List<InscriptionPedagogiqueModule> ipm= inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByModule(module);
			
			model.addObject("etudiants", ipm);
			return model;
		}else if(user.getRoles().equals("RESPONSABLE")) {
			ModelAndView model = new ModelAndView("listValidationModuleResp");
			Module module= moduleRepository.getOne(id_mdl);
			List<InscriptionPedagogiqueModule> ipm= inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByModule(module);
			
			model.addObject("etudiants", ipm);
			return model;
		}
		return new ModelAndView("redirect:/login");
	}

	@PostMapping({ "/delib/list" })//new
	public ModelAndView ajouter(@RequestParam("module")  Integer id_mdl) {
		ModelAndView model = new ModelAndView("listValidationModule");
		Module module= moduleRepository.getOne(id_mdl);
		List<InscriptionPedagogiqueModule> ipm= inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByModule(module);
		
		model.addObject("module", module);
		model.addObject("etudiants", ipm);
		return model;
	}
	@GetMapping("/delib/XCLModule")//new
	public ResponseEntity UploadModule(@RequestParam("module") int id ) throws IOException {
		
		Module module= moduleRepository.getOne(id);
		
		
		WriteXCLRattrapage( module);
		
		return ResponseEntity.ok().contentType(MediaType.parseMediaType("APPLICATION/OCTET-STREAM"))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachement; filename=\"Resultat_deliberation_Module.xlsx\"")
				.body(Files.readAllBytes(new File("src/main/resources/static/Excels/List_Rattrapage.xlsx").toPath()));
	}
	

	// Liste Déliberation par Semestre à faire
	@GetMapping({ "/delib/choixListSemestre" })
	public ModelAndView choixListSemestre() {
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
		if(user.getRoles().equals("ADMIN")) {
			ModelAndView model = new ModelAndView("ChoixListDelibSemestre");
			model.addObject("filieres", filiereRepository.findAll());
			model.addObject("etapes",etapeRepository.findAll());
			model.addObject("semestres", semestreRepository.findAll());
			return model;
		}else if(user.getRoles().equals("PROF")) {
			ModelAndView model = new ModelAndView("ChoixListDelibSemestreProf");
			Professeur professeur = professeurRepository.getProfesseurByUser(user);
			if(professeur != null) {
				List<Module> modules = moduleRepository.getModulesByProfesseur(professeur);
				List<Semestre> semestres = new ArrayList<Semestre>();
				if(modules != null) {
					for(Module module : modules) {
						if(!semestres.contains(module.getSemestre())) {
							semestres.add(module.getSemestre());
						}
					}
				}
				model.addObject("semestres", semestres);
				return model;
			}else return new ModelAndView("redirect:/login");
		}else if(user.getRoles().equals("RESPONSABLE")) {
			ModelAndView model = new ModelAndView("ChoixListDelibSemestreResp");
			Responsable responsable = responsableRepository.getResponsableByUser(user);
			if(responsable != null) {
				Filiere filiere = responsable.getFiliere();
				model.addObject("semestres", semestreRepository.getSemestreByFiliere(filiere));
				return model;
			}
		}
		return new ModelAndView("redirect:/login");
	}
	
	@PostMapping({ "/delib/listSemestre" })//new
	public ModelAndView DéliberationSemestre(@RequestParam("semestre")  Integer id_sem) {
		ModelAndView model = new ModelAndView("listValidationSemestre");
		Semestre semestre= semestreRepository.getOne(id_sem);
		List<InscriptionPedagogique> ip= inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueBySemestre(semestre);
		Iterator<InscriptionPedagogique> ins = ip. iterator();
		while(ins.hasNext())validationSemestre(ins.next());
		model.addObject("semestre", semestre);
		model.addObject("etudiants", ip);
		return model;
	}
	
	@GetMapping("/delib/XCLSemstre")//new
	public ResponseEntity UploadSemestre(@RequestParam("semestre") int id ) throws IOException {
		
		Semestre semestre= semestreRepository.getOne(id);
		
		
		WriteXCLSemestre(semestre);
		
		return ResponseEntity.ok().contentType(MediaType.parseMediaType("APPLICATION/OCTET-STREAM"))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachement; filename=\"Resultat_deliberation.xlsx\"")
				.body(Files.readAllBytes(new File("src/main/resources/static/Excels/List_Rattrapage.xlsx").toPath()));
	}


	@GetMapping("/delib/listSemestre/{id}")
	public ModelAndView DéliberationSemestreProf(@PathVariable("id")  Integer id_sem) {
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
			ModelAndView model = new ModelAndView("listValidationSemestreProf");
			Semestre semestre= semestreRepository.getOne(id_sem);
			List<InscriptionPedagogique> ip= inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueBySemestre(semestre);
			Iterator<InscriptionPedagogique> ins = ip. iterator();
			while(ins.hasNext())validationSemestre(ins.next());
			
			model.addObject("etudiants", ip);
			return model;			
		}else if(user.getRoles().equals("RESPONSABLE")) {
			ModelAndView model = new ModelAndView("listValidationSemestreResp");
			Semestre semestre= semestreRepository.getOne(id_sem);
			List<InscriptionPedagogique> ip= inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueBySemestre(semestre);
			Iterator<InscriptionPedagogique> ins = ip. iterator();
			while(ins.hasNext())validationSemestre(ins.next());
			
			model.addObject("etudiants", ip);
			return model;
		}
		return new ModelAndView("redirect:/login");
	}




	// Liste Déliberation par Etape 
	@GetMapping({ "/delib/choixListEtape" })//here
	public ModelAndView choixListEtape() {
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
		if(user.getRoles().equals("ADMIN")) {
			ModelAndView model = new ModelAndView("ChoixListDelibEtape");
			model.addObject("filieres", filiereRepository.findAll());
			model.addObject("etapes",etapeRepository.findAll());
			return model;
		}else if(user.getRoles().equals("PROF")) {
			Professeur professeur = professeurRepository.getProfesseurByUser(user);
			if(professeur != null) {
				ModelAndView model = new ModelAndView("ChoixListDelibEtapeProf");
				List<Etape> etapes = new ArrayList<Etape>();
				List<Module> modules = moduleRepository.getModulesByProfesseur(professeur);
				if(modules != null)
					for(Module module: modules) {
						if(module.getSemestre() != null)
							if(module.getSemestre().getEtape() != null)
								if(!etapes.contains(module.getSemestre().getEtape()))etapes.add(module.getSemestre().getEtape());
					}
				model.addObject("etapes",etapes);
				return model;
			}else return new ModelAndView("redirect:/login");
		}else if(user.getRoles().equals("RESPONSABLE")) {
			Responsable responsable = responsableRepository.getResponsableByUser(user);
			if(responsable != null) {
				List<Etape> etapes = etapeRepository.getEtapeByFiliere(responsable.getFiliere());
				ModelAndView model = new ModelAndView("ChoixListDelibEtapeResp");
				model.addObject("etapes",etapes);
				return model;
			}
		}
		return new ModelAndView("redirect:/login");
	}
	@PostMapping({ "/delib/listEtape" })//new
	public ModelAndView DéliberationEtape(@RequestParam("etape")  Integer id) {
		ModelAndView model = new ModelAndView("listValidationEtape");
		Etape etape= etapeRepository.getOne(id);
		List<InscriptionPedagogique> ip= validationEtape( etape);
		model.addObject("etudiants", ip);
		return model;
	}

	@GetMapping({ "/delib/listEtape/{id}" })//new
	public ModelAndView DéliberationEtapePROFandRESP(@PathVariable("id")  Integer id) {
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
			ModelAndView model = new ModelAndView("listValidationEtapeProf");
			Etape etape= etapeRepository.getOne(id);
			List<InscriptionPedagogique> ip= validationEtape( etape);
			model.addObject("etudiants", ip);
			return model;			
		}else if(user.getRoles().equals("RESPONSABLE")) {
			ModelAndView model = new ModelAndView("listValidationEtapeResp");
			Etape etape= etapeRepository.getOne(id);
			List<InscriptionPedagogique> ip= validationEtape( etape);
			model.addObject("etudiants", ip);
			return model;
		}
		return new ModelAndView("redirect:/login");
	}

	public void addFromExcelOrdinnaire(InputStream inputStream, Module module) {
		InscriptionPedagogiqueModule ipm = new InscriptionPedagogiqueModule();




		try {
			long start = System.currentTimeMillis();

			Workbook workbook = new XSSFWorkbook(inputStream);

			Sheet firstSheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = firstSheet.iterator();



			rowIterator.next(); // skip the header row

			while (rowIterator.hasNext()) {
				Row nextRow = rowIterator.next();
				Iterator<Cell> cellIterator = nextRow.cellIterator();
				double moyenne=0;
				double coeficient=0;
				double note=0;
				while (cellIterator.hasNext()) {
					Cell nextCell = cellIterator.next();

					int columnIndex = nextCell.getColumnIndex();

					switch (columnIndex) {
					case 0:
						Etudiant etud ;
						String cne;
						switch (nextCell.getCellType()) {
						case  STRING:
							cne = nextCell.getStringCellValue();
							etud= etudiantRepository.getEtudiantByCne(cne);
							System.out.println(etud.getFirst_name_fr());
							ipm=inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiantAndModule(etud, module);
							break;
						case BOOLEAN:

							cne = ""+nextCell.getBooleanCellValue();
							etud= etudiantRepository.getEtudiantByCne(cne);
							System.out.println(etud.getFirst_name_fr());
							ipm=inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiantAndModule(etud, module);
							break;
						case NUMERIC:
							cne =""+(int)nextCell.getNumericCellValue();
							etud= etudiantRepository.getEtudiantByCne(cne);
							System.out.println(etud.getFirst_name_fr());
							ipm=inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiantAndModule(etud, module);
							break;
						}             


						break;
					case 1:
						break;
					case 2:
						break;
					default:
						String c=null;
						String nt=null; 
						Double coef;

						switch (nextCell.getCellType()) {
						case  STRING:
							nt= nextCell.getStringCellValue();
							if(nt.trim().equals("abs")) note=0;
							else
							note=Double.parseDouble(nt);

							if(cellIterator.hasNext()) {
								nextCell = cellIterator.next();
								c=nextCell.getStringCellValue();
								switch (nextCell.getCellType()) {
								case  STRING:
									c= nextCell.getStringCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
								case BOOLEAN:
									c=""+nextCell.getBooleanCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								case NUMERIC:
									c=""+nextCell.getNumericCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								} 


							}
						case BOOLEAN:
							nt=""+nextCell.getStringCellValue();
							if(nt.trim().equals("abs")) note=0;
							else
							note=Double.parseDouble(nt);

							if(cellIterator.hasNext()) {
								nextCell = cellIterator.next();
								c=nextCell.getStringCellValue();
								switch (nextCell.getCellType()) {
								case  STRING:
									c= nextCell.getStringCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
								case BOOLEAN:
									c=""+nextCell.getBooleanCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								case NUMERIC:
									c=""+nextCell.getNumericCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								} 


							}
							break;
						case NUMERIC:
							nt=""+nextCell.getNumericCellValue();
							note=Double.parseDouble(nt);

							if(cellIterator.hasNext()) {
								nextCell = cellIterator.next();
								switch (nextCell.getCellType()) {
								case  STRING:
									c= nextCell.getStringCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
								case BOOLEAN:
									c=""+nextCell.getBooleanCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								case NUMERIC:
									c=""+nextCell.getNumericCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								} 


							}
							break;
						} 




						break;

					}

				}
				if(coeficient==0)moyenne=note;
				else moyenne/=coeficient;

				if(moyenne >= module.getValidation() )ipm.setValidation(1.0);
				else ipm.setValidation(0.0);
				ipm.setNote_module(moyenne);

				inscriptionPedagogiqueModuleRepository.updateInscriptionPedagogiqueModule(ipm.getId(), 
						ipm.getInscription_pedagogique(), ipm.getModule(), ipm.getNote_module(), ipm.getValidation());


			}

			workbook.close();



			long end = System.currentTimeMillis();
			System.out.printf("Import done in %d ms\n", (end - start));

		} catch (IOException ex1) {
			System.out.println("Error reading file");
			ex1.printStackTrace();
		} 





	}

	
	public void addFromExcelRattrapage(InputStream inputStream, Module module) 
	{
		InscriptionPedagogiqueModule ipm = new InscriptionPedagogiqueModule();




		try {
			long start = System.currentTimeMillis();

			Workbook workbook = new XSSFWorkbook(inputStream);

			Sheet firstSheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = firstSheet.iterator();



			rowIterator.next(); // skip the header row

			while (rowIterator.hasNext()) {
				Row nextRow = rowIterator.next();
				Iterator<Cell> cellIterator = nextRow.cellIterator();
				double moyenne=0;
				double coeficient=0;
				double note=0;
				while (cellIterator.hasNext()) {
					Cell nextCell = cellIterator.next();

					int columnIndex = nextCell.getColumnIndex();

					switch (columnIndex) {
					case 0:
						Etudiant etud ;
						String cne;
						switch (nextCell.getCellType()) {
						case  STRING:
							cne = nextCell.getStringCellValue();
							etud= etudiantRepository.getEtudiantByCne(cne);
							System.out.println(etud.getFirst_name_fr());
							ipm=inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiantAndModule(etud, module);
							break;
						case BOOLEAN:

							cne = ""+nextCell.getBooleanCellValue();
							etud= etudiantRepository.getEtudiantByCne(cne);
							System.out.println(etud.getFirst_name_fr());
							ipm=inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiantAndModule(etud, module);
							break;
						case NUMERIC:
							cne =""+(int)nextCell.getNumericCellValue();
							etud= etudiantRepository.getEtudiantByCne(cne);
							System.out.println(etud.getFirst_name_fr());
							ipm=inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiantAndModule(etud, module);
							break;
						}             


						break;
					case 1:
						break;
					case 2:
						break;
					default:
						String c=null;
						String nt=null; 
						Double coef;

						switch (nextCell.getCellType()) {
						case  STRING:
							nt= nextCell.getStringCellValue();
							note=Double.parseDouble(nt);

							if(cellIterator.hasNext()) {
								nextCell = cellIterator.next();
								c=nextCell.getStringCellValue();
								switch (nextCell.getCellType()) {
								case  STRING:
									c= nextCell.getStringCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
								case BOOLEAN:
									c=""+nextCell.getBooleanCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								case NUMERIC:
									c=""+nextCell.getNumericCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								} 


							}
						case BOOLEAN:
							nt=""+nextCell.getBooleanCellValue();
							note=Double.parseDouble(nt);

							if(cellIterator.hasNext()) {
								nextCell = cellIterator.next();
								c=nextCell.getStringCellValue();
								switch (nextCell.getCellType()) {
								case  STRING:
									c= nextCell.getStringCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
								case BOOLEAN:
									c=""+nextCell.getBooleanCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								case NUMERIC:
									c=""+nextCell.getNumericCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								} 


							}
							break;
						case NUMERIC:
							nt=""+nextCell.getNumericCellValue();
							note=Double.parseDouble(nt);

							if(cellIterator.hasNext()) {
								nextCell = cellIterator.next();
								switch (nextCell.getCellType()) {
								case  STRING:
									c= nextCell.getStringCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
								case BOOLEAN:
									c=""+nextCell.getBooleanCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								case NUMERIC:
									c=""+nextCell.getNumericCellValue();
									coef=Double.parseDouble(c);  
									moyenne+=note*coef;
									coeficient+=coef;
									break;
								} 


							}
							break;
						} 




						break;

					}

				}
				if(coeficient==0)moyenne=note;
				else moyenne/=coeficient;
				if(moyenne>ipm.getNote_module())
					{
					ipm.setNote_module(moyenne);
					if(moyenne >= module.getValidation() )ipm.setValidation(2.0);
				else ipm.setValidation(0.0);
					}
				
				
				

				inscriptionPedagogiqueModuleRepository.updateInscriptionPedagogiqueModule(ipm.getId(), 
						ipm.getInscription_pedagogique(), ipm.getModule(), ipm.getNote_module(), ipm.getValidation());


			}

			workbook.close();



			long end = System.currentTimeMillis();
			System.out.printf("Import done in %d ms\n", (end - start));

		} catch (IOException ex1) {
			System.out.println("Error reading file");
			ex1.printStackTrace();
		} 





	}


	public void validationSemestre(InscriptionPedagogique ip ) //new
	{
		List<Module> modules=moduleRepository.getModuleBySemestre(ip.getSemestre());
		Iterator<Module> m= modules.iterator();
		double moyenne=0;
		double coef =0;
		double compensation=0;
		while(m.hasNext()) {
			Module module =m.next();
			InscriptionPedagogiqueModule ipm =inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiantAndModule(ip.getEtudiant(), module); 
		if(ipm!=null) {
			if(ipm.getNote_module()==null) {
				compensation=3.0;
				
				break;
			}
			
			
			else if( ipm.getNote_module()<=module.getEliminatoire() && compensation!=3)compensation =-1;
			else if(ipm.getNote_module()<module.getValidation() && ipm.getNote_module()>module.getEliminatoire() && compensation==0) 
				compensation =1;
			moyenne+= ipm.getNote_module() * module.getCoeficient();
			coef+=module.getCoeficient();
		}
			
		
		
		}
		moyenne/=coef;
		ip.setNote_semestre(moyenne);
		 if(compensation==0 && moyenne>= ip.getSemestre().getValidation())ip.setValidation(1.0);
		 else if (compensation==1 && moyenne>= ip.getSemestre().getValidation())ip.setValidation(2.0);
		 else if(compensation == 3) {
			 ip.setValidation(3.0);
			 ip.setNote_semestre(-1.0);
		 }
		 else ip.setValidation(0.0);
		 inscriptionPedagogiqueRepository.updateInscriptionPedagogiqueModule(ip.getId_ip(), ip.getNote_semestre(), ip.getValidation());
	}



	public void WriteXCL(Module module)
	{
		List<InscriptionPedagogiqueModule> etd= inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByValidation(module);
		
		
		//Blank workbook
		XSSFWorkbook workbook = new XSSFWorkbook(); 

		//Create a blank sheet
		XSSFSheet sheet = workbook.createSheet("Employee Data");

		//This data needs to be written (Object[])
		Map<String, Object[]> data = new TreeMap<String, Object[]>();
		data.put("1", new Object[] {"CNE", "NOM", "PRENOM","Note1","Coef1","Note2","Coef2"});
		Iterator<InscriptionPedagogiqueModule> j = etd.iterator();
		int c=2;
		while(j.hasNext())
		{
			InscriptionPedagogiqueModule e= j.next();
		if(e.getModule().getEliminatoire()< e.getNote_module()) {
		data.put(""+c++, new Object[] {e.getInscription_pedagogique().getEtudiant().getCne(),
				e.getInscription_pedagogique().getEtudiant().getLast_name_fr(),
				e.getInscription_pedagogique().getEtudiant().getFirst_name_fr()});
		}
		}



		//Iterate over data and write to sheet
		Set<String> keyset = data.keySet();
		int rownum = 0;
		for (String key : keyset)
		{
			Row row = sheet.createRow(rownum++);
			Object [] objArr = data.get(key);
			int cellnum = 0;
			for (Object obj : objArr)
			{
				Cell cell = row.createCell(cellnum++);
				if(obj instanceof String)
					cell.setCellValue((String)obj);
				else if(obj instanceof Integer)
					cell.setCellValue((Integer)obj);
			}
		}
		try
		{
			//Write the workbook in file system
			String excelFilePath = "src/main/resources/static/Excels/List_Rattrapage.xlsx";
			FileOutputStream out = new FileOutputStream(new File(excelFilePath));
			workbook.write(out);
			out.close();
			System.out.println("File.xlsx written successfully on disk.");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	
	public void WriteXCLRattrapage(Module module) 
	{
		List<InscriptionPedagogiqueModule> etd= inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByModule(module);
		
		
		//Blank workbook
		XSSFWorkbook workbook = new XSSFWorkbook(); 

		//Create a blank sheet
		XSSFSheet sheet = workbook.createSheet("Employee Data");

		//This data needs to be written (Object[])
		Map<String, Object[]> data = new TreeMap<String, Object[]>();
		data.put("1", new Object[] {"CNE", "NOM", "PRENOM","Note","Validation"});
		Iterator<InscriptionPedagogiqueModule> j = etd.iterator();
		int c=2;
		while(j.hasNext()) {InscriptionPedagogiqueModule e= j.next();
		String v="valider";
		if(e.getValidation()==0)v="Non Valide";
		data.put(""+c++, new Object[] {e.getInscription_pedagogique().getEtudiant().getCne(),
				e.getInscription_pedagogique().getEtudiant().getLast_name_fr(),
				e.getInscription_pedagogique().getEtudiant().getFirst_name_fr(),""+e.getNote_module(),v});
		}



		//Iterate over data and write to sheet
		Set<String> keyset = data.keySet();
		int rownum = 0;
		for (String key : keyset)
		{
			Row row = sheet.createRow(rownum++);
			Object [] objArr = data.get(key);
			int cellnum = 0;
			for (Object obj : objArr)
			{
				Cell cell = row.createCell(cellnum++);
				if(obj instanceof String)
					cell.setCellValue((String)obj);
				else if(obj instanceof Integer)
					cell.setCellValue((Integer)obj);
			}
		}
		try
		{
			//Write the workbook in file system
			String excelFilePath = "src/main/resources/static/Excels/List_Rattrapage.xlsx";
			FileOutputStream out = new FileOutputStream(new File(excelFilePath));
			workbook.write(out);
			out.close();
			System.out.println("File.xlsx written successfully on disk.");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	public void WriteXCLSemestre(Semestre semestre) //new
	{
		List<Module> modules = moduleRepository.getModuleBySemestre(semestre);
		List<InscriptionPedagogique> etds= inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueBySemestre(semestre);
		
		String[] str = new String [modules.size()+ 3];
		str[0]="CNE";
		str[1]="NOM";
		str[2]="PRENOM";
		for(int i=0;i<modules.size();i++)str[3+i]=modules.get(i).getLibelle_module();
		//àfaire
		
		
		//Blank workbook
		XSSFWorkbook workbook = new XSSFWorkbook(); 

		//Create a blank sheet
		XSSFSheet sheet = workbook.createSheet("Employee Data");

		//This data needs to be written (Object[])
		Map<String, Object[]> data = new TreeMap<String, Object[]>();
		data.put("1", str);
		Iterator<InscriptionPedagogique> j = etds.iterator();
		int c=2;
		while(j.hasNext()) {InscriptionPedagogique e= j.next();
		
		
		String[] str1 = new String [modules.size()+ 3];
		for(int i=0;i<modules.size();i++) {
			Iterator<Module> mod=modules.iterator();
			Module module=mod.next();
			InscriptionPedagogiqueModule ipm = inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiantAndModule(e.getEtudiant(), module);
			str1[3+i]=""+ipm.getNote_module();
		}
		str1[0]=e.getEtudiant().getCne();
		str1[1]=e.getEtudiant().getLast_name_fr();
		str1[2]=e.getEtudiant().getFirst_name_fr();
		data.put(""+c++,str1);
		}



		//Iterate over data and write to sheet
		Set<String> keyset = data.keySet();
		int rownum = 0;
		for (String key : keyset)
		{
			Row row = sheet.createRow(rownum++);
			Object [] objArr = data.get(key);
			int cellnum = 0;
			for (Object obj : objArr)
			{
				Cell cell = row.createCell(cellnum++);
				if(obj instanceof String)
					cell.setCellValue((String)obj);
				else if(obj instanceof Integer)
					cell.setCellValue((Integer)obj);
			}
		}
		try
		{
			//Write the workbook in file system
			String excelFilePath = "src/main/resources/static/Excels/List_Rattrapage.xlsx";
			FileOutputStream out = new FileOutputStream(new File(excelFilePath));
			workbook.write(out);
			out.close();
			System.out.println("File.xlsx written successfully on disk.");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

public List<InscriptionPedagogique> validationEtape(Etape etape)//new
{
	List<InscriptionPedagogique> insp= new ArrayList<InscriptionPedagogique>(); 
	List<Semestre> semestre= semestreRepository.getSemestreByEtape(etape);
	if(semestre.size()>1) {
	
		List<InscriptionPedagogique> ips =inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueBySemestre(semestre.get(1));
		Iterator<InscriptionPedagogique> ins = ips. iterator();
		while(ins.hasNext())validationSemestre(ins.next());
		Iterator<InscriptionPedagogique> ip=ips.iterator();
		
		while(ip.hasNext()) {
			List<InscriptionPedagogique> ips1 =inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueBySemestre(semestre.get(0));
			ins = ips. iterator();
			while(ins.hasNext())validationSemestre(ins.next());
			InscriptionPedagogique inscrip=ip.next();
			Iterator<InscriptionPedagogique> ip1=ips1.iterator();
			while(ip1.hasNext()) {
				InscriptionPedagogique inscrip1=ip1.next();
				if(inscrip1.getEtudiant()==inscrip.getEtudiant()) {
					InscriptionPedagogique inscri=inscrip1;
					if(inscrip1.getNote_semestre()!=null && inscrip.getNote_semestre()!=null) {
						
					Double moyenne=(inscrip1.getNote_semestre()+inscrip.getNote_semestre())/2;
					inscri.setNote_semestre(moyenne);
					if(inscrip.getNote_semestre()>inscrip.getSemestre().getValidation() &&
							inscrip1.getNote_semestre()>inscrip1.getSemestre().getValidation() 
							&& moyenne >= etape.getValidation() 
							&&  inscrip1.getValidation()==1 && inscrip.getValidation()==1) {
						inscri.setValidation(1.0);
						
						
					}
					else if((inscrip.getNote_semestre()>inscrip.getSemestre().getValidation() ||
							inscrip1.getNote_semestre()>inscrip1.getSemestre().getValidation() 
							||  inscrip1.getValidation()==1 || inscrip.getValidation()==1)
							&& moyenne >= etape.getValidation()) {
						inscri.setValidation(2.0);
					}
					else inscri.setValidation(0.0);
					}
					else {
						inscri.setNote_semestre(-1.0);
						inscri.setValidation(3.0);
					}
					
					
					insp.add(inscri);
					
					
				}
			}	
		}
	}
	else {
		insp=inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueBySemestre(semestre.get(0));
		Iterator<InscriptionPedagogique> ins = insp. iterator();
		while(ins.hasNext())validationSemestre(ins.next());
	}
	return insp;
}
}
