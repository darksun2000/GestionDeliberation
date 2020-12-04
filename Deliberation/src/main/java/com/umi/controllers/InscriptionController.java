package com.umi.controllers;


import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.umi.models.Etape;
import com.umi.models.Etudiant;
import com.umi.models.Module;
import com.umi.models.Filiere;
import com.umi.models.InscriptionAdministrative;
import com.umi.models.InscriptionEnLigne;
import com.umi.models.InscriptionPedagogique;
import com.umi.models.Semestre;
import com.umi.repositories.EtapeRepository;
import com.umi.repositories.EtudiantRepository;
import com.umi.repositories.Excel2DbRepository;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.InscriptionAdministrativeRepository;
import com.umi.repositories.InscriptionEnLigneRepository;
import com.umi.repositories.InscriptionPedagogiqueRepository;
import com.umi.repositories.ModuleRepository;
import com.umi.repositories.SemestreRepository;

@Controller
public class InscriptionController {
	
	@PersistenceContext
	private EntityManager entiryManager;
	private InscriptionAdministrativeRepository inscriptionAdministrative;
	private EtudiantRepository etudiantRepository;
	private FiliereRepository filiereRepository;
	private InscriptionEnLigneRepository inscriptionEnLigne;
	private SemestreRepository semestreRepository;
	private InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository;
	private ModuleRepository moduleRepository;
	private EtapeRepository etapeRepository;
	Excel2DbRepository excel2Db =new Excel2DbRepository();
	
	public InscriptionController(EtapeRepository etapeRepository,ModuleRepository moduleRepository,InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository,EtudiantRepository studentRepository,SemestreRepository semestreRepository,InscriptionAdministrativeRepository inscriptionAdministrative,InscriptionEnLigneRepository inscriptionEnLigne,FiliereRepository filiereRepository) {
		this.etudiantRepository = studentRepository;
		this.inscriptionAdministrative=inscriptionAdministrative;
		this.filiereRepository=filiereRepository;
		this.inscriptionEnLigne=inscriptionEnLigne;
		this.semestreRepository=semestreRepository;
		this.inscriptionPedagogiqueRepository=inscriptionPedagogiqueRepository;
		this.moduleRepository=moduleRepository;
		this.etapeRepository=etapeRepository;
	}
	
	
	
							//-------+++++++++-----------------++++++++------------++++++++----------++++++++-------//
//+*+*+*+*+*+*+*+*+*++*+*+*+*+*+**+*+*+*+*+*+*+*+*+*+/ PARTIE INSCRIPTION ADMINISTRATIVE /*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+**+*+*+//
							//-------+++++++++-----------------++++++++------------++++++++----------++++++++-------//

	
	
//---------------------------------------aller à page d'inscription administrative----------------------------------//
	
	@GetMapping("/inscription/InscriptionAdministrative")
	public ModelAndView InscriptionAdministrative() {
		ModelAndView model = new ModelAndView("InscriptionAdministrative");
		model.addObject("InscriptionAdministrative", "mm-active");//will be used in the nav-bar
		List<InscriptionEnLigne> e=inscriptionEnLigne.getAllInscriptionsEnLigneAccepted();
		List<Filiere> f=filiereRepository.getAllFiliere();
		model.addObject("Etudiant", e);
		model.addObject("Filiere" ,f);
		return model;
	}
	
//---------------------------------action :création d'une nouvelle inscription administrative-----------------------------//
	
