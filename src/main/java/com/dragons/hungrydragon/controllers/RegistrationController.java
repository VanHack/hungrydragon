package com.dragons.hungrydragon.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author Fahad Ahmed
 */
@Controller
@RequestMapping(path = "/register/*")
public class RegistrationController {

    @RequestMapping(value = "/postuser", method = RequestMethod.POST)
    public String saveNewUser( @RequestParam("first_name") String first_name, @RequestParam("last_name") String last_name, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("address") String address, @RequestParam("email") String email ) {
	System.out.println("SpringTesting! " + first_name + " " + last_name + "," + username + ":" + password + ";" + address + "," + email);
	return "home";
    }


    @RequestMapping(value = "/postrestaurant", method = RequestMethod.POST)
    public String saveNewRestaurant( @RequestParam("name") String name, @RequestParam("address") String address, @RequestParam("latitude") Double latitude, @RequestParam("longitude") Double longitude ) {
	System.out.println("SpringTesting! " + name + ";" + address + ";" + latitude + "," + longitude);
	return "home";
    }


    @GetMapping(value = "/user")
    public String showRegisterUser(){
        return "register-user";
    }

    @GetMapping(value = "/restaurant")
    public String showRegisterRestaurant(){
        return "register-restaurant";
    }

}
