package com.martinvictoriano.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.martinvictoriano.models.Important;
import com.martinvictoriano.repositories.ImportantRepository;

@Service
public class ImportantService {
	@Autowired
	private final ImportantRepository importantRepository;
	
	//Constructor
	public ImportantService(ImportantRepository importantRepository) {
		this.importantRepository = importantRepository;
		}

	
	//Pick all the Important messages
	public List<Important> allimportant() {
		return importantRepository.findAll();
		}
			
	
	//Create a message
	public Important createImportant(Important  newImportant ) {
		return importantRepository.save(newImportant );
		}
	
	
	//Find a message by id
	public Important getImportantById(Long id) {
		Optional<Important> optionalImportant = importantRepository.findById(id);
		if(optionalImportant.isPresent()) {
			return optionalImportant.get();
			} 
		else {
			return null;
			}
		}
	
	//delete message
	public void deleteImportant(Long id) {
		importantRepository.deleteById(id);
		}
	
	
	//edit Message
	public Important updateImportant(Important newImportant) {
		Important existingImportant = getImportantById(newImportant.getId());
		existingImportant.setTitle(newImportant.getTitle());
		existingImportant.setInfo(newImportant.getInfo());
		return importantRepository.save(existingImportant);
		}
		
}