	@GetMapping("/inscription/createANewInscriptionAdministrative")
	public ModelAndView createANewInscriptionAdministrative(
			@RequestParam("annee_academique")String annee_academique,
			@RequestParam("date_pre_inscription")Date date_pre_inscription,
			@RequestParam("date_valid_inscription")Date date_valid_inscription,
			@RequestParam("id_etudiant")int id_etudiant,
			@RequestParam("filiere")int id_filiere,
			@RequestParam("operateur")String operateur
			) {
		InscriptionAdministrative ia=new InscriptionAdministrative();
		Etudiant e =new Etudiant();
		InscriptionEnLigne iel=new InscriptionEnLigne();
		iel=inscriptionEnLigne.getOne(id_etudiant);
		//-------------------crée l'etudiant au fur et à mesure de la creation de l'inscrip administrative--------//
		 e.setAcademy(iel.getAcademy());
         e.setBac_place(iel.getBac_place());
         e.setBac_type(iel.getBac_type());
         e.setBac_year(iel.getBac_year());
         e.setBirth_date(iel.getBirth_date());
         e.setBirth_place(iel.getBirth_place());
         e.setCity(iel.getCity());
         e.setCne(iel.getCne());
         e.setEstablishment(iel.getEstablishment());
         e.setFirst_name_ar(iel.getFirst_name_ar());
         e.setFirst_name_fr(iel.getFirst_name_fr());
         e.setGender(iel.getGender());
         e.setHigh_school(iel.getHigh_school());
         e.setId(iel.getId());
         e.setLast_name_ar(iel.getLast_name_ar());
         e.setLast_name_fr(iel.getLast_name_fr());
         e.setMassar_edu(iel.getMassar_edu());
         e.setMention(iel.getMention());
         e.setNationality(iel.getNationality());
         e.setProvince(iel.getProvince());
         e.setRegistration_date(iel.getRegistration_date());
         //---------------etudiant est accepté officielement------------------//
         inscriptionEnLigne.updateAcceptation(iel.getId(), 3);
		//--------------------partie creation d inscrip administrative----------------------------//
		ia.setAnnee_academique(annee_academique);
		ia.setDate_pre_inscription(date_pre_inscription);
		ia.setDate_valid_inscription(date_valid_inscription);
		etudiantRepository.save(e);
		//-------------get l'etudiant qui vient d'être inscrit inscriver----------------------------//
		Etudiant etudiant=etudiantRepository.getOne(etudiantRepository.getIdEtudiantByName(iel.getFirst_name_fr(), iel.getLast_name_fr()));
		ia.setEtudiant(etudiant);
		ia.setFilieres(filiereRepository.getOne(id_filiere));
		ia.setOperateur(operateur);
		inscriptionAdministrative.save(ia);
		return new ModelAndView("redirect:/student/list");
	}
	
	
//-----------------------------------action : modifier inscription administrative---------------------------------------//
	
	@PostMapping("/inscription/ModifierInscriptionAdministrative/{id_ia}")
	public ModelAndView ModifierInscriptionAdministrative(
			@PathVariable("id_ia")int id_ia,
			@RequestParam("annee_academique")String annee_academique,
			@RequestParam("date_pre_inscription")Date date_pre_inscription,
			@RequestParam("date_valid_inscription")Date date_valid_inscription,
			@RequestParam("id_etudiant")int id_etudiant,
			@RequestParam("filiere")int id_filiere,
			@RequestParam("operateur")String operateur
			) {
		inscriptionAdministrative.updateInscriptionAdministrative(id_ia, annee_academique, date_pre_inscription, date_valid_inscription, etudiantRepository.getOne(id_etudiant), filiereRepository.getOne(id_filiere), operateur);
		return new ModelAndView("redirect:/inscription/ListInscriptionAdministrative");
	}
	
	
//---------------------------------------action : supprimer inscrip administrative----------------------------------------//
	
	@GetMapping("/inscription/SupprimerInscriptionAdministrative/{id_ia}")
	public ModelAndView SupprimerInscriptionAdministrative(
			@PathVariable("id_ia")int id_ia
			) {
		List<InscriptionPedagogique> ipl=inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueByEtudiant(inscriptionAdministrative.getOne(id_ia).getEtudiant());
		if(!ipl.isEmpty()) {
		inscriptionPedagogiqueRepository.deleteAll(ipl);
		}
		etudiantRepository.delete(inscriptionAdministrative.getOne(id_ia).getEtudiant());
		inscriptionAdministrative.deleteById(id_ia);
		return new ModelAndView("redirect:/inscription/ListInscriptionAdministrative");
	}
	
	
//-----------------------------------------page affichant la liste des inscriptions administratives-------------------------------//
	
	@GetMapping("/inscription/ListInscriptionAdministrative")
	public ModelAndView listInscriptionAdministratives() {
		ModelAndView model = new ModelAndView("ListInscriptionAdministrative");
		List<Filiere> f=filiereRepository.getAllFiliere();
		model.addObject("listAdministartive", "mm-active");
		model.addObject("Inscription", inscriptionAdministrative.getAllInscriptionsAdministrative());
		model.addObject("f", f);
		return model;
	}
	
	
//-------------------------------------------aller à la page pour uploder un fichier d'inscrip administratives------------------------//
	
		@GetMapping("/inscription/PageUploadInscriptionAdministrative")
		public ModelAndView PageUploadInscriptionAdministrative() {
			ModelAndView model = new ModelAndView("UploadInscriptionAdministrative");
			model.addObject("InscriptionAdministartive", "mm-active");
			
			return model;
		}
		
		
//-------------------------------------------aller à la page pour modifier inscrip administratives-----------------------------------------//
		
