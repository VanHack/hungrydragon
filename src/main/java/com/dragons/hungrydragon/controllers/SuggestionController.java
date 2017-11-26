package com.dragons.hungrydragon.controllers;

import com.dragons.hungrydragon.dao.FoodSuggestionRepository;
import com.dragons.hungrydragon.models.FoodSuggestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Fahad Ahmed
 */
@Controller
@RequestMapping(path = "/suggest")
public class SuggestionController {

    @Autowired
    private FoodSuggestionRepository foodSuggestionRepository;

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<FoodSuggestion> getSuggestions(){
        return foodSuggestionRepository.findAll();
    }
}
