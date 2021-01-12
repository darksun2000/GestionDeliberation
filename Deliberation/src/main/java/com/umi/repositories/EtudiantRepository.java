package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.umi.models.Etudiant;

public interface EtudiantRepository extends JpaRepository<Etudiant, Integer>{
	
	@Query("select s from Etudiant s")
	List<Etudiant> getAllStudents();
	
	@Query("select s from Etudiant s where s.nationality = :nationality")
	List<Etudiant> getStudentByNationality(@Param("nationality") String nationality);
	
	@Query("select id from Etudiant s where first_name_fr = :a and last_name_fr = :b")
	int getIdEtudiantByName(@Param("a")String first_name_fr,@Param("b")String last_name_fr);
	
	@Query("select id from Etudiant s where cne = :x")
	int getIdEtudiantByCne(@Param("x")String cne);
	
	@Query("select s from Etudiant s where cne = :x")
	Etudiant getEtudiantByCne(@Param("x")String cne);
	
	@Transactional
	@Modifying
	@Query(value="INSERT INTO Etudiant(id, academy, bac_place, bac_type, bac_year, date, birth_place,"
			+ " city, cne, establishment, first_name_ar, first_name_fr, gender, high_school, last_name_ar,"
			+ " last_name_fr, massar_edu, mention, nationality, province, registration_date)"
			+ " SELECT id, academy, bac_place, bac_type, bac_year, date, birth_place, city,"
			+ " cne, establishment, first_name_ar, first_name_fr, gender, high_school, last_name_ar,"
			+ " last_name_fr, massar_edu, mention, nationality, province, registration_date"
			+ " FROM deliberationbachelor.inscription_en_ligne WHERE id=:x" , nativeQuery=true)
    void copyIeEtudiant(@Param("x")int id);

}
