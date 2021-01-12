package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.umi.models.Professeur;

public interface ProfesseurRepository extends JpaRepository<Professeur, Integer>{
	 @Query(value="select s from Professeur s")
	    public List<Professeur> getAllProfesseur();
}
