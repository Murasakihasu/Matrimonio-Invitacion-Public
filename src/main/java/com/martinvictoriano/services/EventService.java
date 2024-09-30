package com.martinvictoriano.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.martinvictoriano.models.Event;
import com.martinvictoriano.repositories.EventRepository;

@Service
public class EventService {
	@Autowired
	private final EventRepository eventRepository;
	
	//Constructor
	public EventService(EventRepository eventRepository) {
		this.eventRepository = eventRepository;
		}
	
	
	//Pick all the Events
	public List<Event> allEvent() {
		return eventRepository.findAll();
		}
			
	
	//Create an Event
	public Event createEvent(Event newEvent) {
		return eventRepository.save(newEvent);
			
		}
	
	
	//Find an Event by id
	public Event getEventById(Long id) {
		Optional<Event> optionalEvent = eventRepository.findById(id);
		if(optionalEvent.isPresent()) {
			return optionalEvent.get();
			} 
		else {
			return null;
			}
		}
	
	
	//add Invitation to Event
	public Event updateInvitationList(Event newEvent) {
		Event existingEvent = getEventById(newEvent.getId());
		existingEvent.setInvitations(newEvent.getInvitations());
		return eventRepository.save(existingEvent);
		}
	
	
	//add location to Event
	public Event updateLocationList(Event newEvent) {
		Event existingEvent = getEventById(newEvent.getId());
		existingEvent.setLocation(newEvent.getLocation());
		return eventRepository.save(existingEvent);
		}
		
	
	//add bank to Event
	public Event updateEventBank(Event newEvent) {
		Event existingEvent = getEventById(newEvent.getId());
		existingEvent.setBank(newEvent.getBank());
		return eventRepository.save(existingEvent);
		}
		
	
	
	//edit Event
	public Event updateEvent(Event newEvent) {
		Event existingEvent = getEventById(newEvent.getId());
		existingEvent.setDate(newEvent.getDate());
		existingEvent.setStart(newEvent.getStart());
		existingEvent.setEnd(newEvent.getEnd());
		existingEvent.setGifts(newEvent.getGifts());
		existingEvent.setGiftsType(newEvent.getGiftsType());
		existingEvent.setPhotos(newEvent.getPhotos());
		return eventRepository.save(existingEvent);
		}
	
	
	//delete invitation
	public void deleteEvent(Long id) {
		eventRepository.deleteById(id);
		}
}