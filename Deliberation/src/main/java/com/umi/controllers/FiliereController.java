package com.umi.controllers;

import org.springframework.web.bind.annotation.PostMapping;
import com.umi.models.Semestre;
import com.umi.models.Etape;
import com.umi.models.Filiere;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.umi.repositories.SemestreRepository;
import com.umi.repositories.EtapeRepository;
import com.umi.repositories.FiliereRepository;
import javax.persistence.PersistenceContext;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Controller;

@Controller
public class FiliereController
{
    @PersistenceContext
    EntityManager entityManager;
    FiliereRepository filiereRepository;
    EtapeRepository etapeRepository;
    SemestreRepository semestreRepository;
    
    public FiliereController(final FiliereRepository filiereRepository, final EtapeRepository etapeRepository, final SemestreRepository semestreRepository) {
        this.filiereRepository = filiereRepository;
        this.etapeRepository = etapeRepository;
        this.semestreRepository = semestreRepository;
    }
    
    @GetMapping({ "/filiere/creer" })
    public ModelAndView create() {
        final ModelAndView model = new ModelAndView("creerFiliere");
        model.addObject("creerFiliere", (Object)"mm-active");
        return model;
    }
    
    @PostMapping({ "/filiere/creer" })
    public ModelAndView create(@RequestParam("filiere") final String string_filiere, @RequestParam("semester_number") final Integer semester_number) {
        final ModelAndView model = new ModelAndView("redirect:/");
        final Filiere filiere = new Filiere();
        filiere.setNom_filiere(string_filiere);
        this.filiereRepository.save(filiere);
        for (int last_year = semester_number / 2 + semester_number % 2, i = 1; i <= last_year; ++i) {
            Etape etape = new Etape();
            etape.setFiliere(filiere);
            etape.setLibelle_etape((i == 1) ? "1\u00e8re Ann\u00e9e" : (String.valueOf(i) + "eme Ann\u00e9e"));
            etape.setDiplomante(0);
            etape = (Etape)this.etapeRepository.save(etape);
            final Semestre semestre1 = new Semestre();
            semestre1.setEtape(etape);
            semestre1.setFiliere(filiere);
            semestre1.setLibelle_semestre("Semestre" + (2 * i - 1));
            this.semestreRepository.save(semestre1);
            if ((i == last_year && semester_number % 2 == 0) || i != last_year) {
                final Semestre semestre2 = new Semestre();
                semestre2.setEtape(etape);
                semestre2.setFiliere(filiere);
                semestre2.setLibelle_semestre("Semestre" + 2 * i);
                this.semestreRepository.save(semestre2);
            }
        }
        return model;
    }
}