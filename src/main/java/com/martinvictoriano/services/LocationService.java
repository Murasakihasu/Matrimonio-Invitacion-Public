package com.martinvictoriano.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.martinvictoriano.models.Location;
import com.martinvictoriano.repositories.LocationRepository;

@Service
public class LocationService {
	@Autowired
	private final LocationRepository locationRepository;
	
	//Constructor
	public LocationService(LocationRepository locationRepository) {
		this.locationRepository = locationRepository;
		}
	
	//Pick all the Locations
	public List<Location> allLocation() {
		return locationRepository.findAll();
		}
				
		
	//Create a Location
	public Location createLocation(Location  newLocation ) {
			return locationRepository.save(newLocation );
			}
		
		
	//Find a Location by id
	public Location getLocationById(Long id) {
		Optional<Location> optionalLocation = locationRepository.findById(id);
		if(optionalLocation.isPresent()) {
			return optionalLocation.get();
			} 
		else {
			return null;
			}
		}
		
	
	//delete Location
	public void deleteLocation(Long id) {
		locationRepository.deleteById(id);
		}
		
		
	//edit Location
	public Location updateLocation(Location newLocation) {
		Location existingLocation = getLocationById(newLocation.getId());
		existingLocation.setName(newLocation.getName());
		existingLocation.setPlace(newLocation.getPlace());
		return locationRepository.save(existingLocation);
		}
}
