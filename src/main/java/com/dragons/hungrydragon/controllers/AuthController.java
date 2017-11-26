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
@RequestMapping(path = "/auth/*")
public class AuthController {

    @RequestMapping(value = "/postlogin", method = RequestMethod.POST)
    public String saveNewJson( @RequestParam("username") String username, @RequestParam("password") String password ) {
	System.out.println("SpringTesting! " + username + ":" + password);
	return "home";
    }


    @GetMapping(value = "/login")
    public String showLogin(){
        return "login";
    }

    @GetMapping(value = "/logout")
    public String showLogout(){
        return "logout";
    }
}
