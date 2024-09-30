package com.martinvictoriano.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.martinvictoriano.models.Guest;

@Repository
public interface GuestRepository extends CrudRepository<Guest, Long>{
	List<Guest> findAll();

}
