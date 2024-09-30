package com.martinvictoriano.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.martinvictoriano.models.Important;

@Repository
public interface ImportantRepository extends CrudRepository<Important, Long> {
	List<Important> findAll();
}