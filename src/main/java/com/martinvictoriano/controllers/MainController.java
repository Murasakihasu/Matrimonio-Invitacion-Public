package com.martinvictoriano.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.NoHandlerFoundException;

@Controller
public class MainController implements org.springframework.boot.web.servlet.error.ErrorController {

    @GetMapping("/error")
    public String handleError(NoHandlerFoundException ex) {
        // Redirige a la página principal cuando ocurre un error 404
        return "redirect:/";
    }

}
