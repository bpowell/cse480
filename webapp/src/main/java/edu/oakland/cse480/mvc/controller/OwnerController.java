package edu.oakland.cse480.mvc.controller;

import edu.oakland.cse480.service.UserService;
import edu.oakland.cse480.service.BusinessAndBarService;
import edu.oakland.cse480.mvc.models.User;
import edu.oakland.cse480.mvc.models.Hours;

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
        model.addObject("success", hours.getSundayHours());

        return model;
    }
}
