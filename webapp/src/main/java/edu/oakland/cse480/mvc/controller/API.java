package edu.oakland.cse480.mvc.controller;

import edu.oakland.cse480.mvc.models.Drink;
import edu.oakland.cse480.service.DrinkService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/api")
public class API {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private DrinkService drinkService;

    @RequestMapping(value = "/drinklist/{barId}", method = RequestMethod.GET)
    public @ResponseBody List<Drink> getDrinkList(@PathVariable int barId) {
        return drinkService.getDrinksByBarId(barId);
    }
}
