package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.authentication.User;
import com.umi.models.Professeur;

public interface ProfesseurRepository extends JpaRepository<Professeur, Integer>{
	 @Query(value="select s from Professeur s")
	    public List<Professeur> getAllProfesseur();
	 
	 @Query("select p from Professeur p where p.user = :user")
	 public Professeur getProfesseurByUser(@Param("user") User user);
}
