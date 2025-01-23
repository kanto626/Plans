package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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

	@Override
	public List<Category> getCategoriesByPlanId(Integer id) throws Exception {
		List<Category> categoryList = new ArrayList<>();
		try (Connection con = ds.getConnection()) {
			// SQLを実行準備
			String sql = createSelectClauseWithJoin()
					+ " WHERE p.id = ?";
			var stmt = con.prepareStatement(sql);
			stmt.setObject(1, id, Types.INTEGER);
			ResultSet rs = stmt.executeQuery();
			// ResultSet ⇒ Planリストに変換
			while (rs.next()) {
				Category category = new Category();
				category.setId(rs.getInt("category_id"));
				category.setName(rs.getString("category_name"));
				categoryList.add(category);
			}
		} catch (Exception e) {
			throw e;
		}
		return categoryList;
	}

	//JOIN句までのSELECT文を生成
	private String createSelectClauseWithJoin() {
		return "SELECT "
				+ " p.id AS plan_id, "
				+ " c.id AS category_id, "
				+ " c.name AS category_name "
				+ " FROM "
				+ " plans p "
				+ " JOIN "
				+ " categories_relations cr ON p.id = cr.plan_id "
				+ " JOIN "
				+ " categories c ON cr.category_id = c.id";

	}

	@Override
	public void insert(Category category) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	public void update(Category category) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

	public void updateCategoriesRelations(int planId, List<Integer> categoryIds) throws Exception {
		try (Connection con = ds.getConnection()) {
			con.setAutoCommit(false);
			try {
				// カテゴリ関連の削除
				String deleteSql = "DELETE FROM categories_relations WHERE plan_id = ?";
				try (PreparedStatement deleteStmt = con.prepareStatement(deleteSql)) {
					deleteStmt.setInt(1, planId);
					deleteStmt.executeUpdate();
				}

				// 新しいカテゴリ関連の挿入
				if (categoryIds != null && !categoryIds.isEmpty()) {
					String insertSql = "INSERT INTO categories_relations (plan_id, category_id) VALUES (?, ?)";
					try (PreparedStatement insertStmt = con.prepareStatement(insertSql)) {
						for (int categoryId : categoryIds) {
							insertStmt.setInt(1, planId);
							insertStmt.setInt(2, categoryId);
							insertStmt.addBatch();
						}
						insertStmt.executeBatch();
					}
				}
				con.commit();
			} catch (Exception e) {
				con.rollback();
				throw e;
			}
		}
	}

	@Override
	public void delete(Category category) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

}
