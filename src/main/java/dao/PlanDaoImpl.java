package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import domain.Plan;
import domain.User;

public class PlanDaoImpl implements PlanDao {

	private DataSource ds;

	// DataSourceの準備は、PlanDaoImplを生成するクラスに委ねる
	public PlanDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	// データベース内のすべてのプランを取得する
	public List<Plan> findAll() throws Exception {
		List<Plan> planList = new ArrayList<>();
		try (Connection con = ds.getConnection()) {
			// SQLを実行準備
			String sql = createSelectClauseWithJoin();
			var stmt = con.prepareStatement(sql);
			// SQLを実行
			ResultSet rs = stmt.executeQuery();
			// ResultSetをPlan<PlanList>にする
			while (rs.next()) {
				// ResultSet⇒Player
				// Playerをリストに加える
				planList.add(mapToPlan(rs));
			}
		} catch (Exception e) {
			throw e;
		}
		return planList;

	}

	@Override
	// 指定されたIDに対応するプランを取得する
	public Plan findById(Integer id) throws Exception {
		Plan plan = null;
		try (Connection con = ds.getConnection()) {
			// SQLを実行準備
			String sql = createSelectClauseWithJoin()
					+ " WHERE p.id = ?";
			var stmt = con.prepareStatement(sql);
			stmt.setObject(1, id, Types.INTEGER);
			// SQLを実行
			ResultSet rs = stmt.executeQuery();
			// ResultSet ⇒ Playerに変換
			if (rs.next()) {
				plan = mapToPlan(rs);
			}
		} catch (Exception e) {
			throw e;
		}
		return plan;

	}

	@Override
	// 指定されたユーザーIDに関連するすべてのプランを取得する
	public List<Plan> findByUserId(Integer userId) throws Exception {
		List<Plan> planList = new ArrayList<>();
		try (Connection con = ds.getConnection()) {
			// SQLを実行準備
			String sql = createSelectClauseWithJoin()
					+ " WHERE p.user_id = ?";
			var stmt = con.prepareStatement(sql);
			stmt.setObject(1, userId, Types.INTEGER);
			ResultSet rs = stmt.executeQuery();
			// ResultSet ⇒ Planリストに変換
			while (rs.next()) {
				planList.add(mapToPlan(rs));
			}
		} catch (Exception e) {
			throw e;
		}
		return planList;
	}

	@Override
	public void insert(Plan plan) throws Exception {
		try (Connection con = ds.getConnection()) {
			// SQLを実行準備
			String sql = "INSERT INTO plans "
					+ " (title, schedule, place, "
					+ " user_id, registered_at) "
					+ " VALUES (?, ?, ?, ?, CURDATE())";

			// `sql` を使用
			try (PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
				// ? の設定
				stmt.setString(1, plan.getTitle());
				stmt.setString(2, plan.getSchedule());
				stmt.setString(3, plan.getPlace());
				User user = plan.getUser();
				stmt.setObject(4, user.getId(), Types.INTEGER);
				plan.setRegisteredAt(new Date());

				// SQLを実行
				stmt.executeUpdate();

				// 登録されたプランのIDを取得
				ResultSet rs = stmt.getGeneratedKeys();
				if (rs.next()) {
					plan.setId(rs.getInt(1));
				}
			}

//			// カテゴリ関連付け
//			if (plan.getCategoryIds() != null && !plan.getCategoryIds().isEmpty()) {
//				String categorySql = "INSERT INTO categories_relations (plan_id, category_id) VALUES (?, ?)";
//				try (PreparedStatement categoryStmt = con.prepareStatement(categorySql)) {
//					for (int categoryId : plan.getCategoryIds()) {
//						categoryStmt.setInt(1, plan.getId());
//						categoryStmt.setInt(2, categoryId);
//						categoryStmt.addBatch();
//					}
//					categoryStmt.executeBatch();
//				}
//			}
		}
	}

	@Override
	public void update(Plan plan) throws Exception {
		try (Connection con = ds.getConnection()) {
			String sql = "UPDATE plans"
					+ " SET title = ?, schedule = ?, place = ?"
					+ " WHERE id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, plan.getTitle());
			stmt.setString(2, plan.getSchedule());
			stmt.setString(3, plan.getPlace());
			stmt.setObject(4, plan.getId(), Types.INTEGER);
			stmt.executeUpdate();
			
			
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void delete(Plan plan) throws Exception {
		try (Connection con = ds.getConnection()) {
			String sql = "DELETE FROM plans WHERE id = ?";
			var stmt = con.prepareStatement(sql);
			stmt.setObject(1, plan.getId(), Types.INTEGER);
			stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	// 指定された都道府県に関連するプランを取得する
	public List<Plan> findByPrefecture(String prefecture) throws Exception {
		List<Plan> planList = new ArrayList<>();
		try (Connection con = ds.getConnection()) {
			// SQLを実行準備
			String sql = createSelectClauseWithJoin()
					+ " WHERE p.place = ?";
			var stmt = con.prepareStatement(sql);
			stmt.setString(1, prefecture); // 一致する県名を検索
			ResultSet rs = stmt.executeQuery();
			// ResultSet ⇒ Planリストに変換
			while (rs.next()) {
				planList.add(mapToPlan(rs));
			}
		} catch (Exception e) {
			throw e;
		}
		return planList;
	}

	// SQLの結果セット（ResultSet）をPlanオブジェクトに変換する
	private Plan mapToPlan(ResultSet rs) throws Exception {
		// ResultSet からデータを取得して Plan オブジェクトにマッピングする
		Integer id = (Integer) rs.getObject("id");// プランID
		String title = rs.getString("title"); // タイトル
		String schedule = rs.getString("schedule"); // スケジュール
		String place = rs.getString("place"); // 目的地 
		Date registeredAt = rs.getDate("registered_at"); // 登録日

		Integer userId = (Integer) rs.getObject("user_id");
		String userName = rs.getString("name");
		// Userオブジェクトを作成
		User user = new User(userId, userName);
		// Planオブジェクトに設定
		return new Plan(id, title, schedule, place, user, registeredAt);
	}

	//JOIN句までのSELECT文を生成
	private String createSelectClauseWithJoin() {
		return "SELECT "
				+ " p.id, p.title, p.schedule, "
				+ " p.place, p.registered_at, "
				+ " u.id AS user_id, "
				+ " u.name "
				+ " FROM plans AS p "
				+ " JOIN users AS u "
				+ " ON p.user_id = u.id";

	}

}