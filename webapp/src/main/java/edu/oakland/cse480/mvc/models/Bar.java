package edu.oakland.cse480.mvc.models;

public class Bar {
    private int id;
    private String name;
    private int business_id;

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
}
