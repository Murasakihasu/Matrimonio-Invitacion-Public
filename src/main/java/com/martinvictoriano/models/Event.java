package com.martinvictoriano.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name="events")
public class Event {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@NotBlank(message="Debes elegir un título para tu evento")
	private String name;
	
	@NotNull(message="¿Cuándo es el evento?")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date;
	
	@NotNull(message="¿A qué hora comienza tu evento?")
	@DateTimeFormat(pattern="HH:mm")
	private Date start;
	
	@DateTimeFormat(pattern="HH:mm")
	private Date end;
	
	@NotBlank(message="¿Dónde pueden acceder a las fotos tus invitados?")
	private String photos;
	
	@NotBlank(message="¿Cual es la tématica de regalo que esperas?")
	private String giftsType;
	
	private String gifts;
	
	private Integer totalConfirm=0;
	private Integer totalGuests=0;
	
	@OneToOne
	@JoinColumn(name="id_user")
	private User user;
	
	@OneToOne(mappedBy="event")
	private Bank bank;
	
	@OneToMany(mappedBy="event", fetch=FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Invitation> invitations;
	
	@OneToMany(mappedBy="event", fetch=FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Important> important;
	
	@OneToMany(mappedBy="event", fetch=FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Location> location;
	
	
	//Constructor
	public Event() {}
	
	
	public Integer getTotalConfirm() {
		return totalConfirm;
	}

	public void setTotalConfirm(Integer totalConfirm) {
		this.totalConfirm = totalConfirm;
	}
	
	public void addTotalConfirm(Integer totalConfirm) {
		this.totalConfirm += totalConfirm;
	}

	public Integer getTotalGuests() {
		return totalGuests;
	}
	
	public void setTotalGuests(Integer totalGuests) {
		this.totalGuests = totalGuests;
	}
	
	public void addTotalGuests(Integer totalGuests) {
		this.totalGuests += totalGuests;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public String getPhotos() {
		return photos;
	}


	public void setPhotos(String photos) {
		this.photos = photos;
	}


	public String getGifts() {
		return gifts;
	}


	public void setGifts(String gifts) {
		this.gifts = gifts;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public List<Invitation> getInvitations() {
		return invitations;
	}


	public void setInvitations(List<Invitation> invitations) {
		this.invitations = invitations;
	}


	public List<Important> getImportant() {
		return important;
	}


	public void setImportant(List<Important> important) {
		this.important = important;
	}


	public Date getStart() {
		return start;
	}


	public void setStart(Date start) {
		this.start = start;
	}


	public Date getEnd() {
		return end;
	}


	public void setEnd(Date end) {
		this.end = end;
	}


	public String getGiftsType() {
		return giftsType;
	}


	public void setGiftsType(String giftsType) {
		this.giftsType = giftsType;
	}


	public List<Location> getLocation() {
		return location;
	}


	public void setLocation(List<Location> location) {
		this.location = location;
	}


	public Bank getBank() {
		return bank;
	}


	public void setBank(Bank bank) {
		this.bank = bank;
	}
	
	
	
}
