package com.martinvictoriano.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.martinvictoriano.models.Guest;
import com.martinvictoriano.repositories.GuestRepository;

@Service
public class GuestService {
	@Autowired
	private final GuestRepository guestRepository;
	
	//Constructor
	public GuestService(GuestRepository guestRepository) {
		this.guestRepository = guestRepository;
		}
	
	
	//Pick all the guests
	public List<Guest> allGuests() {
		return guestRepository.findAll();
		}
			
	
	//Create a guest
	public Guest createGuest(Guest newGuest) {
		return guestRepository.save(newGuest);
		}
	
	
	//Find an guest by id
	public Guest getGuestById(Long id) {
		Optional<Guest> optionalGuest = guestRepository.findById(id);
		if(optionalGuest.isPresent()) {
			return optionalGuest.get();
			} 
		else {
			return null;
			}
		}
	
	//delete guest
	public void deleteGuest(Long id) {
		guestRepository.deleteById(id);
		}
	
	
	//update Confirmation
	public void updateConfirm(Guest guest) {
		guestRepository.save(guest);
	}
		
}