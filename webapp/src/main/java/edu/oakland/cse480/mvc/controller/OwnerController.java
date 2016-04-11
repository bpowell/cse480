package edu.oakland.cse480.mvc.controller;

import edu.oakland.cse480.service.UserService;
import edu.oakland.cse480.service.BusinessAndBarService;
import edu.oakland.cse480.service.AvailableDrinksService;
import edu.oakland.cse480.service.DrinkService;
import edu.oakland.cse480.service.IngredientService;
import edu.oakland.cse480.service.CategoriesService;
import edu.oakland.cse480.mvc.models.User;
import edu.oakland.cse480.mvc.models.Ingredient;
import edu.oakland.cse480.mvc.models.Hours;
import edu.oakland.cse480.mvc.models.Drink;
import edu.oakland.cse480.mvc.models.AvailableDrinks;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Map;
import java.util.Objects;
import java.util.List;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/owner")
public class OwnerController {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    UserService userService;

    @Autowired
    BusinessAndBarService businessAndBarService;

    @Autowired
    IngredientService ingredientService;

    @Autowired
    CategoriesService categoriesService;

    @Autowired
    AvailableDrinksService availableDrinksService;

    @Autowired
    DrinkService drinkService;

    /**
     * Sends the user to the main page.
     *
     * @param model
     * @return The index jsp page.
     */
    @RequestMapping("/")
    public String getIndex(Model model){
        return "owner/owner";
    }

    @RequestMapping("/addbartender")
    public String getAddBartender(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userdetails = (UserDetails) auth.getPrincipal();

        int ownerId = userService.getUserIdByEmail(userdetails.getUsername());
        model.addAttribute("users", userService.getAllStandardUsers());
        model.addAttribute("bars", businessAndBarService.getBarsByOwnerId(ownerId));
        return "owner/addbartender";
    }

    @RequestMapping(value = "/addbartender", method = RequestMethod.POST)
    public ModelAndView addBartender(@ModelAttribute("userId") int userId, @ModelAttribute("barId") int barId) {
        ModelAndView model = new ModelAndView();
        model.setViewName("owner/addbartender");

        if(!userService.updateRole(userId, 4)) {
            model.addObject("error", "Cannot update user");
            return model;
        }

        if(!userService.addBartender(userId, barId)) {
            model.addObject("error", "Cannot update user");
            return model;
        }

        model.addObject("success", "Success!");
        return model;
    }

    @RequestMapping("/removebartender")
    public String getRemoveBartender(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userdetails = (UserDetails) auth.getPrincipal();

        int ownerId = userService.getUserIdByEmail(userdetails.getUsername());
        List<User> bartenders = new ArrayList<User>();
        for(int bid : businessAndBarService.getBarsIdByOwnerId(ownerId)) {
            bartenders.addAll(userService.getAllBartendersByBarId(bid));
        }

        model.addAttribute("users", bartenders);

        return "owner/removebartender";
    }

    @RequestMapping(value = "/removebartender", method = RequestMethod.POST)
    public ModelAndView removeBartender(@ModelAttribute("userId") int userId) {
        ModelAndView model = new ModelAndView();
        model.setViewName("owner/removebartender");

        if(!userService.updateRole(userId, 5)) {
            model.addObject("error", "Cannot update user");
            return model;
        }

        if(!userService.removeBartender(userId)) {
            model.addObject("error", "Cannot update user");
            return model;
        }

        model.addObject("success", "Success!");
        return model;
    }

    @RequestMapping("/addingredient")
    public String getAddIngredient(Model model) {
        model.addAttribute("ingredients", ingredientService.getAllIngredients());
        model.addAttribute("categories", categoriesService.getAllCategories());
        return "owner/addingredient";
    }

    @RequestMapping(value = "/addingredient", method = RequestMethod.POST)
    public ModelAndView addBusiness(@ModelAttribute("addIngredient") @Valid Ingredient ingredient, BindingResult result) {
        ModelAndView model = new ModelAndView();
        model.setViewName("owner/addingredient");

        if(result.hasErrors()){
            model.addObject("ingredients", ingredientService.getAllIngredients());
            model.addObject("categories", categoriesService.getAllCategories());
            model.addObject("error", "Try again");
            return model;
        }

        if(!ingredientService.insertIngredient(ingredient)) {
            model.addObject("ingredients", ingredientService.getAllIngredients());
            model.addObject("categories", categoriesService.getAllCategories());
            model.addObject("error", "Cannot add ingredient, try again later");
            return model;
        }

        model.addObject("ingredients", ingredientService.getAllIngredients());
        model.addObject("categories", categoriesService.getAllCategories());
        model.addObject("success", "Success!");
        return model;
    }

