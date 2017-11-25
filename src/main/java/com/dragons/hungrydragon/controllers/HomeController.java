package com.dragons.hungrydragon.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Fahad Ahmed
 */
@Controller

public class HomeController {

    @GetMapping(value = "/")
    public String show(){
        return "home";
    }
}
