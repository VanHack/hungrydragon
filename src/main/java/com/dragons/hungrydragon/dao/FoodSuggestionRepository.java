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

    public List<FoodSuggestion> find(int dayOfWeek) {
        return entityManager.createQuery("from FoodSuggestion as e where e.dayOfWeek = :dayOfWeek")
            .setParameter("dayOfWeek", dayOfWeek).getResultList();
    }

    public List<FoodSuggestion> find(int dayOfWeek, float weight) {
        return entityManager.createQuery("from FoodSuggestion as e where e.dayOfWeek = :dayOfWeek and e.weight >= :weight")
            .setParameter("dayOfWeek", dayOfWeek).setParameter("weight", weight).getResultList();
    }

    public List<String> findTypes(int dayOfWeek) {
        return entityManager.createQuery("select distinct e.type from FoodSuggestion as e where e.dayOfWeek = :dayOfWeek")
            .setParameter("dayOfWeek", dayOfWeek).getResultList();
    }

    public List<String> findTypes(int dayOfWeek, float weight) {
        return entityManager.createQuery("select distinct e.type from FoodSuggestion as e where e.dayOfWeek = :dayOfWeek and e.weight >= :weight")
            .setParameter("dayOfWeek", dayOfWeek).setParameter("weight", weight).getResultList();
    }

    public List<FoodSuggestion> findAll() {
        Query query =
            entityManager.createNamedQuery("query_find_all_food_suggestions", FoodSuggestion.class);

        return query.getResultList();
    }

    public long insert(FoodSuggestion foodSuggestion) {
        entityManager.persist(foodSuggestion);
        return foodSuggestion.getId();
    }
}