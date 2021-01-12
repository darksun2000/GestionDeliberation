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
	
	@Query("select s from InscriptionEnLigne s where s.accepted=1")
	List<InscriptionEnLigne> getAllInscriptionsEnLigneAccepted();
	
	@Query("select s from InscriptionEnLigne s where s.accepted=1 and s.first_name_fr=:x and s.last_name_fr=:y")
	InscriptionEnLigne findByNameAccepted(@Param("x")String first_name_fr,@Param("y")String last_name_fr);
	
	List<InscriptionEnLigne> findById(int ID);
	void deleteById(int ID);
	
	@Transactional
	@Modifying
	@Query("update InscriptionEnLigne s set s.accepted=:y where s.id=:x")
	void updateAcceptation(@Param("x")int id,@Param("y")int accepted);
	
}
