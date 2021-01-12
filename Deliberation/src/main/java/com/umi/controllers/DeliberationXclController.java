package com.umi.controllers;


import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Part ;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.umi.models.Etudiant;
import com.umi.models.InscriptionPedagogique;
import com.umi.models.InscriptionPedagogiqueModule;
import com.umi.models.Module;
import com.umi.models.Semestre;
import com.umi.repositories.ElementRepository;
import com.umi.repositories.EtapeRepository;
import com.umi.repositories.EtudiantRepository;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.InscriptionPedagogiqueModuleRepository;
import com.umi.repositories.InscriptionPedagogiqueRepository;
import com.umi.repositories.ModuleRepository;
import com.umi.repositories.NoteElementRepository;
import com.umi.repositories.SemestreRepository;

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



	public DeliberationXclController(EntityManager entityManager, NoteElementRepository noteElementRepository,
			ElementRepository elementRepository, FiliereRepository filiereRepository, ModuleRepository moduleRepository,
			SemestreRepository semestreRepository, EtapeRepository etapeRepository,
			InscriptionPedagogiqueRepository inscriptionPedagogiqueRepository,
			InscriptionPedagogiqueModuleRepository inscriptionPedagogiqueModuleRepository,EtudiantRepository etudiantRepository) {
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
	}
	@GetMapping({ "/delib/menuDeliberation" })
	public ModelAndView choixSessionList() {
		ModelAndView model = new ModelAndView("menuDeliberation");
		return model;
	}
	@GetMapping({ "/delib/choixOrdinnaire" })
	public ModelAndView choixElementList() {
		ModelAndView model = new ModelAndView("ChoixOrdinnaire");
		model.addObject("filieres", filiereRepository.findAll());
		model.addObject("etapes",etapeRepository.findAll());
		model.addObject("semestres", semestreRepository.findAll());
		model.addObject("modules", moduleRepository.findAll());
		return model;
	}
	@PostMapping({ "/delib/importOrdinaire" })
	public ModelAndView ajouterOrdinaire(@RequestParam("module")  Integer id_mdl) {
		ModelAndView model = new ModelAndView("importOrdinaire");
		Module module= moduleRepository.getOne(id_mdl);


		model.addObject("module", module);
		return model;
	}

	@PostMapping("/delib/UploadOrdinaire")
	public ModelAndView UploadOrdinaire(@RequestParam("file") Part file ,@RequestParam("module") int id_mdl ) throws IOException {
		ModelAndView model = new ModelAndView("ChoixOrdinnaire");
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
		return model;
	}



	//////////////////////////RATTRAPAGE


	@GetMapping({ "/delib/choixRattrapage" })
	public ModelAndView choixRattrapage() {
		ModelAndView model = new ModelAndView("ChoixRattrapage");
		model.addObject("filieres", filiereRepository.findAll());
		model.addObject("etapes",etapeRepository.findAll());
		model.addObject("semestres", semestreRepository.findAll());
		model.addObject("modules", moduleRepository.findAll());
		return model;
	}
	@PostMapping({ "/delib/importRattrapage" })
	public ModelAndView ajouterRattrapage(@RequestParam("module")  Integer id_mdl) {
		ModelAndView model = new ModelAndView("importRattrapage");
		Module module= moduleRepository.getOne(id_mdl);


		model.addObject("module", module);
		return model;
	}

	@PostMapping("/delib/UploadRattrapage")
	public ModelAndView UploadRattrapage(@RequestParam("file") Part file ,@RequestParam("module") int id_mdl ) throws IOException {
		ModelAndView model = new ModelAndView("menuDeliberation");
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
		return model;
	}

// Liste Déliberation par module
	@GetMapping({ "/delib/choixList" })
	public ModelAndView choixList() {
		ModelAndView model = new ModelAndView("ChoixListDelibModule");
		model.addObject("filieres", filiereRepository.findAll());
		model.addObject("etapes",etapeRepository.findAll());
		model.addObject("semestres", semestreRepository.findAll());
		model.addObject("modules", moduleRepository.findAll());
		return model;
	}
	
	@PostMapping({ "/delib/list" })
	public ModelAndView ajouter(@RequestParam("module")  Integer id_mdl) {
		ModelAndView model = new ModelAndView("listValidationModule");
		Module module= moduleRepository.getOne(id_mdl);
		List<InscriptionPedagogiqueModule> ipm= inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByModule(module);
		

		model.addObject("etudiants", ipm);
		return model;
	}
	
	

	
	
	
	
	
	// Liste Déliberation par Semestre à faire
		@GetMapping({ "/delib/choixListSemestre" })
		public ModelAndView choixListSemestre() {
			ModelAndView model = new ModelAndView("ChoixListDelibSemestre");
			model.addObject("filieres", filiereRepository.findAll());
			model.addObject("etapes",etapeRepository.findAll());
			model.addObject("semestres", semestreRepository.findAll());
			return model;
		}
		
		@PostMapping({ "/delib/listSemestre" })
		public ModelAndView DéliberationSemestre(@RequestParam("semestre")  Integer id_sem) {
			ModelAndView model = new ModelAndView("listValidationSemestre");
			Semestre semestre= semestreRepository.getOne(id_sem);
			List<InscriptionPedagogique> ip= inscriptionPedagogiqueRepository.getInscriptionsPedagogiqueBySemestre(semestre);
			Iterator<InscriptionPedagogique> ins = ip. iterator();
			while(ins.hasNext())validationSemestre(ins.next());

			model.addObject("etudiants", ip);
			return model;
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

	
	public void addFromExcelRattrapage(InputStream inputStream, Module module) {
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


	public void validationSemestre(InscriptionPedagogique ip) {
		List<Module> modules=moduleRepository.getModuleBySemestre(ip.getSemestre());
		Iterator<Module> m= modules.iterator();
		double moyenne=0;
		double coef =0;
		double compensation=0;
		while(m.hasNext()) {
			Module module =m.next();
			InscriptionPedagogiqueModule ipm =inscriptionPedagogiqueModuleRepository.getInscriptionPedagogiqueModuleByEtudiantAndModule(ip.getEtudiant(), module); 
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
		moyenne/=coef;
		ip.setNote_semestre(moyenne);
		 if(compensation==0 && moyenne>= ip.getSemestre().getValidation())ip.setValidation(1.0);
		 else if (compensation==1 && moyenne>= ip.getSemestre().getValidation())ip.setValidation(2.0);
		 else if(compensation == 3)ip.setValidation(3.0);
		 else ip.setValidation(0.0);
		 inscriptionPedagogiqueRepository.updateInscriptionPedagogiqueModule(ip.getId_ip(), ip.getNote_semestre(), ip.getValidation());
	}



}
