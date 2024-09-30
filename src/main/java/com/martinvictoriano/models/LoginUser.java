package com.martinvictoriano.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public class LoginUser {
	@NotBlank(message="Por favor rellena los campos!")
	@Email(message="Por favor proporciona un correo válido")
	private String loginEmail;
	@NotBlank(message="Por favor rellena los campos!")
	private String loginPassword;
	
	//Constructor
	public LoginUser() {}
	
	
	//Getters and Setters
	public String getLoginEmail() {
		return loginEmail;
	}


	public void setLoginEmail(String loginEmail) {
		this.loginEmail = loginEmail;
	}


	public String getLoginPassword() {
		return loginPassword;
	}


	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
}