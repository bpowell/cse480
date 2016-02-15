package edu.oakland.cse480.mvc.models;

import java.util.List;
import java.util.ArrayList;

public class Business {
    private int id;
    private String name;
    private String info;
    private String icon_url;
    private List<Bar> bars;

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
        return this.icon_url;
    }

    public void setIconUrl(String icon_url) {
        this.icon_url = icon_url;
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
