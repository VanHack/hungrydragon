package com.dragons.hungrydragon.models;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * @author Fahad Ahmed
 */
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Date creationDate;
    private String status;

    @OneToOne
    private User user;

    @OneToOne
    private Restaurant restaurant;

    //@OneToMany(mappedBy = "id")
    //private List<MenuItem> menuItems;

    //@OneToOne
    //private OrderStatus status;


    public Order() {
    }

    public Order(User user, Restaurant restaurant) {
        this.user = user;
        this.restaurant = restaurant;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    /*public List<MenuItem> getMenuItems() {
        return menuItems;
    }

    public void setMenuItems(List<MenuItem> menuItems) {
        this.menuItems = menuItems;
    }*/

}
