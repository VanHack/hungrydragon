package com.dragons.hungrydragon.repositorytests;

import static org.assertj.core.api.Assertions.*;

import com.dragons.hungrydragon.models.*;
import com.dragons.hungrydragon.repos.OrderRepository;
import com.dragons.hungrydragon.repos.RestaurantRepository;
import com.dragons.hungrydragon.repos.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Set;

/**
 * @author Fahad Ahmed
 */
@RunWith(SpringRunner.class)
@DataJpaTest
public class OrderRepositoryTests {
    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RestaurantRepository restaurantRepository;

    @Test
    public void whenFindByName_thenReturnRestaurant(){
        // given
        User user = userRepository.findOne(1L);
        Restaurant restaurant = restaurantRepository.findOne(3L);
        Order order = new Order(user, restaurant);
        order.setStatus("PROCESSING_FOOD");
        Set<MenuItem> menuItems = restaurant.getMenuItems();
        OrderItem orderItem = new OrderItem(order, menuItems.iterator().next());
        entityManager.persist(order);
        entityManager.flush();

        // when
        Order found = orderRepository.findByStatus(order.getStatus());

        // then
        assertThat(found.getStatus()).isEqualTo(order.getStatus());
    }
}
