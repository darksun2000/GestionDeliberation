package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.umi.models.InscriptionAdministrative;

public interface InscriptionAdministrativeRepository extends JpaRepository<InscriptionAdministrative, Integer>{

	@Query("select s from InscriptionAdministrative s")
	List<InscriptionAdministrative> getAllInscriptionsAdministrative();
	
}
