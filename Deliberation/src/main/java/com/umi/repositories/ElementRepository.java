package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Element;
import com.umi.models.Filiere;
import com.umi.models.Module;
import com.umi.models.Professeur;

public interface ElementRepository extends JpaRepository<Element, Integer>{
	@Query("select s from Element s")
	List<Element> getAllElement();
	@Query("select s from Element s where module=:x")
	List<Element> getElementByModule(@Param("x")Module module);
	
	@Query("select e from Element e where e.professeur = :professeur")
	List<Element> getElementsByProfesseur(@Param("professeur") Professeur professeur);
	
	@Query(value = "select e.* from element e, module m, semestre s, filiere f "
			+ "where s.filiere = :filiere and s.filiere = f.id_filiere "
			+ "and s.id_semestre = m.semestre and m.id_module = e.module"
			, nativeQuery = true)
	List<Element> getElementsByFiliere(@Param("filiere") Filiere filiere);
}
