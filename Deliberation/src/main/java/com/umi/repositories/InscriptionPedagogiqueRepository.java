package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Etudiant;
import com.umi.models.InscriptionPedagogique;

public interface InscriptionPedagogiqueRepository extends JpaRepository<InscriptionPedagogique, Integer>{
	
	@Query(value = "select i.* from inscription_pedagogique i where"
			+ " i.etudiant = :etudiant order by i.date_valid_inscription desc limit 1;"
			, nativeQuery = true)
	InscriptionPedagogique getInscriptionPedagogiqueByEtudiants(@Param("etudiant") Etudiant etudiant);
	
}
