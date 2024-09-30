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
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@Size(min=3, max=200, message="Tu nombre es demasiado corto")
	private String name;
	
	@NotBlank(message="Proporciona un correo")
	@Email(message="Por favor proporciona un correo válido")
	private String email;
	
	@Email(message="Por favor proporciona un correo válido")
	private String email2;
	
	@NotBlank(message="Proporciona una cotraseña")
	private String password;
	
	@NotBlank(message="Debes confirmar tu contraseña")
	@Transient
	private String confirmPassword;
	
	@OneToOne(mappedBy="user")
	private Event event;
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Invitation> invitations;
	
	
	//Constructor
	public User() {}	
	
	
	
	//Creation and update
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}


	
	//Getters and Setters
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getEmail2() {
		return email2;
	}


	public void setEmail2(String email2) {
		this.email2 = email2;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getConfirmPassword() {
		return confirmPassword;
	}


	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}



	public List<Invitation> getInvitations() {
		return invitations;
	}



	public void setInvitations(List<Invitation> invitation) {
		this.invitations = invitation;
	}



	public Event getEvent() {
		return event;
	}



	public void setEvent(Event event) {
		this.event = event;
	}
	
	
	
	
}