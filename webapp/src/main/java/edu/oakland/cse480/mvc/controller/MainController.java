package edu.oakland.cse480.mvc.controller;

import edu.oakland.cse480.mvc.models.User;
import edu.oakland.cse480.service.UserService;
import edu.oakland.cse480.service.BusinessAndBarService;

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

    /**
     * Sends the user to the main page.
     *
     * @param model
     * @return The index jsp page.
     */
    @RequestMapping("/")
    public String getIndex(Model model){
        log.trace("MainController -> Entering getIndex(model=)");
        log.trace("MainController -> Leaving getIndex(): index");
        return "index";
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
            model.addObject("username", userDetail.getUsername());
        }

        model.setViewName("profile");
        return model;
    }

    @RequestMapping(value = "/profile/{username}", method = RequestMethod.GET)
    public ModelAndView publicProfiles(@PathVariable("username") String username) {
        ModelAndView model = new ModelAndView();
        model.addObject("username", username);
        model.setViewName("profile");
        return model;
    }

    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public String display() {
        return "display";
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

        model.setViewName("index");

        return model;
    }

    @RequestMapping(value = "/barview", method = RequestMethod.GET)
    public ModelAndView barview() {
        ModelAndView model = new ModelAndView();
        model.addObject("businesses", businessAndBarService.getAllBusinessAndBars());
        model.setViewName("barview");

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
}
