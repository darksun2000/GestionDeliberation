package com.umi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.umi.models.Element;

public interface ElementRepository extends JpaRepository<Element, Integer>{

}
