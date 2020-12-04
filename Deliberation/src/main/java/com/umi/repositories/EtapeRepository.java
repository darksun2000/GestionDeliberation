package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.umi.models.Etape;

public interface EtapeRepository extends JpaRepository<Etape, Integer>{
	
	@Query("select e from Etape e where e.libelle_etape = :libelle_etape")
	List<Etape> getEtapesByLibelle(@Param("libelle_etape")String libelle_etape);

	@Transactional
	@Modifying
	@Query("update Etape s set s.diplomante=:a where s.id_etape=:g")
	void activerDiplomante(@Param("g")int id_ia,@Param("a")int diplomante);
	
}