    @RequestMapping("/updatehours")
    public String getUpdateHours(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userdetails = (UserDetails) auth.getPrincipal();

        int ownerId = userService.getUserIdByEmail(userdetails.getUsername());

        model.addAttribute("bars", businessAndBarService.getBarsByOwnerId(ownerId));
        return "owner/updatehours";
    }

    @RequestMapping(value = "/updatehours", method = RequestMethod.POST)
    public ModelAndView updateHours(@ModelAttribute("hours") @Valid Hours hours, BindingResult result) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userdetails = (UserDetails) auth.getPrincipal();

        int ownerId = userService.getUserIdByEmail(userdetails.getUsername());

        ModelAndView model = new ModelAndView();
        model.setViewName("owner/updatehours");

        if(result.hasErrors()) {
            model.addObject("bars", businessAndBarService.getBarsByOwnerId(ownerId));
            model.addObject("error", "Try again");
            return model;
        }

        if(!businessAndBarService.updateBarHoursById(hours)) {
            model.addObject("bars", businessAndBarService.getBarsByOwnerId(ownerId));
            model.addObject("error", "Try again");
            return model;
        }

        model.addObject("bars", businessAndBarService.getBarsByOwnerId(ownerId));
        model.addObject("success", "Hours Updated!");

        return model;
    }

    @RequestMapping("/adddrink")
    public String getAddDrink(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userdetails = (UserDetails) auth.getPrincipal();
        int ownerId = userService.getUserIdByEmail(userdetails.getUsername());
        int role_id = userService.getUserRoleIdByEmail(userdetails.getUsername());
        if(role_id==1) {
            model.addAttribute("error", "Please sign in as the Bar Owner");
            return "owner/adddrink";
        }
        if(role_id==2) {
            int barId = businessAndBarService.getBarsByOwnerId(ownerId).get(0).getId();
            model.addAttribute("barId", barId);
        }

        model.addAttribute("ingredients", ingredientService.getAllIngredients());
        return "owner/adddrink";
    }

    @RequestMapping(value = "/adddrink", method = RequestMethod.POST)
    public ModelAndView addDrink(@ModelAttribute("addDrink") @Valid Drink drink, @ModelAttribute("i1") int i1, @ModelAttribute("i2") int i2, @ModelAttribute("i3") int i3, BindingResult result) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userdetails = (UserDetails) auth.getPrincipal();
        int ownerId = userService.getUserIdByEmail(userdetails.getUsername());
        int role_id = userService.getUserRoleIdByEmail(userdetails.getUsername());
        int barId = 0;
        ModelAndView model = new ModelAndView();
        model.setViewName("owner/adddrink");
        if(role_id==1) {
            model.addObject("error", "Please sign in as the Bar Owner");
        }
        if(role_id==2) {
            barId = businessAndBarService.getBarsByOwnerId(ownerId).get(0).getId();
            model.addObject("barId", barId);
        }
        model.addObject("ingredients", ingredientService.getAllIngredients());

        if(result.hasErrors()) {
            model.addObject("error", "Try again");
            return model;
        }

        List<Ingredient> ingredients = new ArrayList<Ingredient>();
        if(i1>0) {
            ingredients.addAll(ingredientService.getIngredientById(i1));
        }
        if(i2>0) {
            ingredients.addAll(ingredientService.getIngredientById(i2));
        }
        if(i3>0) {
            ingredients.addAll(ingredientService.getIngredientById(i3));
        }

        if(ingredients.size()==0) {
            model.addObject("error", "Try again");
            return model;
        }

        drink.setIngredients(ingredients);
        int drinkId = drinkService.insertDrink(drink);
        if(drinkId==0) {
            model.addObject("error", "Try again");
            return model;
        }

        AvailableDrinks a = new AvailableDrinks();
        a.setDrinkId(drinkId);
        a.setBarId(barId);
        a.setPrice(drink.getPrice());

        if(!availableDrinksService.insertAvailableDrink(a)) {
            model.addObject("error", "Try again");
            return model;
        }

        model.addObject("success", "Drink has been added!");
        return model;
    }
}
