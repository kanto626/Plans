package dao;

import java.sql.Connection;
import java.sql.ResultSet;
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
					+ " category, user_id, registered_at) "
					+ " VALUES (?, ?, ?, ?, ?, CURDATE())";
			var stmt = con.prepareStatement(sql);
			// ? の設定
			stmt.setString(1, plan.getTitle());
			stmt.setString(2, plan.getSchedule());
			stmt.setString(3, plan.getPlace());
			stmt.setString(4, plan.getCategory());
			User user = plan.getUser();
			stmt.setObject(5, user.getId(), Types.INTEGER);
			plan.setRegisteredAt(new Date());

			// SQLを実行
			stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void update(Plan plan) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

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

	private Plan mapToPlan(ResultSet rs) throws Exception {
		// ResultSet からデータを取得して Plan オブジェクトにマッピングする
		Integer id = (Integer) rs.getObject("id");// プランID
		String title = rs.getString("title"); // タイトル
		String schedule = rs.getString("schedule"); // スケジュール
		String place = rs.getString("place"); // 目的地
		String category = rs.getString("category"); // カテゴリ 
		Date registeredAt = rs.getDate("registered_at"); // 登録日

		Integer userId = (Integer) rs.getObject("user_id");
		String userName = rs.getString("name");
		// Userオブジェクトを作成
		User user = new User(userId, userName);
		// Planオブジェクトに設定
		return new Plan(id, title, schedule, place, category, user, registeredAt);
	}

	//JOIN句までのSELECT文を生成
	private String createSelectClauseWithJoin() {
		return "SELECT "
				+ " p.id, p.title, p.schedule, "
				+ " p.place, p.category, p.registered_at, "
				+ " u.id AS user_id, "
				+ " u.name "
				+ " FROM plans AS p "
				+ " JOIN users AS u "
				+ " ON p.user_id = u.id";

	}

}