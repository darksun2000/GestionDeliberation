package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.umi.models.Filiere;

public interface FiliereRepository extends JpaRepository<Filiere, Integer>{

	@Query("select s from Filiere s")
	List<Filiere> getAllFiliere();

}