		@GetMapping("/inscription/PageModifierInscriptionAdministrative")
		public ModelAndView PageModifierInscriptionAdministrative(
				@RequestParam("id")int id_ia
				) {
			List<InscriptionEnLigne> e=inscriptionEnLigne.getAllInscriptionsEnLigneAccepted();
			InscriptionAdministrative ia=inscriptionAdministrative.getOne(id_ia);
			ModelAndView model = new ModelAndView("ModifierInscriptionAdministrative");
			model.addObject("ListInscriptionAdministartive", "mm-active");
			model.addObject("ia", ia);
			model.addObject("Etudiant",e);
			
			return model;
		}
		
		
//--------------------------------------------------Upload du fichier et remplir la base de données----------------------------------------//
		
		@PostMapping("/inscription/UploadInscriptionAdministrative")
		public ModelAndView UploadInscriptionAdministartive(@RequestParam("file") MultipartFile file) throws IOException {
			
			Path dir =Paths.get("src/main/resources/static/Excels/");
			Path excelFilePath=excel2Db.write(file, dir);
			InscriptionAdministrative ia;
		        //----------------------------------------------------------------------------------------//
		        try {
		        	//----------------------------declaration et initialisation des objets à utiliser-------------------//
		            long start = System.currentTimeMillis();
		             
		            FileInputStream inputStream = new FileInputStream(excelFilePath.toString());
		 
		            Workbook workbook = new XSSFWorkbook(inputStream);
		 
		            Sheet firstSheet = workbook.getSheetAt(0);
		            Iterator<Row> rowIterator = firstSheet.iterator();
		            //-----------------------------------------------------------------------------------//
		  
		             
		            rowIterator.next(); // skip the header row
		             
		            //boucle pour passer par toutes les lignes
		            while (rowIterator.hasNext()) {
		            	
		            	//-----incrementer l'iterator ligne-----//
		                Row nextRow = rowIterator.next();
		                Iterator<Cell> cellIterator = nextRow.cellIterator();
		                //--------------------------//
		                
		                ia= new InscriptionAdministrative();
		                
			            //boucle pour passer par toutes les colonnes
		                while (cellIterator.hasNext()) {
		                	
			            	//-----incrementer l'iterator colonne-----//
		                    Cell nextCell = cellIterator.next();
		                    int columnIndex = nextCell.getColumnIndex();
		                  //------------------------------------//
		                    
		                    //ce switch pour indiquer dans quelle colonne on est.
		                    switch (columnIndex) {
		                    //colonne 1
		                    case 0:
		                        String annee_academique = nextCell.getStringCellValue();
		                        ia.setAnnee_academique(annee_academique);
		                        break;
		                    //colonne 2
		                    case 1:
		                        java.util.Date date_pre_inscription =nextCell.getDateCellValue();
		                        ia.setDate_pre_inscription(date_pre_inscription);
		                        break;
		                    //colonne 3
		                    case 2:
		                        java.util.Date date_valid_inscription = nextCell.getDateCellValue();
		                        ia.setDate_valid_inscription(date_valid_inscription);
		                        break;
		                    //colonne 4
		                    case 3:
		                        String fullNameEtudiant = nextCell.getStringCellValue();
		                        String [] nameEtudiant=fullNameEtudiant.split(" ");
		                        String first_name_fr=nameEtudiant[0];
		                        String last_name_fr=nameEtudiant[1];
		                        InscriptionEnLigne iel=inscriptionEnLigne.findByNameAccepted(first_name_fr, last_name_fr);
		                        Etudiant e = new Etudiant();
		                       e.setAcademy(iel.getAcademy());
		                       e.setBac_place(iel.getBac_place());
		                       e.setBac_type(iel.getBac_type());
		                       e.setBac_year(iel.getBac_year());
		                       e.setBirth_date(iel.getBirth_date());
		                       e.setBirth_place(iel.getBirth_place());
		                       e.setCity(iel.getCity());
		                       e.setCne(iel.getCne());
		                       e.setEstablishment(iel.getEstablishment());
		                       e.setFirst_name_ar(iel.getFirst_name_ar());
		                       e.setFirst_name_fr(iel.getFirst_name_fr());
		                       e.setGender(iel.getGender());
		                       e.setHigh_school(iel.getHigh_school());
		                       e.setLast_name_ar(iel.getLast_name_ar());
		                       e.setLast_name_fr(last_name_fr);
		                       e.setMassar_edu(iel.getMassar_edu());
		                       e.setMention(iel.getMention());
		                       e.setNationality(iel.getNationality());
		                       e.setProvince(iel.getProvince());
		                       e.setRegistration_date(iel.getRegistration_date());
		                       etudiantRepository.save(e);
		                        ia.setEtudiant(e);
		                        break;
		                   //colonne 5
		                    case 4:
		                        int filieres_id_filiere = (int) nextCell.getNumericCellValue();
		                        Filiere f = filiereRepository.getOne(filieres_id_filiere);
		                        ia.setFilieres(f);
		                        break;
		                    //colonne 6
		                    case 5:
		                        String operateur = nextCell.getStringCellValue();
		                        ia.setOperateur(operateur);
		                        //faire entrer l inscrip. dans la base de données
		                        inscriptionAdministrative.save(ia);
		                        break;
		                    }
		                }  
		            }
		            workbook.close();
		             
		            long end = System.currentTimeMillis();
		            System.out.printf("Import done in %d ms\n", (end - start));
		             
		        } catch (IOException ex1) {
		            System.out.println("Error reading file");
		            ex1.printStackTrace();
		        } 
		       //------------------------------------------------------------------------------------// 
			return new ModelAndView("redirect:/inscription/PageUploadInscriptionAdministrative");
		}
		
		
		
		
		
