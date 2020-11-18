package com.umi.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.umi.models.Etudiant;
import com.umi.models.InscriptionAdministrative;

public interface InscriptionAdministrativeRepository extends JpaRepository<InscriptionAdministrative, Integer>{

	@Query("select s from InscriptionAdministrative s")
	List<InscriptionAdministrative> getAllInscriptionsAdministrative();
	
	@Transactional
	@Modifying
	@Query("update InscriptionAdministrative s set s.annee_academique=:a, s.date_pre_inscription=:b, s.date_valid_inscription=:c, s.etudiant=:d, s.filieres_id_filiere=:e, s.operateur=:f where s.id_ia=g")
	void updateInscriptionAdministrative(@Param("f")int id_ia,@Param("a")String annee_academique,@Param("b")Date date_pre_inscription,@Param("c")Date date_valid_inscription,@Param("d")int etudiant,@Param("e")int filieres_id_filiere,@Param("f")String operateur);
}
