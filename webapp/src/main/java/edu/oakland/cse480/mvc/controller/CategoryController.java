package edu.oakland.cse480.mvc.controller;

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

import java.util.Map;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import edu.oakland.cse480.mvc.models.Categories;
import edu.oakland.cse480.service.CategoriesService;

/**
 * Handles the initial web page loading.
 */
@Controller
@RequestMapping("/category")
public class CategoryController {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    CategoriesService cs;

    @RequestMapping("/index")
    public String category() {
            return "category";
    }

    @RequestMapping("/all")
    public ModelAndView all() {
        ModelAndView model = new ModelAndView();
        List<Categories>  allCategories = cs.getAllCategories();

        model.addObject("caterories", allCategories);
        model.setViewName("all");

        return model;
    }

    @RequestMapping(value = "/byId", method = RequestMethod.POST)
    public ModelAndView byId(ModelAndView model, @RequestParam("id") int id) {
        List<Categories>  byIdCatergories = cs.getCategoryById(id);

        model.addObject("caterories", byIdCatergories);
        model.setViewName("all");

        return model;
    }

    @RequestMapping(value = "/byName", method = RequestMethod.POST)
    public ModelAndView byName(ModelAndView model, @RequestParam("name") String name) {
        List<Categories>  byNameCatergories = cs.getCategoryByName(name);

        model.addObject("caterories", byNameCatergories);
        model.setViewName("all");

        return model;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String byName(ModelAndView model, @RequestParam("name") String name, @RequestParam("description") String description) {
        Categories c = new Categories();
        c.setName(name);
        c.setDescription(description);

        cs.insertCategories(c);

        return "category";
    }
}
