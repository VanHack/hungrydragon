package com.dragons.hungrydragon.repos;

import com.dragons.hungrydragon.models.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * @author Fahad Ahmed
 */
@RepositoryRestResource(collectionResourceRel = "restaurants", path = "restaurants")
public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {
}
