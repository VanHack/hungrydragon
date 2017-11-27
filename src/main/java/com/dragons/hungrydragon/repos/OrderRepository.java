package com.dragons.hungrydragon.repos;

import com.dragons.hungrydragon.models.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * @author Fahad Ahmed
 */
@RepositoryRestResource(collectionResourceRel = "orders", path = "orders")
public interface OrderRepository extends JpaRepository<Order, Long> {
    public Order findByStatus(String status);
}
