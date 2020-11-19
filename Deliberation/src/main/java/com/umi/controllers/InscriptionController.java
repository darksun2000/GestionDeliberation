package com.umi.controllers;


import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
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


import com.umi.models.Etudiant;
import com.umi.models.Filiere;
import com.umi.models.InscriptionAdministrative;
import com.umi.models.InscriptionEnLigne;
import com.umi.repositories.EtudiantRepository;
import com.umi.repositories.Excel2DbRepository;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.InscriptionAdministrativeRepository;
import com.umi.repositories.InscriptionEnLigneRepository;

@Controller
public class InscriptionController {
	
	@PersistenceContext
	private EntityManager entiryManager;
	private InscriptionAdministrativeRepository inscriptionAdministrative;
	private EtudiantRepository etudiantRepository;
	private FiliereRepository filiereRepository;
	private InscriptionEnLigneRepository inscriptionEnLigne;
	Excel2DbRepository excel2Db =new Excel2DbRepository();
	
	public InscriptionController(EtudiantRepository studentRepository,InscriptionAdministrativeRepository inscriptionAdministrative,InscriptionEnLigneRepository inscriptionEnLigne,FiliereRepository filiereRepository) {
		this.etudiantRepository = studentRepository;
		this.inscriptionAdministrative=inscriptionAdministrative;
		this.filiereRepository=filiereRepository;
		this.inscriptionEnLigne=inscriptionEnLigne;
	}
	
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
	
	@GetMapping("/inscription/createANewInscriptionAdministrative")
	public ModelAndView createANewInscriptionAdministrative(
			@RequestParam("annee_academique")String annee_academique,
			@RequestParam("date_pre_inscription")Date date_pre_inscription,
			@RequestParam("date_valid_inscription")Date date_valid_inscription,
			@RequestParam("id_etudiant")int id_etudiant,
			@RequestParam("filiere")int id_filiere,
			@RequestParam("operateur")String operateur
			) {
		System.out.println(id_filiere);
		System.out.println("++++++++++++++++++++++++++++++");
		InscriptionAdministrative ia=new InscriptionAdministrative();
		Etudiant e =new Etudiant();
		InscriptionEnLigne iel=new InscriptionEnLigne();
		iel=inscriptionEnLigne.getOne(id_etudiant);
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
         inscriptionEnLigne.updateAcceptation(iel.getId(), 3);
		//etudiantRepository.copyIeEtudiant(ie.getId());
		ia.setAnnee_academique(annee_academique);
		ia.setDate_pre_inscription(date_pre_inscription);
		ia.setDate_valid_inscription(date_valid_inscription);
		ia.setEtudiant(e);
		ia.setFilieres(filiereRepository.getOne(id_filiere));
		ia.setOperateur(operateur);
		inscriptionAdministrative.save(ia);
		etudiantRepository.save(e);
		return new ModelAndView("redirect:/student/list");
	}
	
	
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
	
	@GetMapping("/inscription/SupprimerInscriptionAdministrative/{id_ia}")
	public ModelAndView SupprimerInscriptionAdministrative(
			@PathVariable("id_ia")int id_ia
			) {
		inscriptionAdministrative.deleteById(id_ia);
		etudiantRepository.delete(inscriptionAdministrative.getOne(id_ia).getEtudiant());
		return new ModelAndView("redirect:/inscription/ListInscriptionAdministrative");
	}
	
	@GetMapping("/inscription/ListInscriptionAdministrative")
	public ModelAndView listInscriptionEnligne() {
		ModelAndView model = new ModelAndView("ListInscriptionAdministrative");
		List<Filiere> f=filiereRepository.getAllFiliere();
		model.addObject("InscriptionAdministrative", "mm-active");
		model.addObject("Inscription", inscriptionAdministrative.getAllInscriptionsAdministrative());
		model.addObject("f", f);
		return model;
	}
	
	@GetMapping("/inscription/PageUploadInscriptionAdministrative")
	public ModelAndView PageUploadInscriptionEnligne() {
		ModelAndView model = new ModelAndView("UploadInscriptionAdministrative");
		model.addObject("InscriptionAdministartive", "mm-active");
		
		return model;
	}
	
	@GetMapping("/inscription/PageModifierInscriptionAdministrative")
	public ModelAndView PageModifierInscriptionEnligne(
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
	
	
	@PostMapping("/inscription/UploadInscriptionAdministrative")
	public ModelAndView UploadInscriptionEnligne(@RequestParam("file") MultipartFile file) throws IOException {
		
		Path dir =Paths.get("src/main/resources/static/Excels/");
		Path excelFilePath=excel2Db.write(file, dir);
		InscriptionAdministrative ia;
	        //*************************************************************************************************//
	        try {
	            long start = System.currentTimeMillis();
	             
	            FileInputStream inputStream = new FileInputStream(excelFilePath.toString());
	 
	            Workbook workbook = new XSSFWorkbook(inputStream);
	 
	            Sheet firstSheet = workbook.getSheetAt(0);
	            Iterator<Row> rowIterator = firstSheet.iterator();
	 
	  
	             
	            rowIterator.next(); // skip the header row
	             
	            while (rowIterator.hasNext()) {
	                Row nextRow = rowIterator.next();
	                Iterator<Cell> cellIterator = nextRow.cellIterator();
	                ia= new InscriptionAdministrative();
	                while (cellIterator.hasNext()) {
	                    Cell nextCell = cellIterator.next();
	 
	                    int columnIndex = nextCell.getColumnIndex();
	                    switch (columnIndex) {
	                    case 0:
	                        String annee_academique = nextCell.getStringCellValue();
	                        ia.setAnnee_academique(annee_academique);
	                        break;
	                    case 1:
	                        java.util.Date date_pre_inscription =nextCell.getDateCellValue();
	                        ia.setDate_pre_inscription(date_pre_inscription);
	                        break;
	                    case 2:
	                        java.util.Date date_valid_inscription = nextCell.getDateCellValue();
	                        ia.setDate_valid_inscription(date_valid_inscription);
	                        break;
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
	                       // etudiantRepository.copyIeEtudiant(iel.getId());
	                       System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++");
	                       System.out.println(e.getId());
	                       etudiantRepository.save(e);
	                        ia.setEtudiant(e);
	                        break;
	                    case 4:
	                        int filieres_id_filiere = (int) nextCell.getNumericCellValue();
	                        Filiere f = filiereRepository.getOne(filieres_id_filiere);
	                        ia.setFilieres(f);
	                        break;
	                    case 5:
	                        String operateur = nextCell.getStringCellValue();
	                        ia.setOperateur(operateur);
	                        System.out.println("+++++++++++++++++++++++++++++++++++++++++++++");
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
	       //***********************************************************************************************************// 
		return new ModelAndView("redirect:/inscription/PageUploadInscriptionAdministrative");
	}
}