package edu.oakland.cse480.mvc.models;

public class Bar {
    public int id;
    public String name;
    public int business_id;

    public int getId() {
        return this.id;
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
