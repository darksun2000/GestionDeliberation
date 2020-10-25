package com.umi.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.umi.models.Student;

public interface StudentRepository extends JpaRepository<Student, Integer>{
	
	@Query("select s from Student s")
	List<Student> getAllStudents();
	
	@Query("select s from Student s where s.nationality = :nationality")
	List<Student> getStudentByNationality(@Param("nationality") String nationality);

}
