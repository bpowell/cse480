package edu.oakland.cse480.mvc.models;

public class DrinkOrder {
    public int id;
    public int drink_id;
    public int drink_count;
    public int user_id;
    public int bar_id;

    public int getId() {
        return this.id;
    }

    public int getDrinkId() {
        return this.drink_id;
    }

    public void setDrinkId(int drink_id) {
        this.drink_id = drink_id;
    }

    public int getDrinkCount() {
        return this.drink_count;
    }

    public void setDrinkCount(int drink_count) {
        this.drink_count = drink_count;
    }

    public int getUserId() {
        return this.user_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
    }

    public int getBarId() {
        return this.bar_id;
    }

    public void setBarId(int bar_id) {
        this.bar_id = bar_id;
    }
}   

