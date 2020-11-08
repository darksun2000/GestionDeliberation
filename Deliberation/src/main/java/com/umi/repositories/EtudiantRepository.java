package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Etudiant;

public interface EtudiantRepository extends JpaRepository<Etudiant, Integer>{
	
	@Query("select s from Etudiant s")
	List<Etudiant> getAllStudents();
	
	@Query("select s from Etudiant s where s.cne = :cne")
	Etudiant getEtudiantByCne(@Param("cne") String cne);
	
	@Query("select s from Etudiant s where s.nationality = :nationality")
	List<Etudiant> getStudentByNationality(@Param("nationality") String nationality);

}
