package dao;

import java.sql.SQLException;
import java.util.List;

import domain.Category;

public interface CategoryDao {
	
	// categories テーブル内のすべてのカテゴリを取得
	List<Category> findAll() throws Exception;

	void insert(Category category) throws Exception;

	void update(Category category) throws Exception;

	void delete(Category category) throws Exception;

	// プランIDを基にカテゴリを取得するメソッド
	Category getCategoryById(int categoryId) throws SQLException;

	// 指定されたプランIDに関連付けられているカテゴリのリストを取得
	List<Category> getCategoriesByPlanId(Integer id) throws Exception;
}
