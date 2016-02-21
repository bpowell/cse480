package edu.oakland.cse480.mvc.models;

public class Bar {
    private int id;
    private String name;
    private int business_id;
    private int owner_id;
    private String address;
    private String city;
    private String zipcode;
    private String state;
    private String number;

    private String monday_hours;
    private String tuesday_hours;
    private String wednesday_hours;
    private String thursday_hours;
    private String friday_hours;
    private String saturday_hours;
    private String sunday_hours;

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

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return this.zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getNumber() {
        return this.number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getMondayHours() {
        return this.monday_hours;
    }

    public void setMondayHours(String monday_hours) {
        this.monday_hours = monday_hours;
    }

    public String getTuesdayHours() {
        return this.tuesday_hours;
    }

    public void setTuesdayHours(String tuesday_hours) {
        this.tuesday_hours = tuesday_hours;
    }

    public String getWednesdayHours() {
        return this.wednesday_hours;
    }

    public void setWednesdayHours(String wednesday_hours) {
        this.wednesday_hours = wednesday_hours;
    }

    public String getThursdayHours() {
        return this.thursday_hours;
    }

    public void setThursdayHours(String thursday_hours) {
        this.thursday_hours = thursday_hours;
    }

    public String getFridayHours() {
        return this.friday_hours;
    }

    public void setFridayHours(String friday_hours) {
        this.friday_hours = friday_hours;
    }

    public String getSaturdayHours() {
        return this.saturday_hours;
    }

    public void setSaturdayHours(String saturday_hours) {
        this.saturday_hours = saturday_hours;
    }

    public String getSundayHours() {
        return this.sunday_hours;
    }

    public void setSundayHours(String sunday_hours) {
        this.sunday_hours = sunday_hours;
    }
}
