package com.umi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.authentication.User;
import com.umi.models.Responsable;

public interface ResponsableRepository extends JpaRepository<Responsable, Integer>{
	
	@Query("select r from Responsable r where r.user = :user")
	Responsable getResponsableByUser(@Param("user") User user);

}
