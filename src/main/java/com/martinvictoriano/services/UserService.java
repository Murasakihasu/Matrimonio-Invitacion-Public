package com.martinvictoriano.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.martinvictoriano.models.LoginUser;
import com.martinvictoriano.models.User;
import com.martinvictoriano.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private final UserRepository userRepository;
	
	//Constructor
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
		}
	
	
	//Pick all the users
	public List<User> allUsers() {
		return userRepository.findAll();
		}
			
	
	//Create an user
	public User createUser(User newUser) {
		String cryptPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(cryptPassword);
		return userRepository.save(newUser);
		}
	
	
	//Find an user by id
	public User getUserById(Long id) {
		Optional<User> optionalUser = userRepository.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
			} 
		else {
			return null;
			}
		}
		
	
	//add Invitation to user
	public User updateList(User newUser) {
		User existingUser = getUserById(newUser.getId());
		existingUser.setInvitations(newUser.getInvitations());
		System.out.println("objeto siendo agregado a newuser"+newUser.getInvitations().size());
		System.out.println("objeto siendo agregado a existinguser"+existingUser.getInvitations().size());
		return userRepository.save(existingUser);
		}
	
	
	//Find by email
	public User getUserByEmail(String email) {
		return userRepository.getByEmail(email);
	}
		

	//Register Validations
	public BindingResult validateRegister(BindingResult validation, User user) {
		if(!user.getPassword().equals(user.getConfirmPassword())) {
			validation.rejectValue("confirmPassword", "NoCoinciden", "Las contraseñas no coinciden.");
			}
		if(getUserByEmail(user.getEmail()) != null) {
			validation.rejectValue("email", "Existente", "Este correo ya está en uso!");
		}
		return validation;
		}
	
	
	//Login Validations
	public BindingResult validateLogin(BindingResult validation, LoginUser loginUser) {
		User actualUser = getUserByEmail(loginUser.getLoginEmail());
		if(actualUser == null) {
			validation.rejectValue("loginEmail", "NoExistente", "Este usuario no existe");
			}
		else if(! BCrypt.checkpw(loginUser.getLoginPassword(), actualUser.getPassword())) {
			validation.rejectValue("loginPassword", "NoExistente", "Credenciales no validas");
			}
		return validation;
		}
	}