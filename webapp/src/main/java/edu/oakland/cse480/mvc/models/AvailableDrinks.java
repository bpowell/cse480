package edu.oakland.cse480.mvc.models;

public class AvailableDrinks {
    private int id;
    private int drink_id;
    private int bar_id;
    private float price;

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDrinkId() {
        return this.drink_id;
    }

    public void setDrinkId(int drink_id) {
        this.drink_id = drink_id;
    }

    public int getBarId() {
        return this.bar_id;
    }

    public void setBarId(int bar_id) {
        this.bar_id = bar_id;
    }

    public float getPrice() {
        return this.price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
