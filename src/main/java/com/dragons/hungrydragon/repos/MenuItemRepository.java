package com.dragons.hungrydragon.repos;

import com.dragons.hungrydragon.models.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * @author Fahad Ahmed
 */
@RepositoryRestResource(collectionResourceRel = "menuitems", path = "menuitems")
public interface MenuItemRepository extends JpaRepository<MenuItem, Long> {
}
