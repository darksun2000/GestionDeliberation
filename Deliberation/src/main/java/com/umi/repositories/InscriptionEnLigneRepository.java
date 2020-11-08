package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.umi.models.InscriptionEnLigne;

public interface InscriptionEnLigneRepository extends JpaRepository<InscriptionEnLigne, Integer>{

	@Query("select s from InscriptionEnLigne s")
	List<InscriptionEnLigne> getAllInscriptionsEnLigne();
	
	List<InscriptionEnLigne> findById(int ID);
	void deleteById(int ID);
	
	@Transactional
	@Modifying
	@Query("update InscriptionEnLigne s set s.accepted=:y where s.id=:x")
	void updateAcceptation(@Param("x")int id,@Param("y")int accepted);
	
}
