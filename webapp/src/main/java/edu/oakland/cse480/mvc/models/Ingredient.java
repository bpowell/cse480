package edu.oakland.cse480.mvc.models;

import org.hibernate.validator.constraints.NotBlank;

public class Ingredient {
    private int id;

    @NotBlank
    private String name;

    @NotBlank
    private String description;
    private String icon_url;

    @NotBlank
    private int category;
    private String categoryName;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIconUrl() {
        return this.icon_url;
    }

    public void setIconUrl(String icon_url) {
        this.icon_url = icon_url;
    }

    public int getCategory() {
        return this.category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getCategoryName() {
        return this.categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}   
