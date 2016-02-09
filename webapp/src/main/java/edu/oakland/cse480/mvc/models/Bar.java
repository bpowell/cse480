package edu.oakland.cse480.mvc.models;

public class Bar {
    private int id;
    private String name;
    private int business_id;
    private int owner_id;
    private String contact_info;
    private String location;

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

    public int getBusinessId() {
        return this.business_id;
    }

    public void setBusinessId(int business_id) {
        this.business_id = business_id;
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

    public String getLocation() {
         return this.location;
    }

    public void setLocation(String location) {
         this.location = location;
    }
}
