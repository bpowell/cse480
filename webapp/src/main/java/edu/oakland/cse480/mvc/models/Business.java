package edu.oakland.cse480.mvc.models;

public class Business {
    public int id;
    public String name;
    public int owner_id;
    public String contact_info;
    public String info;
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

    public int getOwnerId() {
        return this.owner_id;
    }

    public void setOwnerId(int owner_id) {
        this.owner_id = owner_id;
    }

    public String getContactInfo() {
        return this.contact_info;
    }

    public void setContactInfo(String contact_info) {
        this.contact_info = contact_info;
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
}
