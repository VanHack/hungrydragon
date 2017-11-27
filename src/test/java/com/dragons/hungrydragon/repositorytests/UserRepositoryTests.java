package com.dragons.hungrydragon.repositorytests;

import static org.assertj.core.api.Assertions.*;
import com.dragons.hungrydragon.models.User;
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
public class UserRepositoryTests {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private UserRepository userRepository;

    @Test
    public void whenFindByName_thenReturnUser(){
       // given
        User user = new User("Hungry", "Dragon", "hungrydragon", "hungrydragon", "hungrydragon@hungrydragon.com", "Vancouver, BC, Canada.");
        entityManager.persist(user);
        entityManager.flush();

        // when
        User found = userRepository.findByLastName(user.getLastName());

        // then
        assertThat(found.getLastName()).isEqualTo(user.getLastName());
    }
}
