package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Etape;
import com.umi.models.Filiere;
import com.umi.models.Semestre;

public interface SemestreRepository extends JpaRepository<Semestre, Integer>{

	@Query("select s from Semestre s")
	List<Semestre> getAllSemestre();
	
	@Query("select s from Semestre s where filiere=:x")
	List<Semestre> getSemestreByFiliere(@Param("x")Filiere filiere);
	
	@Query("select s from Semestre s where etape = :etape")
	List<Semestre> getSemestreByEtape(@Param("etape") Etape etape);
	
	@Query("select s from Semestre s where filiere=:x and libelle_semestre=:y")
	Semestre getSemestreByFiliereAndLibelle(@Param("x")Filiere filiere,@Param("y")String libelle_semestre);
}
