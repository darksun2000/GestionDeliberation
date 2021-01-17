package com.umi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.umi.models.NoteModule;

public interface NoteModuleRepository extends JpaRepository<NoteModule, Integer>{

}
