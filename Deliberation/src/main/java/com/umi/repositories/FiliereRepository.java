package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Etablissement;
import com.umi.models.Filiere;

public interface FiliereRepository extends JpaRepository<Filiere, Integer>{

	@Query("select s from Filiere s")
	List<Filiere> getAllFiliere();

	@Query("select f from Filiere f where f.etablissement = :etablissement")
	List<Filiere> getFilieresByEtablissement(@Param("etablissement") Etablissement etablissement);
	
}
