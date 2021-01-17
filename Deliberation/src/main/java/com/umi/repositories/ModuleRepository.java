package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Semestre;
import com.umi.models.Filiere;
import com.umi.models.Module;
import com.umi.models.Professeur;

public interface ModuleRepository extends JpaRepository<Module, Integer>{
	
	@Query("select m from Module m where m.professeur = :professeur")
	List<Module> getModulesByProfesseur(@Param("professeur") Professeur professeur);

	@Query("select s from Module s where semestre=:x")
	List<Module> getModuleBySemestre(@Param("x")Semestre semestre);
	
	@Query("select s from Module s")
	List<Module> getAllModules();
	
	@Query("select m from Module m, Semestre s where m.semestre = s.id_semestre and s.filiere = :filiere")
	List<Module> getModulesByFiliere(@Param("filiere") Filiere filiere);
}
