package edu.oakland.cse480.mvc.controller;

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

import edu.oakland.cse480.service.UserService;
import edu.oakland.cse480.service.RoleService;

/**
 * Handles the initial web page loading.
 */
@Controller
@RequestMapping("/admin")
public class AdminContoller {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;

    /**
     * Sends the user to the main page.
     *
     * @param model
     * @return The index jsp page.
     */
    @RequestMapping("/")
    public String getIndex(Model model){
        return "admin/admin";
    }

    @RequestMapping(value = "/addbusiness", method = RequestMethod.GET)
    public String getAddBusiness() {
        return "admin/addbusiness";
    }

    @RequestMapping(value = "/changeroles", method = RequestMethod.GET)
    public String getChangeRoles(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        model.addAttribute("roles", roleService.getAllRoles());
        return "admin/changeroles";
    }

    @RequestMapping(value = "/changeroles", method = RequestMethod.POST)
    public ModelAndView changeRoles(@ModelAttribute("userId") int userId, @ModelAttribute("roleId") int roleId, BindingResult result) {
        ModelAndView model = new ModelAndView();
        model.setViewName("admin/changeroles");

        model.addObject("users", userService.getAllUsers());
        model.addObject("roles", roleService.getAllRoles());

        if(result.hasErrors()) {
            model.addObject("error", "Problem");
            return model;
        }

        if( (userId <= 0) || (roleId <= 0) ) {
            model.addObject("error", "Problem");
            return model;
        }

        if(!userService.updateRole(userId, roleId)) {
            model.addObject("error", "Problem");
            return model;
        }

        model.addObject("users", userService.getAllUsers());
        model.addObject("roles", roleService.getAllRoles());

        model.addObject("success", "Success!");
        return model;
    }
}