							//-------+++++++++-----------------++++++++------------++++++++----------++++++++-------//
//+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+/ PARTIE INSCRIPTION PEDAGOGIQUE /*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+**+*+*+//
							//-------+++++++++-----------------++++++++------------++++++++----------++++++++-------//
		
		
		
		
//------------------------------Page affichant la liste (un) ou des etudiants a inscrire pedagogiquement en un semestre-----------------//
	
	@PostMapping("/inscription/PageInscriptionPedagogique")
	public ModelAndView PageInscriptionPedagogique(@RequestParam("filiere")int id_filiere) {
		ModelAndView model = new ModelAndView("InscriptionPedagogique");
		//--------------------les années universitaires utilisés comme filtre du tableau-----------------------//
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
	    LocalDate localDate = LocalDate.now();
	    int ele[]=new int[3];
	    for (int i = 0; i < ele.length; i++) {
	    	ele[i]=Integer.parseInt((dtf.format(localDate).toString().split("/")[i].trim()));
		}
	    if(ele[1]>8) {
	    	ele[0]++;
	    }
	    //-----------------------------------------------------------------------------------------------//
	    Filiere filiere=filiereRepository.getOne(id_filiere);
		List<Filiere> f=filiereRepository.getAllFiliere();
		List<Semestre> s=semestreRepository.getSemestreByFiliere(filiere);
		int num= inscriptionAdministrative.getNumIaByFiliere(filiere);
		model.addObject("InscriptionPedagogique", "mm-active");
		model.addObject("annee",ele[0]);
		model.addObject("Inscription", inscriptionAdministrative.getInscriptionsAdministrativeByFiliere(filiere));
		model.addObject("f", f);
		model.addObject("semestre",s);
		model.addObject("numRows",num);
		return model;
	}
	
	
	
//-------------------------------------action :  creation d'une inscription par semestre d'un ou plusieurs etudiants-----------------------//
	
	@PostMapping("/inscription/createANewInscriptionPedagogique")
	public ModelAndView createANewInscriptionPedagogique(@RequestParam("id_ias")String ids,
			@RequestParam("filiere")int id_semestre
			) {
		
		
		String id[]=ids.split(",");
		int idI;
		InscriptionAdministrative ia;
		Etudiant e;
		Semestre semestre =semestreRepository.getOne(id_semestre);
		for (int i = 0; i < id.length; i++) {
			InscriptionPedagogique ip =new InscriptionPedagogique();
			idI=Integer.parseInt(id[i].trim());
			ia=inscriptionAdministrative.getOne(idI);
			e=ia.getEtudiant();
			ip.setAnnee_academique(ia.getAnnee_academique());
			ip.setDate_pre_inscription(ia.getDate_pre_inscription());
			ip.setDate_valid_inscription(ia.getDate_valid_inscription());
			ip.setEtudiant(e);
			ip.setSemestre(semestre);
			inscriptionPedagogiqueRepository.save(ip);
		}
		return new ModelAndView("redirect:/inscription/ListInscriptionAdministrative");
	}
	

	
//-------------------------------------action :  creation d'une inscription par module d'un ou plusieurs etudiants------------------//
	
