package com.dragons.hungrydragon.dao;

import com.dragons.hungrydragon.models.MenuItem;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * @author Fahad Ahmed
 */
@Repository
public class MenuItemRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public MenuItem find(long id) {
        return entityManager.find(MenuItem.class, id);
    }

    public List<MenuItem> findByType(String type) {
        return entityManager.createQuery("select distinct e from MenuItem as e where e.type = :type").setParameter("type", type).getResultList();
    }

    public List<MenuItem> findByType(List<String> types) {
        return entityManager.createQuery("select distinct e from MenuItem as e where e.type in :types").setParameter("types", types).getResultList();
    }

    public List<MenuItem> findAll() {
        Query query =
                entityManager.createNamedQuery("query_find_all_menu_items", MenuItem.class);

        return query.getResultList();
    }

    public long insert(MenuItem menuItem) {
        entityManager.persist(menuItem);
        return menuItem.getId();
    }
}
