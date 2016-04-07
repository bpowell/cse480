package edu.oakland.cse480.mvc.controller;

import edu.oakland.cse480.mvc.models.User;
import edu.oakland.cse480.mvc.models.Drink;
import edu.oakland.cse480.mvc.models.BarDrinkOrder;
import edu.oakland.cse480.service.UserService;
import edu.oakland.cse480.service.BusinessAndBarService;
import edu.oakland.cse480.service.AvailableDrinksService;
import edu.oakland.cse480.service.BarDrinkOrderService;
import edu.oakland.cse480.service.IngredientService;

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
import java.util.List;
import java.util.Objects;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Handles the initial web page loading.
 */
@Controller
public class MainController{
    protected final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    UserService us;

    @Autowired
    private BusinessAndBarService businessAndBarService;

    @Autowired
    private AvailableDrinksService availableDrinksService;

    @Autowired
    private BarDrinkOrderService barDrinkOrderService;

    @Autowired
    private IngredientService ingredientService;

    /**
     * Sends the user to the main page.
     *
     * @param model
     * @return The index jsp page.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getIndex(){
        ModelAndView model = new ModelAndView();
        log.trace("MainController -> Entering getIndex(model=)");
        log.trace("MainController -> Leaving getIndex(): index");
        model.setViewName("welcome");
        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username or password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");

        return model;
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile() {
        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            String email = userDetail.getUsername();
            model.addObject("email", email);
            model.addObject("username", us.getUsernameByEmail(email));
            model.addObject("drinks", barDrinkOrderService.getFiveDrinksByEmail(email));
            model.addObject("business", businessAndBarService.getFiveBarsByEmail(email));
        }

        model.setViewName("profile");
        return model;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView doRegister(@ModelAttribute("registerNewUser") @Valid User registerNewUser, BindingResult result) {
        ModelAndView model = new ModelAndView();

        if(result.hasErrors()){
            model.addObject("error", "Error on registering");
            model.setViewName("register");
            return model;
        }

        if(!Objects.equals(registerNewUser.getPassword(), registerNewUser.getPasswordConfirm())) {
            model.addObject("error", "Passwords do not match");
            model.setViewName("register");
            return model;
        }

        //Check if user is already registered
        if(us.userExists(registerNewUser.getName())) {
            model.addObject("error", "Username already taken");
            model.setViewName("register");
            return model;
        }

        us.insertUser(registerNewUser, "ROLE_USER");

        model.setViewName("login");

        return model;
    }

    @RequestMapping(value = "/changepassword", method = RequestMethod.GET)
    public String changePassword() {
        return "changepassword";
    }

    @RequestMapping(value = "/changepassword", method = RequestMethod.POST)
    public ModelAndView doChangePassword(@ModelAttribute("changepassword") @Valid User user, @ModelAttribute("currentpassword") String currentPassword, BindingResult result) {
        ModelAndView model = new ModelAndView();
        model.setViewName("changepassword");

        if(result.hasErrors()){
            model.addObject("error", "Error on registering");
            return model;
        }

        if(!Objects.equals(user.getPassword(), user.getPasswordConfirm())) {
            model.addObject("error", "Passwords do not match");
            return model;
        }

        if(!us.verifyUser(user.getEmail(), currentPassword)) {
            model.addObject("error", "Invalid username or password");
            return model;
        }

        if(!us.updatePassword(user.getEmail(), user.getPassword())) {
            model.addObject("error", "Cannot reset password at this time");
            return model;
        }

        model.addObject("success", "Success!");
        return model;
    }

    @RequestMapping(value = "/barview", method = RequestMethod.GET)
    public ModelAndView barview() {
        ModelAndView model = new ModelAndView();
        model.addObject("businesses", businessAndBarService.getAllBusinessAndBars());
        model.setViewName("barview");

        return model;
    }

    @RequestMapping(value = "/barview", method = RequestMethod.POST)
    public ModelAndView postBarview(@ModelAttribute("barName") String barName) {
        if(Objects.equals(barName, "")) {
            return barview();
        }

        ModelAndView model = new ModelAndView();
        model.addObject("businesses", businessAndBarService.getBusinessAndBarsByName(barName));
        model.addObject("clearSearch", true);
        model.setViewName("barview");

        return model;
    }

    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public ModelAndView display() {
        return barview();
    }

    @RequestMapping(value = "/display/{bar_id}", method = RequestMethod.GET)
    public ModelAndView displayBar(@PathVariable("bar_id") Integer bar_id) {
        int userId = 0;
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userdetails = (UserDetails) auth.getPrincipal();
            userId = us.getUserIdByEmail(userdetails.getUsername());
        } catch(Exception e) {
        }

        ModelAndView model = new ModelAndView();
        List<BarDrinkOrder> orders = barDrinkOrderService.getDrinkOrdersByBarId(bar_id);
        for(BarDrinkOrder order : orders) {
            order.setIngredients(ingredientService.getIngredientsByDrinkId(order.getDrinkId()));
        }
        model.addObject("queue", orders);
        model.addObject("canClear", us.isUserABartenderOrOwner(bar_id, userId));
        model.addObject("userId", userId);
        model.addObject("barId", bar_id);
        model.setViewName("display");
        return model;
    }

    @RequestMapping(value = "/drinklist", method = RequestMethod.GET)
    public ModelAndView drinklist() {
        return barview();
    }

    @RequestMapping(value = "/drinklist/{bar_id}", method = RequestMethod.GET)
    public ModelAndView barDrinklist(@PathVariable("bar_id") Integer bar_id) {
        int userId = 0;
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userdetails = (UserDetails) auth.getPrincipal();
            userId = us.getUserIdByEmail(userdetails.getUsername());
        } catch(Exception e) {
        }

        ModelAndView model = new ModelAndView();
        List<BarDrinkOrder> orders = barDrinkOrderService.getThreeDrinkOrdersByBarId(bar_id);
        for(BarDrinkOrder order : orders) {
            order.setIngredients(ingredientService.getIngredientsByDrinkId(order.getDrinkId()));
        }
        model.addObject("queue", orders);
        model.addObject("barId", bar_id);
        model.addObject("userId", userId);
        model.setViewName("drinklist");
        return model;
    }

    private String writeListToJsonArray(List<Drink> list) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

        mapper.writeValue(out, list);

        return out.toString();
    }

    @RequestMapping(value = "/drinklist/{bar_id}", method = RequestMethod.POST)
    public ModelAndView postBarDrinklist(@PathVariable("bar_id") Integer bar_id, @ModelAttribute("drinkName") String drinkName) {
        if(Objects.equals(drinkName, "")) {
            return barDrinklist(bar_id);
        }

        int userId = 0;
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            UserDetails userdetails = (UserDetails) auth.getPrincipal();
            userId = us.getUserIdByEmail(userdetails.getUsername());
        } catch(Exception e) {
        }

        List<Drink> drinks = availableDrinksService.getDrinksByBarIdAndDrinkName(bar_id, drinkName);
        for(Drink drink : drinks) {
            drink.setIngredients(ingredientService.getIngredientsByDrinkId(drink.getId()));
        }

        ModelAndView model = new ModelAndView();
        List<BarDrinkOrder> orders = barDrinkOrderService.getThreeDrinkOrdersByBarId(bar_id);
        for(BarDrinkOrder order : orders) {
            order.setIngredients(ingredientService.getIngredientsByDrinkId(order.getDrinkId()));
        }
        model.addObject("queue", orders);
        model.addObject("clearSearch", true);

        try {
            model.addObject("drinks", writeListToJsonArray(drinks));
        } catch(Exception e) {
        }

        model.addObject("barId", bar_id);
        model.addObject("userId", userId);
        model.setViewName("drinklist");
        return model;
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public ModelAndView welcome() {
        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            model.addObject("username", userDetail.getUsername());
        }

        model.setViewName("welcome");
        return model;
    }
    @RequestMapping(value="/error/404", method = RequestMethod.GET)
    public String error404(){
        return "error/404";
    }
}
