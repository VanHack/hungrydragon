package com.dragons.hungrydragon.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Fahad Ahmed
 */
@Controller
@RequestMapping(path = "/auth/*")
public class AuthController {

    @GetMapping(value = "/login")
    public String showLogin(){
        return "login";
    }

    @GetMapping(value = "/logout")
    public String showLogout(){
        return "/";
    }
}
