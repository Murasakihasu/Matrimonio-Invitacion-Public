package com.martinvictoriano.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

import com.martinvictoriano.models.Event;
import com.martinvictoriano.models.Guest;
import com.martinvictoriano.services.EventService;
import com.martinvictoriano.services.GuestService;
import com.martinvictoriano.services.InvitationService;
import com.martinvictoriano.services.UserService;

@Controller
public class GuestController {
	@Autowired
	private final UserService userService;
	@Autowired
	private final GuestService guestService;
	@Autowired
	private final InvitationService invitationService;
	@Autowired
	private final EventService eventService;

	//Constructor
	public GuestController(UserService userService, GuestService guestService,
							InvitationService invitationService, EventService eventService){
		this.userService = userService;
		this.guestService = guestService;
		this.invitationService = invitationService;
		this.eventService = eventService;
		}
	
	
	@GetMapping("/InvitationSend/{userId}/event/{eventId}/Invitation/{codigo}")
	public String guestInvitation(@PathVariable("userId") Long userId, @PathVariable("codigo") String codigo,
									Model model, @PathVariable("eventId") Long eventId) {
		model.addAttribute("user", userService.getUserById(userId));
		model.addAttribute("event", eventService.getEventById(eventId));
		model.addAttribute("inv", invitationService.getInvitationByCodigo(codigo));
		return "guestInvitation.jsp";
		}
	
		
	@GetMapping("/InvitationSend/{userId}/event/{eventId}/Invitation/{codigo}/confirm")
	public String confirm(@PathVariable("userId") Long userId, @PathVariable("codigo") String codigo,
							Model model, @PathVariable("eventId") Long eventId) {
		model.addAttribute("user", userService.getUserById(userId));
		model.addAttribute("event", eventService.getEventById(eventId));
		model.addAttribute("inv", invitationService.getInvitationByCodigo(codigo));
		return "guestConfirm.jsp";
		}
	
	
	@PutMapping("/InvitationSend/{userId}/event/{eventId}/Invitation/{codigo}/confirm/{guestId}")
	public String confirmGuest(@PathVariable("userId") Long userId, @PathVariable("codigo") String codigo,
								Model model, @PathVariable("eventId") Long eventId,
								@PathVariable("guestId") Long guestId) {
		Guest guest = guestService.getGuestById(guestId);
		Event event = eventService.getEventById(eventId);
		event.addTotalConfirm(1);
		guest.setConfirm(true);
		guestService.updateConfirm(guest);
		return "redirect:/InvitationSend/"+userId+"/event/"+eventId+"/Invitation/"+codigo+"/confirm";
	}
	
	
	@DeleteMapping("/InvitationSend/{userId}/event/{eventId}/Invitation/{codigo}/delete/confirm/{guestId}")
	public String deleteConfirmGuest(@PathVariable("userId") Long userId, @PathVariable("codigo") String codigo,
								Model model, @PathVariable("eventId") Long eventId,
								@PathVariable("guestId") Long guestId) {
		Guest guest = guestService.getGuestById(guestId);
		Event event = eventService.getEventById(eventId);
		event.addTotalConfirm(-1);
		guest.setConfirm(false);
		guestService.updateConfirm(guest);
		return "redirect:/InvitationSend/"+userId+"/event/"+eventId+"/Invitation/"+codigo+"/confirm";
	}
	
	
	@GetMapping("/InvitationSend/{userId}/event/{eventId}/Invitation/{codigo}/location")
	public String location(@PathVariable("userId") Long userId, @PathVariable("codigo") String codigo,
							Model model, @PathVariable("eventId") Long eventId) {
		Event event = eventService.getEventById(eventId);
		model.addAttribute("user", userService.getUserById(userId));
		model.addAttribute("event", event);
		model.addAttribute("inv", invitationService.getInvitationByCodigo(codigo));
		return "guestLocation.jsp";
		}
	
	
	@GetMapping("/InvitationSend/{userId}/event/{eventId}/Invitation/{codigo}/photos")
	public String photos(@PathVariable("userId") Long userId, @PathVariable("codigo") String codigo,
						Model model, @PathVariable("eventId") Long eventId) {
		model.addAttribute("user", userService.getUserById(userId));
		model.addAttribute("event", eventService.getEventById(eventId));
		model.addAttribute("inv", invitationService.getInvitationByCodigo(codigo));
		return "guestPhotos.jsp";
		}
	
	
	@GetMapping("/InvitationSend/{userId}/event/{eventId}/Invitation/{codigo}/gifts")
	public String gifts(@PathVariable("userId") Long userId, @PathVariable("codigo") String codigo,
						Model model, @PathVariable("eventId") Long eventId) {
		model.addAttribute("user", userService.getUserById(userId));
		model.addAttribute("event", eventService.getEventById(eventId));
		model.addAttribute("inv", invitationService.getInvitationByCodigo(codigo));
		return "guestGifts.jsp";
		}
	
	
	@GetMapping("/InvitationSend/{userId}/event/{eventId}/Invitation/{codigo}/important")
	public String important(@PathVariable("userId") Long userId, @PathVariable("codigo") String codigo,
							Model model, @PathVariable("eventId") Long eventId) {
		model.addAttribute("user", userService.getUserById(userId));
		model.addAttribute("event", eventService.getEventById(eventId));
		model.addAttribute("inv", invitationService.getInvitationByCodigo(codigo));
		return "guestImportant.jsp";
		}
	

}
