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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="invitations")
public class Invitation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private Date updatedAt;
	
	@Size(min=3, max=200, message="El nombre de la invitación es demasiado corto")
	private String title;
	
	private String codigo;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_user")
	private User user;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_event")
	private Event event;
	
	@OneToMany(mappedBy="invitation", fetch=FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Guest> guests; 
	
	//Constructor
	public Invitation() {}
		
	
	
	//Creation and update
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}


	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}
	
	public void addId(Integer id) {
		this.id += id;
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



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public List<Guest> getGuests() {
		return guests;
	}



	public void setGuests(List<Guest> guests) {
		this.guests = guests;
	}



	public Event getEvent() {
		return event;
	}



	public void setEvent(Event event) {
		this.event = event;
	}



	public String getCodigo() {
		return codigo;
	}



	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	

}