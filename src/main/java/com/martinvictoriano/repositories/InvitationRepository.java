package com.martinvictoriano.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.martinvictoriano.models.Invitation;

@Repository
public interface InvitationRepository extends CrudRepository<Invitation, Long>{
	List<Invitation> findAll();
	Optional<Invitation> findByCodigo(String codigo);

}