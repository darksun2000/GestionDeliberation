package com.umi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.umi.models.Note;

public interface NoteRepository extends JpaRepository<Note, Integer>{

}
