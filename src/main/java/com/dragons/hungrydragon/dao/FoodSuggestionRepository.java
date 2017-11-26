package com.dragons.hungrydragon.dao;

import com.dragons.hungrydragon.models.FoodSuggestion;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * @author Fahad Ahmed
 */
@Repository
public class FoodSuggestionRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public FoodSuggestion find(long id) {
        return entityManager.find(FoodSuggestion.class, id);
    }

    public List<FoodSuggestion> findAll() {
        Query query =
            entityManager.createNamedQuery("query_find_all_food_suggestions", FoodSuggestion.class);

        return query.getResultList();
    }

    public long insert(FoodSuggestion user) {
        entityManager.persist(user);
        return user.getId();
    }
}