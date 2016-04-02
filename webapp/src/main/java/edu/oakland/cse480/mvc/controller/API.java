package edu.oakland.cse480.mvc.controller;

import edu.oakland.cse480.mvc.models.Drink;
import edu.oakland.cse480.mvc.models.AvailableDrinks;
import edu.oakland.cse480.mvc.models.BarDrinkOrder;
import edu.oakland.cse480.service.DrinkService;
import edu.oakland.cse480.service.BarDrinkOrderService;
import edu.oakland.cse480.service.IngredientService;
import edu.oakland.cse480.service.AvailableDrinksService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

import java.sql.Timestamp;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/api")
public class API {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private IngredientService ingredientService;

    @Autowired
    private DrinkService drinkService;

    @Autowired
    private AvailableDrinksService availableDrinksService;

    @Autowired
    private BarDrinkOrderService barDrinkOrderService;

    @RequestMapping(value = "/drinklist/{barId}", method = RequestMethod.GET)
    public @ResponseBody List<Drink> getDrinkList(@PathVariable int barId) {
        List<Drink> drinks = drinkService.getDrinksByBarId(barId);
        for(Drink drink : drinks) {
            drink.setIngredients(ingredientService.getIngredientsByDrinkId(drink.getId()));
        }

        return drinks;
    }

    @RequestMapping(value = "/alldrinks", method = RequestMethod.GET)
    public @ResponseBody List<Drink> getAllDrinks() {
        List<Drink> drinks = drinkService.getAllDrinks();
        for(Drink drink : drinks) {
            drink.setIngredients(ingredientService.getIngredientsByDrinkId(drink.getId()));
        }

        return drinks;
    }

    @RequestMapping(value = "/adddrink", method = RequestMethod.POST)
    public ResponseEntity addDrink(@ModelAttribute("drinkId") int drinkId, @ModelAttribute("barId") int barId) {
        AvailableDrinks a = new AvailableDrinks();
        a.setDrinkId(drinkId);
        a.setBarId(barId);

        if(!availableDrinksService.insertAvailableDrink(a)) {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value = "/removedrink", method = RequestMethod.POST)
    public ResponseEntity removeDrink(@ModelAttribute("drinkId") int drinkId, @ModelAttribute("barId") int barId) {
        AvailableDrinks a = new AvailableDrinks();
        a.setDrinkId(drinkId);
        a.setBarId(barId);

        if(!availableDrinksService.deleteAvailableDrinkByDrinkId(a)) {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(HttpStatus.OK);
    }

    @RequestMapping(value = "/orderdrink", method = RequestMethod.POST)
    public ResponseEntity orderDrink(@ModelAttribute("drinkId") int drinkId, @ModelAttribute("userId") int userId, @ModelAttribute("barId") int barId, @ModelAttribute("comments") String comments) {
        log.error("{}", drinkId);
        log.error("{}", userId);
        log.error("{}", barId);
        log.error("{}", comments);

        BarDrinkOrder order = new BarDrinkOrder();
        order.setDrinkId(drinkId);
        order.setBarId(barId);
        order.setUserId(userId);
        order.setComments(comments);
        order.setDrinkCount(1);
        order.setTimePlaced(new Timestamp(System.currentTimeMillis()));

        if(!barDrinkOrderService.placeOrder(order)) {
            //Failed to insert drink order
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(HttpStatus.OK);
    }
}
