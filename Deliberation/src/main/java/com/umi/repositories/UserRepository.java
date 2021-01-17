package com.umi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.authentication.User;

public interface UserRepository extends JpaRepository<User, Long>{

	User findByUsername(String username); 
	
	
	@Query("select u from User u where u.username = :username")
	User getUserByUsername(@Param("username") String username);
	
	@Query("select count(u) from User u where u.roles = :roles")
	Integer getCountUsersByRole(@Param("roles")String roles);
	
}