	@PostMapping("/inscription/createANewInscriptionPedagogiqueModule")
	public ModelAndView createANewInscriptionPedagogiqueModule(@RequestParam("id_ip")String ids,
			@RequestParam("modules")String modules
			) {
		
		String id[]=ids.split(",");
		String id_modules[]=modules.split(",");
		
		//remplire list des modules------------------------------------------
		
		List<Module> listModules=new ArrayList<Module>();
		for (int i = 0; i < id_modules.length; i++) {
			listModules.add(moduleRepository.getOne(Integer.parseInt(id_modules[i].trim())));
		}
		
		//remplir list des ip-----------------------------------------------
		
		List<InscriptionPedagogique> listIP =new ArrayList<InscriptionPedagogique>();
		for (int i = 0; i < id.length; i++) {
			listIP.add(inscriptionPedagogiqueRepository.getOne(Integer.parseInt(id[i].trim())));
			listIP.get(i).setModule(listModules);;
		}
		
		//inscrire les ips par modules---------------------------------------
		
		for (int i = 0; i < listIP.size(); i++) {
			inscriptionPedagogiqueRepository.save(listIP.get(i));
		}
		return new ModelAndView("redirect:/inscription/ListInscriptionAdministrative");
	}
	
	

//------------------------------Page affichant la liste (un) ou des etudiants a inscrire pedagogiquement en un Module-----------------//

	@PostMapping("/inscription/PageInscriptionPedagogiqueModule")
	public ModelAndView PageInscriptionPedagogiqueModule(@RequestParam("filiere")int idFiliere,
			@RequestParam("semestre")String libelle_semestre
			) {
		ModelAndView model = new ModelAndView("InscriptionPedagogiqueModule");
		//--------------------les années universitaires utilisés comme filtre du tableau-----------------------//
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
	    LocalDate localDate = LocalDate.now();
	    int ele[]=new int[3];
	    for (int i = 0; i < ele.length; i++) {
	    	ele[i]=Integer.parseInt((dtf.format(localDate).toString().split("/")[i].trim()));
		}
	    if(ele[1]>8) {
	    	ele[0]++;
	    }
	    //--------------------------------------------------------------------------------------------------//
		Filiere f=filiereRepository.getOne(idFiliere);
		Semestre s=semestreRepository.getSemestreByFiliereAndLibelle(f, libelle_semestre);
		model.addObject("InscriptionPedagogique", "mm-active");
		model.addObject("annee",ele[0]);
		model.addObject("Inscription", inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueBySemestre(s));
		model.addObject("module",moduleRepository.getModuleBySemestre(s));
		model.addObject("f", f);
		model.addObject("semestre",s);
		return model;
	}
	
	
	
//-----------------------------le menu pour choisir	la filiere pour afficher les etudiants à inscrire par semestre--------------------------// 

	@GetMapping("/inscription/choixDeFiliere")
	public ModelAndView choixDeFiliere() {
		ModelAndView model = new ModelAndView("choixDeFiliere");
		
		List<Filiere> f=filiereRepository.getAllFiliere();
		model.addObject("InscriptionPedagogique", "mm-active");
		model.addObject("m",false);
		model.addObject("f", f);
		return model;
	}
	
	
	
//-----------------------------le menu pour choisir	la filiere et semestre pour afficher les etudiants à inscrire par module----------------------// 
	
	@GetMapping("/inscription/choixDeFiliereModule")
	public ModelAndView choixDeFiliereModule() {
		ModelAndView model = new ModelAndView("choixDeFiliere");
		List<Filiere> f=filiereRepository.getAllFiliere();
		model.addObject("module","Module");
		model.addObject("m",true);
		model.addObject("InscriptionPedagogique", "mm-active");
		model.addObject("f", f);
		return model;
	}

	
	
//-------------------------------------menu pour choisir inscription pedago. par module ou par semestre-------------------------------//
	
	@GetMapping("/inscription/MenuPedagogique")
	public ModelAndView MenuPedagogique() {
		ModelAndView model = new ModelAndView("menuPedagogique");
		model.addObject("InscriptionPedagogique", "mm-active");
		return model;
	}
	

	
//-----------------------------------------page affichant la liste des inscriptions Pedagoggiques par semestre-------------------------------//
	
