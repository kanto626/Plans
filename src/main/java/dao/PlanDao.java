package dao;

import java.util.List;

import domain.Plan;

public interface PlanDao {
	List<Plan> findAll() throws Exception;

	Plan findById(Integer id) throws Exception;

	void insert(Plan plan) throws Exception;

	void update(Plan plan) throws Exception;

	void delete(Plan plan) throws Exception;

	List<Plan> findByPrefecture(String prefecture) throws Exception;
}
