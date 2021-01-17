package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Element;
import com.umi.models.InscriptionPedagogique;
import com.umi.models.NoteElement;

public interface NoteElementRepository extends JpaRepository<NoteElement, Integer> {
	@Query("select s from NoteElement s")
	List<NoteElement> getAllNoteElement();
	
	@Query("select s from NoteElement s where s.inscription_pedagogique = :inscription_pedagogique")
	List<NoteElement> getNoteElementEtudiant(@Param("inscription_pedagogique") InscriptionPedagogique i);
	
	@Query("select s from NoteElement s where s.inscription_pedagogique = :inscription_pedagogique and s.element = :element")
	List<NoteElement> getNoteElementEtudiantElement(@Param("inscription_pedagogique") InscriptionPedagogique i,@Param("element") Element e);
	@Query("select s from NoteElement s where s.element = :x")
	List<NoteElement> getNoteElementByElement(@Param("x") Element i);

}