		@GetMapping("/inscription/ListInscriptionPedagogiqueS")
		public ModelAndView listInscriptionPedagogiqueS() {
			ModelAndView model = new ModelAndView("ListInscriptionPedagogique");
			List<Filiere> f=filiereRepository.getAllFiliere();
			model.addObject("listPedagogique", "mm-active");
			model.addObject("Inscription", inscriptionPedagogiqueRepository.getAllInscriptionsPedagogique());
			model.addObject("module", moduleRepository.getAllModules());
			model.addObject("parModule",0);
			model.addObject("parSemestre",1);
			model.addObject("f", f);
			return model;
		}
		
		
		
//-----------------------------------------page affichant la liste des inscriptions Pedagoggiques par Module-------------------------------//

		
		
		@GetMapping("/inscription/ListInscriptionPedagogiqueM")
		public ModelAndView listInscriptionPedagogiquesM() {
			ModelAndView model = new ModelAndView("ListInscriptionPedagogique");
			List<Filiere> f=filiereRepository.getAllFiliere();
			model.addObject("listPedagogique", "mm-active");
			model.addObject("Inscription", inscriptionPedagogiqueRepository.getAllInscriptionsPedagogique());
			model.addObject("module", moduleRepository.getAllModules());
			model.addObject("parModule",1);
			model.addObject("parSemestre",0);
			model.addObject("f", f);
			return model;
		}
		

//----------------------------------------------menu liste des inscription pedagogiques-----------------------------------------------------//



		@GetMapping("/inscription/menuListPedagogique")
		public ModelAndView menuListPedagogique() {
			ModelAndView model = new ModelAndView("menuListPedagogique");
			model.addObject("listPedagogique", "mm-active");
			return model;
		}
		
		
		
		
							//-------+++++++++-----------------++++++++------------++++++++----------++++++++-------//
//+*+*+*+*+*+*+*+*+*++*+*+*+*+*+**+*+*+*+*+*+*+*+*+*+/ PARTIE STRUCTURE D'ENSEIGNEMENT /*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+**+*+*+//
							//-------+++++++++-----------------++++++++------------++++++++----------++++++++-------//
		
		
		
		
//------------------------------------------allez vers page structure d'enseignement--------------------------------------------------//
		
		
		
		@GetMapping("/inscription/StructureEnseignement")
		public ModelAndView structureDEnseignement() {
			ModelAndView model = new ModelAndView("ListAnnees");
			model.addObject("f",filiereRepository.getAllFiliere());
			model.addObject("etape",etapeRepository.findAll());
			model.addObject("semestres",semestreRepository.getAllSemestre());
			model.addObject("modules",moduleRepository.findAll());
			model.addObject("StructureEnseignement", "mm-active");
			return model;
		}

		
		
//-------------------------------------modification d'une (plusieurs) années : diplomante ou pas------------------------------------//		
		
		
		@PostMapping("/inscription/ModifierAnneeDiplomante")
		public ModelAndView ModifierAnneeDiplomante(@RequestParam("id_ip")String ids) {
			String idstring[]=ids.split(",");
			
			List<Integer> id=new ArrayList<Integer>();
			for (int i = 0; i < idstring.length; i++) {
				id.add(Integer.parseInt(idstring[i]));
			}
			List<Etape> etapesA=etapeRepository.findAllById(id);
			for (int i = 0; i < etapesA.size(); i++) {
				etapeRepository.activerDiplomante(etapesA.get(i).getId_etape(),1);
			}
			
			List<Etape> etapesD=etapeRepository.findAll();
			int trouver=0;
			for (int i = 0; i < etapesD.size(); i++) {
				trouver=0;
				for (int j = 0; j < etapesA.size(); j++) {
					if(etapesD.get(i)==etapesA.get(j)) {
						trouver=1;
					}
				}
				if(trouver==0) {
					etapeRepository.activerDiplomante(etapesD.get(i).getId_etape(),0);
				}
			}
			return new ModelAndView("redirect:/inscription/StructureEnseignement");
		}
		
		
		
//-------------------------------------------------Details semestre---------------------------------------------------//
		
		
		
		@GetMapping("/inscription/VoirSemestre")
		public ModelAndView VoirSemestre(@RequestParam("idS")int idS) {
			ModelAndView model=new ModelAndView("voirSemestre");
			Semestre semestre=semestreRepository.getOne(idS);
			List<Module>modules=moduleRepository.getModuleBySemestre(semestre);
			model.addObject("modules",modules);
			model.addObject("semestre",semestre);
			return model;
		}
		
}