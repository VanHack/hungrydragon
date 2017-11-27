package com.dragons.hungrydragon.repositorytests;

import static org.assertj.core.api.Assertions.*;
import com.dragons.hungrydragon.models.Restaurant;
import com.dragons.hungrydragon.repos.RestaurantRepository;
import com.dragons.hungrydragon.repos.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author Fahad Ahmed
 */
@RunWith(SpringRunner.class)
@DataJpaTest
public class RestaurantRepositoryTests {
    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private RestaurantRepository restaurantRepository;

    @Test
    public void whenFindByName_thenReturnRestaurant(){
        // given
        Restaurant restaurant = new Restaurant("Hungray Dragon Restaurant", "Vancouver, BC, Canada.", "", "");
        entityManager.persist(restaurant);
        entityManager.flush();

        // when
        Restaurant found = restaurantRepository.findByName(restaurant.getName());

        // then
        assertThat(found.getName()).isEqualTo(restaurant.getName());
    }
}
