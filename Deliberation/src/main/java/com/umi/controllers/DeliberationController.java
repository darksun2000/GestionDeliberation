package com.umi.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.umi.enums.Gender;
import com.umi.models.Element;
import com.umi.models.Etudiant;
import com.umi.models.InscriptionPedagogique;
import com.umi.models.Note;
import com.umi.repositories.ElementRepository;
import com.umi.repositories.EtudiantRepository;
import com.umi.repositories.InscriptionPedagogiqueRepository;
import com.umi.repositories.NoteRepository;

@Controller
public class DeliberationController {
	
	@PersistenceContext
	EntityManager entityManager;
	
	NoteRepository noteRepository;
	ElementRepository elementRepository;
	InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository;
	EtudiantRepository etudiantRepository;
	
	public DeliberationController(NoteRepository noteRepository, ElementRepository elementRepository
			, InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository
			, EtudiantRepository etudiantRepository) {
		this.noteRepository = noteRepository;
		this.elementRepository = elementRepository;
		this.inscriptionPedagogiqueRepository = inscriptionPedagogiqueRepository;
		this.etudiantRepository = etudiantRepository;
	}
	
	@GetMapping("/student/import")
	public ModelAndView importNotes() {
		ModelAndView model = new ModelAndView("importNotes");
		model.addObject("elements", elementRepository.findAll());//faut faire les elements selon le prof, en attendant l'etablissement de la connex
		return model;
	}
	@PostMapping("/student/import")
	public ModelAndView importNotes_post(@RequestParam("id_element") Integer id_element, @RequestParam("file") MultipartFile multipartFile) throws IOException {
		//element, ou bien module ?????
		
		int i;
		FileInputStream file = new FileInputStream(convertUsingOutputStream(multipartFile.getBytes()));
		Workbook workbook = new XSSFWorkbook(file);
		Sheet sheet = workbook.getSheetAt(0);
		
		FormulaEvaluator formulaEvaluator = workbook.getCreationHelper().createFormulaEvaluator();
		
		Note note = new Note();
		
		Iterator<Row> rowIterator = sheet.iterator();
		Iterator<Cell> cellIterator;
		if(rowIterator.hasNext()) {
			cellIterator = rowIterator.next().iterator();
				if(!cellIterator.next().getRichStringCellValue().toString().toLowerCase().equals("cne"))
					throw new IOException("nommenclature incorrecte");
				if(!cellIterator.next().getRichStringCellValue().toString().toLowerCase().equals("nom"))
					throw new IOException("nommenclature incorrecte");
				if(!cellIterator.next().getRichStringCellValue().toString().toLowerCase().equals("prénom"))
					throw new IOException("nommenclature incorrecte");
				i = 0;
			while(cellIterator.hasNext()) {
				if(!cellIterator.next()
						.getRichStringCellValue()
						.toString()
						.toLowerCase()
						.equals("note" + (i++ + 1)))
					throw new IOException("nommenclature incorrecte");
			}//TODO need to be tested
		}else throw new IOException("fichier vide");
		
		Element element = elementRepository.getOne(id_element);
		
		InscriptionPedagogique inscriptionPedagogique = new InscriptionPedagogique();
		Etudiant etudiant = new Etudiant();
		String cne;
		Double n;
		
		while(rowIterator.hasNext()) {
			cellIterator = rowIterator.next().iterator();
			cne = cellIterator.next().getRichStringCellValue().toString();//cne
			etudiant = etudiantRepository.getEtudiantByCne(cne);
			InscriptionPedagogique inscriptionPedagogiques
				= inscriptionPedagogiqueRepository.getInscriptionPedagogiqueByEtudiants(etudiant);
			cellIterator.next();//nom
			cellIterator.next();//prenom
			
			note.setElement(element);
			note.setInscription_pedagogique(inscriptionPedagogique);
			//les coef ??
			n = 0D;
			for(int j = 0; j<i && cellIterator.hasNext(); j++) {
				n += Double.parseDouble(cellIterator.next().getRichStringCellValue().toString());
			}
			n /= i;
			
			note.setNote_module(n);
			
			noteRepository.save(note);
			
		}
		System.out.println("importation succeded");
		return new ModelAndView("redirect:/");
	}
	
	public static File convertUsingOutputStream(byte[] fileBytes)
	{
	    File f = new File("foo.xlsx");
	    try (FileOutputStream fos = new FileOutputStream(f)) {
	        fos.write(fileBytes);
	    }
	    catch(Exception ex)
	    {
	        ex.printStackTrace();
	    }
	    return f;
	}
	
	
}

class DelibCalculator{
	//static type calculate ratt
	//static type calculate semestre
	//static type calculate annee
}
