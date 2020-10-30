package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Etape;

public interface EtapeRepository extends JpaRepository<Etape, Integer>{
	
	@Query("select e from Etape e where e.libelle_etape = :libelle_etape")
	List<Etape> getEtapesByLibelle(@Param("libelle_etape")String libelle_etape);

}
