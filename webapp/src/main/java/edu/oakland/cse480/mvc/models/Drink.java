package edu.oakland.cse480.mvc.models;

import java.util.ArrayList;
import java.util.List;

public class Drink {
    public int id;
    public String name;
    public String info;
    public int make_time;
    public String icon_url;
    private List<Ingredient> ingredients;
    private float price;

    public Drink() {
        this.ingredients = new ArrayList<Ingredient>();
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInfo() {
        return this.info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getMakeTime() {
        return this.make_time;
    }

    public void setMakeTime(int make_time) {
        this.make_time = make_time;
    }

    public String getIconUrl() {
        return this.icon_url;
    }

    public void setIconUrl(String icon_url) {
        this.icon_url = icon_url;
    }

    public List<Ingredient> getIngredients() {
        return this.ingredients;
    }

    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public float getPrice() {
        return this.price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}   
