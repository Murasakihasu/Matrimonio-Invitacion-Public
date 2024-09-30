package com.martinvictoriano.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.martinvictoriano.models.Bank;
import com.martinvictoriano.repositories.BankRepository;

@Service
public class BankService {
	@Autowired
	private final BankRepository bankRepository;
	
	//Constructor
	public BankService(BankRepository bankRepository) {
		this.bankRepository = bankRepository;
		}
	
	//Create a Bank
	public Bank createBank(Bank newBank) {
		return bankRepository.save(newBank);
			
		}
	
	
	//Search bank
	public Bank getBankById(Long id) {
		Optional<Bank> optionalBank = bankRepository.findById(id);
		if(optionalBank.isPresent()) {
			return optionalBank.get();
			} 
		else {
			return null;
			}
		}
	
	
	//edit Bank
	public Bank updateBank(Bank newBank) {
		Bank existingBank = getBankById(newBank.getId());
		existingBank.setName(newBank.getName());
		existingBank.setEmail(newBank.getEmail());
		existingBank.setBanco(newBank.getBanco());
		existingBank.setTipoCuenta(newBank.getTipoCuenta());
		existingBank.setNumeroCuenta(newBank.getNumeroCuenta());
		existingBank.setRut(newBank.getRut());
		return bankRepository.save(existingBank);
		}
	
	
	//delete bank
	public void deleteBank(Long id) {
		bankRepository.deleteById(id);
		}
}