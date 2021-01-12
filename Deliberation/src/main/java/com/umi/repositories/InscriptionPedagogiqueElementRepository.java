package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.umi.models.Element;
import com.umi.models.InscriptionPedagogique;
import com.umi.models.InscriptionPedagogiqueElement;

public interface InscriptionPedagogiqueElementRepository extends JpaRepository<InscriptionPedagogiqueElement, Integer>  {
	@Query("select s from InscriptionPedagogiqueElement s")
	List<InscriptionPedagogiqueElement> getAllInscriptionPedagogiqueElement();
	
	@Query("select s from InscriptionPedagogiqueElement s where s.inscription_pedagogique = :inscription_pedagogique")
	List<InscriptionPedagogiqueElement> getInscriptionPedagogiqueElementByEtudiant(@Param("inscription_pedagogique") InscriptionPedagogique i);
	
	@Query("select s from InscriptionPedagogiqueElement s where s.inscription_pedagogique = :inscription_pedagogique and s.element = :element")
	List<InscriptionPedagogiqueElement> getInscriptionPedagogiqueElementByEtudiantElement(@Param("inscription_pedagogique") InscriptionPedagogique i,@Param("element") Element element);
	@Query("select s from InscriptionPedagogiqueElement s where s.element = :x")
	List<InscriptionPedagogiqueElement> getInscriptionPedagogiqueElementByElement(@Param("x") Element element);

}
