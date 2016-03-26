package edu.oakland.cse480.mvc.models;

import org.hibernate.validator.constraints.NotBlank;

public class Hours {
    private int barId;

    @NotBlank
    private String monday_hours;
    @NotBlank
    private String tuesday_hours;
    @NotBlank
    private String wednesday_hours;
    @NotBlank
    private String thursday_hours;
    @NotBlank
    private String friday_hours;
    @NotBlank
    private String saturday_hours;
    @NotBlank
    private String sunday_hours;

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

    public int getBarId() {
        return this.barId;
    }

    public void setBarId(int barId) {
        this.barId = barId;
    }
}
