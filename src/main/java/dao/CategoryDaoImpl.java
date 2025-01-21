package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import domain.Category;

public class CategoryDaoImpl implements CategoryDao {

	private DataSource ds;

	// DataSourceの準備は、PlanDaoImplを生成するクラスに委ねる
	public CategoryDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public List<Category> getAllCategories() throws Exception {
		List<Category> categories = new ArrayList<>();
		String sql = "SELECT id, name FROM categories";
		try (Connection con = ds.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery()) {
			while (rs.next()) {
				Category category = new Category();
				category.setId(rs.getInt("id"));
				category.setName(rs.getString("name"));
				categories.add(category);
			}
		}
		return categories;
	}

	@Override
	public Category getCategoryById(int categoryId) throws SQLException {
		Category category = null;
		// DB接続
		try (Connection con = ds.getConnection()) {
			// SQLクエリ
			String sql = "SELECT * FROM categories WHERE id = ?";
			try (PreparedStatement stmt = con.prepareStatement(sql)) {
				stmt.setInt(1, categoryId);
				ResultSet rs = stmt.executeQuery();
				if (rs.next()) {
					// 結果があればCategoryオブジェクトにデータをセット
					category = new Category();
					category.setId(rs.getInt("id"));
					category.setName(rs.getString("name"));
				}
			}
		}
		return category;
	}
}