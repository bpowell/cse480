package edu.oakland.cse480.mvc.models;

import org.hibernate.validator.constraints.NotBlank;

import java.util.List;
import java.util.ArrayList;

public class Business {
    private int id;
    private List<Bar> bars;

    @NotBlank
    private String name;

    @NotBlank
    private String info;

    @NotBlank
    private String iconUrl;

    public Business() {
        this.bars = new ArrayList<Bar>();
    }

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

    public String getInfo() {
        return this.info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getIconUrl() {
        return this.iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public void setBars(List<Bar> bars) {
        this.bars = bars;
    }

    public List<Bar> getBars() {
        return this.bars;
    }

    public void addBar(Bar b) {
        this.bars.add(b);
    }
}
