package com.dragons.hungrydragon.models;

import javax.persistence.*;

/**
 * @author Fahad Ahmed
 */
@Entity
@Table(name = "food_suggestions")
@NamedQuery(query = "select e from FoodSuggestion e", name = "query_find_all_food_suggestions")
public class FoodSuggestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private float weight;
    private String type;

    @Column(name = "day_of_week")
    private int dayOfWeek;

    public FoodSuggestion() {
    }

    public FoodSuggestion(float weight, String type, int dayOfWeek) {
        this.weight = weight;
        this.type = type;
        this.dayOfWeek = dayOfWeek;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    @Override
    public String toString() {
        return "FoodSuggestion{" +
                "id=" + id +
                ", weight=" + weight +
                ", type='" + type + '\'' +
                ", dayOfWeek='" + dayOfWeek + '\'' +
                '}';
    }
}
