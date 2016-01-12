package edu.oakland.cse480.mvc.controller;

import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Handles the initial web page loading.
 */
@Controller
public class MainController{
    protected final Logger log = LoggerFactory.getLogger(getClass());

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

}
