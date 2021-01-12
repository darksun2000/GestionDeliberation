package com.umi.controllers;

import com.umi.models.Professeur;
import com.umi.models.Element;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PostMapping;
import com.umi.models.Semestre;
import com.umi.models.Module;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import com.umi.models.Etape;
import com.umi.models.Filiere;
import org.springframework.web.servlet.ModelAndView;
import com.umi.repositories.ProfesseurRepository;
import com.umi.repositories.EtapeRepository;
import com.umi.repositories.FiliereRepository;
import com.umi.repositories.SemestreRepository;
import com.umi.repositories.ModuleRepository;
import com.umi.repositories.ElementRepository;
import javax.persistence.PersistenceContext;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Controller;

@Controller
public class ModuleController
{
    @PersistenceContext
    EntityManager entityManager;
    ElementRepository elementRepository;
    ModuleRepository moduleRepository;
    SemestreRepository semestreRepository;
    FiliereRepository filiereRepository;
    EtapeRepository etapeRepository;
    ProfesseurRepository professeurRepository;
    
    public ModuleController(final ModuleRepository moduleRepository, final SemestreRepository semestreRepository, final FiliereRepository filiereRepository, final EtapeRepository etapeRepository, final ProfesseurRepository professeurRepository, final ElementRepository elementRepository) {
        this.moduleRepository = moduleRepository;
        this.semestreRepository = semestreRepository;
        this.filiereRepository = filiereRepository;
        this.etapeRepository = etapeRepository;
        this.professeurRepository = professeurRepository;
        this.elementRepository = elementRepository;
    }
    
    @GetMapping({ "/module/creer" })
    public ModelAndView create() {
        final ModelAndView model = new ModelAndView("creerModule");
        final List<Filiere> filieres = (List<Filiere>)this.filiereRepository.findAll();
        if (filieres != null) {
            for (final Filiere filiere : filieres) {
                if (filiere.getEtapes() != null) {
                    for (final Etape etape : filiere.getEtapes()) {
                        etape.setSemestres(this.semestreRepository.getSemestreByEtape(etape));
                        if (etape.getSemestres() == null) {
                            etape.setSemestres(new ArrayList<Semestre>());
                        }
                    }
                }
            }
        }
        model.addObject("filieres", (Object)filieres);
        model.addObject("creerModule", (Object)"mm-active");
        return model;
    }
    
    @PostMapping({ "/module/creer" })
    public ModelAndView create(@RequestParam("libelle_module") final String libelle_module, @RequestParam("id_semestre") final Integer id_semestre, @RequestParam("element_number") final Integer element_number) {
        final ModelAndView model = new ModelAndView("createElements");
        Module module = new Module();
        module.setLibelle_module(libelle_module);
        final Semestre semestre = (Semestre)this.semestreRepository.getOne(id_semestre);
        module.setSemestre(semestre);
        module = (Module)this.moduleRepository.save(module);
        model.addObject("module", (Object)module);
        model.addObject("element_number", (Object)element_number);
        model.addObject("professeurs", (Object)this.professeurRepository.getAllProfesseur());
        return model;
    }
    
    @PostMapping({ "/elements/creer" })
    public ModelAndView createElements(HttpServletRequest request, @RequestParam("module")  Integer id_module, @RequestParam("nbr")  Integer nombre_element) {
    	ModelAndView model = new ModelAndView("redirect:/module/ListModule");
        for (int i = 1; i <= nombre_element; ++i) {
             Element element = new Element();
             Module module = (Module)this.moduleRepository.getOne(id_module);
            element.setModule(module);
            element.setLibelle_element(request.getParameter("libelle_element_" + i));
            element.setCoeficient(Double.valueOf(Double.parseDouble(request.getParameter("coeficient_" + i))));
             Professeur prof = professeurRepository.getOne(Integer.parseInt(request.getParameter("id_professeur_" + i)));
            element.setProfesseur(prof);
            elementRepository.save(element);
        }
        return model;
    }
    
    @GetMapping({ "/module/ListModule" })
    public ModelAndView list() {
        final ModelAndView model = new ModelAndView("ListModule");
        model.addObject("ListModule", (Object)"mm-active");
        model.addObject("module", (Object)this.moduleRepository.getAllModules());
        model.addObject("f", (Object)this.filiereRepository.getAllFiliere());
        return model;
    }
}