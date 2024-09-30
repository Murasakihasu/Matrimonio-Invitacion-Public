package com.martinvictoriano.controllers;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.martinvictoriano.models.Bank;
import com.martinvictoriano.models.Event;
import com.martinvictoriano.models.Guest;
import com.martinvictoriano.models.Important;
import com.martinvictoriano.models.Invitation;
import com.martinvictoriano.models.Location;
import com.martinvictoriano.models.LoginUser;
import com.martinvictoriano.models.User;
import com.martinvictoriano.services.BankService;
import com.martinvictoriano.services.EventService;
import com.martinvictoriano.services.GuestService;
import com.martinvictoriano.services.ImportantService;
import com.martinvictoriano.services.UserService;
import com.martinvictoriano.services.InvitationService;
import com.martinvictoriano.services.LocationService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
	
	@Autowired
	private final UserService userService;
	@Autowired
	private final GuestService guestService;
	@Autowired
	private final InvitationService invitationService;
	@Autowired
	private final EventService eventService;
	@Autowired
	private final LocationService locationService;
	@Autowired
	private final BankService bankService;
	@Autowired
	private final ImportantService importantService;

	//Constructor
	public UserController(UserService userService, GuestService guestService, 
						InvitationService invitationService, EventService eventService,
						LocationService locationService, BankService bankService,
						ImportantService importantService){
		this.userService = userService;
		this.guestService = guestService;
		this.invitationService = invitationService;
		this.eventService = eventService;
		this.locationService = locationService;
		this.bankService = bankService;
		this.importantService = importantService;
		}

	
	
	//Login
	@GetMapping({"/","/login"})
	public String loginAndRegister(@ModelAttribute("userLogin") LoginUser loginUser) {
		return "userLogin.jsp";
		}
		
	
	//Login data
	@PostMapping("/login")
	public String loginUser(@Valid @ModelAttribute("userLogin") LoginUser loginUser,
							BindingResult validation, HttpSession sesion ) {
		
		validation = userService.validateLogin(validation, loginUser);
		if (validation.hasErrors()) {
			return "userLogin.jsp";
			}
		else {
			User user = userService.getUserByEmail(loginUser.getLoginEmail());
			sesion.setAttribute("user_id", user.getId());
			Event event = user.getEvent();
			if(event==null) {
				return "redirect:/user/"+user.getId()+"/create/event";
			}
			sesion.setAttribute("event_id", event.getId());
			return "redirect:/user/"+ user.getId()+"/event/"+event.getId();
			}
		}
	
	
	//Logout
	@PutMapping("/logout")
	public String logout(HttpSession sesion) {
		sesion.invalidate();
		return "redirect:/";
		}
	
		
	//Register
	@GetMapping("/register")
	public String formRegister(@ModelAttribute("user") User newUser) {
		return "userRegister.jsp";
		}

	
	//Register data
	@PostMapping("/register")
	public String createNewUser(@Valid @ModelAttribute("user") User newUser, BindingResult validation,
								@ModelAttribute("userLogin") LoginUser loginUser, HttpSession sesion) {
		
		validation = userService.validateRegister(validation, newUser);
		if (validation.hasErrors()) {
			return "userRegister.jsp";
			}
		User user = userService.createUser(newUser);
		sesion.setAttribute("user_id", user.getId());
		return "redirect:/user/"+user.getId()+"/create/event";
		}
	
	
	//Create Event
	@GetMapping("/user/{userId}/create/event")
	public String createEvent(@PathVariable("userId") Long userId, Model model, HttpSession sesion,
							  @ModelAttribute("event") Event newEvent) {
		
		if(sesion.getAttribute("user_id") == null){
			return "redirect:/";
		}
		User user = userService.getUserById(userId);
		model.addAttribute("user", user);
		return "userCreateEvent.jsp";
	}
	
	
	//Create event data
	@PostMapping("/user/{userId}/create/event")
	public String addEvent(@Valid @ModelAttribute("event") Event newEvent, BindingResult validation,
							HttpSession sesion, @PathVariable("userId") Long userId, Model model) {
		
		User user = userService.getUserById(userId);
		if (validation.hasErrors()) {
			model.addAttribute("user", user);
			return "userCreateEvent.jsp";
			}
		newEvent.setUser(user);
		newEvent.setId(null);
		user.setEvent(newEvent);
		eventService.createEvent(newEvent);
		Event event = user.getEvent();
		sesion.setAttribute("event_id", event.getId());
	    return "redirect:/user/"+ user.getId()+"/event/"+event.getId();	
	}
	
	
	//Event
	@GetMapping("/user/{userId}/event/{eventId}")
	public String event(@PathVariable("userId") Long userId,@PathVariable("eventId") Long eventId,
						Model model, HttpSession sesion,
						@ModelAttribute("location") Location newLocation,
						@ModelAttribute("bank") Bank newBank,
						@ModelAttribute("important") Important newImportant,
						@ModelAttribute("event") Event newEvent) {
		if(sesion.getAttribute("user_id") == null){
			return "redirect:/";
		}
		if(sesion.getAttribute("event_id") == null){
			return "redirect:/user/"+userId+"/create/event";
		}
		User user = userService.getUserById(userId);
		Event event = eventService.getEventById(eventId);
		model.addAttribute("event", event);
		model.addAttribute("user", user);
		return "userEvent.jsp";
	}
	
	
	//add Location
	@PostMapping("/user/{userId}/event/{eventId}/location/create")
	public String addLocation(@Valid @ModelAttribute("location") Location newLocation,
								BindingResult validation, HttpSession sesion,
								@PathVariable("userId") Long userId,
								@PathVariable("eventId") Long eventId, Model model) {
		if (validation.hasErrors()) {
			User user = userService.getUserById(userId);
			Event event = eventService.getEventById(eventId);
			model.addAttribute("event", event);
			model.addAttribute("user", user);
			model.addAttribute("important", new Important());
			model.addAttribute("bank", new Bank());
			return "userEvent.jsp";
			}
		Event event = eventService.getEventById(eventId);
		newLocation.setEvent(event);
		newLocation.setId(null);
		locationService.createLocation(newLocation);
	    return "redirect:/user/"+userId+"/event/"+eventId;
		}
	
	
	//add Bank
	@PostMapping("/user/{userId}/event/{eventId}/bank/create")
	public String addLocation(@Valid @ModelAttribute("bank") Bank newBank,
								BindingResult validation, HttpSession sesion,
								@PathVariable("userId") Long userId,
								@PathVariable("eventId") Long eventId, Model model) {
		if (validation.hasErrors()) {
			User user = userService.getUserById(userId);
			Event event = eventService.getEventById(eventId);
			model.addAttribute("event", event);
			model.addAttribute("user", user);
			model.addAttribute("location", new Location());
			model.addAttribute("important", new Important());
			return "event.jsp";
			}
		Event event = eventService.getEventById(eventId);
		newBank.setEvent(event);
		newBank.setId(null);
		bankService.createBank(newBank);
	    return "redirect:/user/"+userId+"/event/"+eventId;
		}
	
	
	//add Important
	@PostMapping("/user/{userId}/event/{eventId}/important/create")
	public String addImportant(@Valid @ModelAttribute("important") Important newImportant,
								BindingResult validation, HttpSession sesion,
								@PathVariable("userId") Long userId,
								@PathVariable("eventId") Long eventId, Model model) {
		if (validation.hasErrors()) {
			User user = userService.getUserById(userId);
			Event event = eventService.getEventById(eventId);
			model.addAttribute("event", event);
			model.addAttribute("user", user);
			model.addAttribute("location", new Location());
			model.addAttribute("bank", new Bank());
			return "userEvent.jsp";
			}
		Event event = eventService.getEventById(eventId);
		newImportant.setEvent(event);
		newImportant.setId(null);
		importantService.createImportant(newImportant);
	    return "redirect:/user/"+userId+"/event/"+eventId;
		}
	
	
	//Invitations
	@GetMapping("/user/{userId}/event/{eventId}/invitation")
	public String invitation(@ModelAttribute("invitation") Invitation newInvitation,
							@ModelAttribute("guest") Guest newGuest,
							@PathVariable("userId") Long userId,
							@PathVariable("eventId") Long eventId,
							Model model, HttpSession sesion) {
		if(sesion.getAttribute("user_id") == null){
			return "redirect:/";
		}
		if(sesion.getAttribute("event_id") == null){
			return "redirect:/";
		}
		User user = userService.getUserById(userId);
		Event event = eventService.getEventById(eventId);
		model.addAttribute("event", event);
		model.addAttribute("user", user);
		return "userInvitations.jsp";
	}
		
	
	//add Invitation
	@PostMapping("/user/{userId}/event/{eventId}/invitation/create")
	public String addInvitation(@Valid @ModelAttribute("invitation") Invitation newInvitation,
								BindingResult validation, HttpSession sesion,
								@PathVariable("userId") Long userId, @PathVariable("eventId") Long eventId,
								Model model, @ModelAttribute("guest") Guest newGuest) {
		if (validation.hasErrors()) {
			User user = userService.getUserById(userId);
			Event event = eventService.getEventById(eventId);
			model.addAttribute("event", event);
			model.addAttribute("user", user);
			return "userInvitations.jsp";
			}
		User user = userService.getUserById(userId);
		Event event = eventService.getEventById(eventId);
		newInvitation.setUser(user);
		newInvitation.setEvent(event);
		newInvitation.setId(null);
		String codigo = generateCodigo();
		newInvitation.setCodigo(codigo);
		invitationService.createInvitation(newInvitation);
	    return "redirect:/user/"+ user.getId()+"/event/"+event.getId()+"/invitation";	
	}
	
	
	//add Guests
	@PostMapping("/user/{userId}/event/{eventId}/invitation/{invId}/guest/create")
	public String addGuests(@Valid @ModelAttribute("guest") Guest newGuest,
							BindingResult validation, @ModelAttribute("invitation") Invitation newInvitation,
							@PathVariable("userId") Long userId,
							@PathVariable("invId") Long invId, @PathVariable("eventId") Long eventId,
							Model model) {
		if (validation.hasErrors()) {
			User user = userService.getUserById(userId);
			Event event = eventService.getEventById(eventId);
			model.addAttribute("event", event);
			model.addAttribute("user", user);
			return "invitations.jsp";
			}
		Invitation invitation = invitationService.getInvitationById(invId);
		Event event = eventService.getEventById(eventId);
		event.addTotalGuests(1);
		newGuest.setInvitation(invitation);
		guestService.createGuest(newGuest);
		return "redirect:/user/"+ userId+"/event/"+eventId+"/invitation";
	}
	
	
	
	//Edit invitations
	@GetMapping("/user/{userId}/event/{eventId}/invitation/edit")
	public String editInvitation(@ModelAttribute("invitation") Invitation newInvitation,
							@ModelAttribute("guest") Guest newGuest,
							@PathVariable("userId") Long userId,
							@PathVariable("eventId") Long eventId,
							Model model, HttpSession sesion) {
		if(sesion.getAttribute("user_id") == null){
			return "redirect:/";
		}
		if(sesion.getAttribute("event_id") == null){
			return "redirect:/user/"+userId+"/create/event";
		}
		User user = userService.getUserById(userId);
		Event event = eventService.getEventById(eventId);
		model.addAttribute("event", event);
		model.addAttribute("user", user);
		return "userEditInvitation.jsp";
	}
	
	
	//edit Invitation data
	@PostMapping("/user/{userId}/event/{eventId}/invitation/{invId}/edit")
	public String editInvitation(@Valid @ModelAttribute("invitation") Invitation newInvitation,
								BindingResult validation, HttpSession sesion,
								@PathVariable("userId") Long userId, @PathVariable("eventId") Long eventId,
								Model model, @ModelAttribute("guest") Guest newGuest) {
		if (validation.hasErrors()) {
			User user = userService.getUserById(userId);
			Event event = eventService.getEventById(eventId);
			model.addAttribute("event", event);
			model.addAttribute("user", user);
			return "userEditInvitation.jsp";
			}
		invitationService.updateInvitation(newInvitation);
	    return "redirect:/user/"+ userId+"/event/"+eventId+"/invitation";	
	}
	
	
	@DeleteMapping("/user/{userId}/event/{eventId}/invitation/{invId}/guest/{guestId}/delete")
	public String deleteGuest(@PathVariable("userId") Long userId, 
									@PathVariable("invId") Long invId,
									@PathVariable("eventId") Long eventId,
									@PathVariable("guestId") Long guestId) {
		Event event = eventService.getEventById(eventId);
		Guest guest = guestService.getGuestById(guestId);
		if(guest.isConfirm()) {
			event.addTotalConfirm(-1);
		}
		event.addTotalGuests(-1);
		guestService.deleteGuest(guestId);
		return "redirect:/user/"+userId+"/event/"+eventId+"/invitation/edit";
		}
	
	
	@DeleteMapping("/user/{userId}/event/{eventId}/invitation/{invId}/delete")
	public String deleteInvitation(@PathVariable("userId") Long userId, 
									@PathVariable("invId") Long invId,
									@PathVariable("eventId") Long eventId) {
		Event event = eventService.getEventById(eventId);
		Invitation inv = invitationService.getInvitationById(invId);
		for(Guest guest : inv.getGuests()) {
			if(guest.isConfirm()) {
				event.addTotalConfirm(-1);
			}
			event.addTotalGuests(-1);
		}
		invitationService.deleteInvitation(invId);
		return "redirect:/user/"+userId+"/event/"+eventId+"/invitation/edit";
		}
	
	
	@DeleteMapping("/user/{userId}/event/{eventId}/location/{locId}/delete")
	public String deleteLocation(@PathVariable("userId") Long userId, 
									@PathVariable("eventId") Long eventId,
									@PathVariable("locId") Long locId) {
		locationService.deleteLocation(locId);
		return "redirect:/user/"+userId+"/event/"+eventId;
		}
	
	
	@DeleteMapping("/user/{userId}/event/{eventId}/bank/{bankId}/delete")
	public String deleteBank(@PathVariable("userId") Long userId, 
									@PathVariable("eventId") Long eventId,
									@PathVariable("bankId") Long bankId) {
		bankService.deleteBank(bankId);
		return "redirect:/user/"+userId+"/event/"+eventId;
		}
	
	
	@DeleteMapping("/user/{userId}/event/{eventId}/important/{impId}/delete")
	public String deleteImportant(@PathVariable("userId") Long userId, 
									@PathVariable("eventId") Long eventId,
									@PathVariable("impId") Long impId) {
		importantService.deleteImportant(impId);
		return "redirect:/user/"+userId+"/event/"+eventId;
		}
	
	
	//Edit Event
	@GetMapping("/user/{userId}/event/{eventId}/edit")
	public String editEvent(@PathVariable("userId") Long userId,@PathVariable("eventId") Long eventId,
							Model model, HttpSession sesion,
							@ModelAttribute("event") Event newEvent) {
		if(sesion.getAttribute("user_id") == null){
			return "redirect:/";
		}
		if(sesion.getAttribute("event_id") == null){
			return "redirect:/user/"+userId+"/create/event";
		}
		User user = userService.getUserById(userId);
		Event event = eventService.getEventById(eventId);
		model.addAttribute("event", event);
		model.addAttribute("user", user);
		return "userEditEvent.jsp";
	}
	
	
	//Update event data
	@PostMapping("/user/{userId}/event/{eventId}/edit")
	public String updateEvent(@Valid @ModelAttribute("event") Event newEvent,
							BindingResult validation, HttpSession sesion,
							@PathVariable("userId") Long userId, @PathVariable("eventId") Long eventId,
							Model model) {
		if (validation.hasErrors()) {
			User user = userService.getUserById(userId);
			model.addAttribute("user", user);
			return "userEditEvent.jsp";
			}
		newEvent.setId(eventId);
		eventService.updateEvent(newEvent);
	    return "redirect:/user/"+ userId+"/event/"+eventId;	
	}
	
	
	@DeleteMapping("/user/{userId}/event/{eventId}/delete")
	public String deleteEvent(@PathVariable("userId") Long userId, 
									@PathVariable("eventId") Long eventId) {
		eventService.deleteEvent(eventId);
		return "redirect:/user/"+userId+"/create/event";
		}
	
	
	public String generateCodigo(){
        String caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int longitud = 8;
        
        SecureRandom secureRandom = new SecureRandom();
        StringBuilder codigo = new StringBuilder(longitud);
        
        for (int i = 0; i < longitud; i++) {
            int index = secureRandom.nextInt(caracteres.length());
            codigo.append(caracteres.charAt(index));
        }
        
        return codigo.toString();
    }
}
