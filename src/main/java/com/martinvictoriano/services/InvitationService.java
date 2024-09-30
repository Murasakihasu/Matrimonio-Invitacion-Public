package com.martinvictoriano.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.martinvictoriano.models.Invitation;
import com.martinvictoriano.repositories.InvitationRepository;

@Service
public class InvitationService {
	@Autowired
	private final InvitationRepository invitationRepository;
	
	//Constructor
	public InvitationService(InvitationRepository invitationRepository) {
		this.invitationRepository = invitationRepository;
		}
	
	
	//Pick all the Invitations
	public List<Invitation> allInvitation() {
		return invitationRepository.findAll();
		}
			
	
	//Create an Invitation
	public Invitation createInvitation(Invitation newInvitation) {
		return invitationRepository.save(newInvitation);
			
		}
	
	
	//Find an Invitation by id
	public Invitation getInvitationById(Long id) {
		Optional<Invitation> optionalInvitation = invitationRepository.findById(id);
		if(optionalInvitation.isPresent()) {
			return optionalInvitation.get();
			} 
		else {
			return null;
			}
		}
	
	
	//Find an Invitation by codigo
	public Invitation getInvitationByCodigo(String codigo) {
		Optional<Invitation> optionalInvitation = invitationRepository.findByCodigo(codigo);
		if(optionalInvitation.isPresent()) {
			return optionalInvitation.get();
			} 
		else {
			return null;
			}
		}
	
	//add Guest to Invitation
	public Invitation updateList(Invitation newInvitation) {
		Invitation existingInvitation = getInvitationById(newInvitation.getId());
		existingInvitation.setGuests(newInvitation.getGuests());
		return invitationRepository.save(existingInvitation);
		}
	
	
	//edit Invitation
	public Invitation updateInvitation(Invitation newInvitation) {
		Invitation existingInvitation = getInvitationById(newInvitation.getId());
		existingInvitation.setTitle(newInvitation.getTitle());
		return invitationRepository.save(existingInvitation);
		}
	
	
	//delete invitation
	public void deleteInvitation(Long id) {
		invitationRepository.deleteById(id);
		}
}