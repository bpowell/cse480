package edu.oakland.cse480.mvc.models;

public class Drink {
    public int id;
    public String name;
    public String info;
    public int make_time;
    public String icon_url;

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

    public int getMakeTime() {
        return this.make_time;
    }

    public void setMakeTime(int make_time) {
        this.make_time = make_time;
    }

    public String getIconUrl() {
        return this.icon_url;
    }

    public void setIconUrl() {
        this.icon_url = icon_url;
    }
}   
