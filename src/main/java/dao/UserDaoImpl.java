package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.mindrot.jbcrypt.BCrypt;

import dto.User;

public class UserDaoImpl implements UserDao {
	//データベース接続に使用するDataSourceを保持するためのフィールドdsを用意
	private DataSource ds;

	// コンストラクタを通じて、DataSourceを受けとる
	// DataSourceの準備は、UserDaoImplを生成するクラス(DaoFactory)に委ねる
	public UserDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public List<User> findAll() throws Exception {
		List<User> userList = new ArrayList<>();
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT users.id, users.name,"
					+ " users.login_id FROM users";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				userList.add(mapToUserForList(rs));
			}
		} catch (Exception e) {
			throw e;
		}
		return userList;

	}

	private User mapToUserForList(ResultSet rs) throws Exception {
		Integer id = (Integer) rs.getObject("id");
		String name = rs.getString("name");
		return new User(id, name);

	}

	@Override
	public User findById(Integer id) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	@Override
	public void insert(User admin) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	public void update(User admin) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	public void delete(User admin) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	public User findByLoginIdAndLoginPass(String loginId, String loginPass) throws Exception {
		User user = null;
		// データベース接続を取得
		try (var con = ds.getConnection()) {
			// conを使い、SQLを実行
			String sql = "SELECT * FROM users WHERE login_id=?"; // id が一致するデータを取得する
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, loginId);
			ResultSet rs = stmt.executeQuery();

			// ResultSet に1行以上のデータがある場合に true を返す
			if (rs.next()) {
				// 送信されたlogin_passをハッシュ化し比較
				if (BCrypt.checkpw(loginPass, rs.getString("login_pass"))) {
					// 一致した場合、mapToAdmin(rs) で作成した User オブジェクトをセット
					user = mapToUser(rs);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		return user; // ログインIDとパスワードが一致する場合のみ
	}

	private User mapToUser(ResultSet rs) throws Exception {
		// DBから取得した行データをUserクラスのインスタンスに変換
		User user = new User();
		// ResultSet (rs) から、カラムの値を取得し User オブジェクトにセット
		user.setId((Integer) rs.getObject("id"));
		user.setLoginId(rs.getString("login_id"));
		user.setLoginPass(rs.getString("login_pass"));
		user.setName(rs.getString("name"));
		return user;
	}
}
