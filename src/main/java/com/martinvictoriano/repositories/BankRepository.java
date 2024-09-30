package com.martinvictoriano.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.martinvictoriano.models.Bank;

@Repository
public interface BankRepository extends CrudRepository<Bank, Long> {
	List<Bank> findAll();
}
