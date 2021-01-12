package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Semestre;
import com.umi.models.Module;

public interface ModuleRepository extends JpaRepository<Module, Integer>{

	@Query("select s from Module s where semestre=:x")
	List<Module> getModuleBySemestre(@Param("x")Semestre semestre);
	
	@Query("select s from Module s")
	List<Module> getAllModules();
}
