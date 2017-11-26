package com.dragons.hungrydragon.controllers;

import com.dragons.hungrydragon.dao.FoodSuggestionRepository;
import com.dragons.hungrydragon.dao.MenuItemRepository;
import com.dragons.hungrydragon.models.FoodSuggestion;
import com.dragons.hungrydragon.models.MenuItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author Fahad Ahmed
 */
@Controller
public class SuggestionController {

    @Autowired
    private FoodSuggestionRepository foodSuggestionRepository;

    @Autowired
    private MenuItemRepository menuItemRepository;

    @GetMapping(path = "/suggest", produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<MenuItem> getSuggestions() {
        Date now = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

        //List<String> suggestedTypes = foodSuggestionRepository.findTypes(dayOfWeek, 5.0f);
        List<String> suggestedTypes = foodSuggestionRepository.findTypes(dayOfWeek);
        List<MenuItem> menuItems = menuItemRepository.findByType(suggestedTypes);

        return menuItems;
    }
}
