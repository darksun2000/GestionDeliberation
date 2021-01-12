package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Element;
import com.umi.models.Module;

public interface ElementRepository extends JpaRepository<Element, Integer>{
	@Query("select s from Element s")
	List<Element> getAllElement();
	@Query("select s from Element s where module=:x")
	List<Element> getElementByModule(@Param("x")Module module);
}
