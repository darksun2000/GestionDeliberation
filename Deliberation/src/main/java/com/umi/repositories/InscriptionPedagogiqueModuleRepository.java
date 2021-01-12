package com.umi.repositories;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.umi.models.Module;
import com.umi.models.Etudiant;
import com.umi.models.Filiere;
import com.umi.models.InscriptionPedagogique;
import com.umi.models.InscriptionPedagogiqueModule;

public interface InscriptionPedagogiqueModuleRepository extends JpaRepository<InscriptionPedagogiqueModule, Integer>  {
	@Query("select s from InscriptionPedagogiqueModule s")
	List<InscriptionPedagogiqueModule> getAllInscriptionPedagogiqueModule();
	
	@Query("select s from InscriptionPedagogiqueModule s where s.inscription_pedagogique = :inscription_pedagogique")
	List<InscriptionPedagogiqueModule> getInscriptionPedagogiqueModuleByEtudiant(@Param("inscription_pedagogique") InscriptionPedagogique i);
	
	@Query("select s from InscriptionPedagogiqueModule s where s.inscription_pedagogique = :inscription_pedagogique and s.module = :module")
	List<InscriptionPedagogiqueModule> getInscriptionPedagogiqueModuleByEtudiantModule(@Param("inscription_pedagogique") InscriptionPedagogique i,@Param("module") Module e);
	@Query("select s from InscriptionPedagogiqueModule s where s.module = :x")
	List<InscriptionPedagogiqueModule> getInscriptionPedagogiqueModuleByModule(@Param("x") Module module);
	@Query("select s from InscriptionPedagogiqueModule s where s.inscription_pedagogique.etudiant = :x and s.module = :module")
	InscriptionPedagogiqueModule getInscriptionPedagogiqueModuleByEtudiantAndModule(@Param("x") Etudiant i,@Param("module") Module m);
	
	@Transactional
	@Modifying
	@Query("update InscriptionPedagogiqueModule s set s.inscription_pedagogique=:i, s.module=:m, s.note_module=:n, s.validation=:v where s.id=:id")
	void updateInscriptionPedagogiqueModule(@Param("id")int id,@Param("i") InscriptionPedagogique i,@Param("m") Module m,@Param("n")Double note,
			@Param("v")Double validation);

	
	
}