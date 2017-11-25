package com.dragons.hungrydragon.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Fahad Ahmed
 */
@Controller
@RequestMapping(path = "/register/*")
public class RegistrationController {

    @GetMapping(value = "/user")
    public String showRegisterUser(){
        return "register-user";
    }

    @GetMapping(value = "/restaurant")
    public String showRegisterRestaurant(){
        return "register-restaurant";
    }

}
