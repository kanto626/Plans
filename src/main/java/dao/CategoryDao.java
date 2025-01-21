package dao;

import java.sql.SQLException;
import java.util.List;

import domain.Category;

public interface CategoryDao {
	List<Category> getAllCategories() throws Exception;

	// カテゴリIDを基にカテゴリを取得するメソッド
	Category getCategoryById(int categoryId) throws SQLException;
}
