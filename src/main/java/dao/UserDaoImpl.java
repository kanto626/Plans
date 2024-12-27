package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.mindrot.jbcrypt.BCrypt;

import domain.User;

public class UserDaoImpl implements UserDao {
	//データベース接続に使用するDataSourceを保持するためのフィールドdsを用意
	private DataSource ds;

	//コンストラクタ
	public UserDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public List<User> findAll() throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return null;
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
			String sql = "SELECT * FROM users WHERE login_id=?"; // id が一致するレコードを取得する
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
		return user;
	}

	private User mapToUser(ResultSet rs) throws Exception {
		// DBから取得した行データをUserクラスのインスタンスに変換
		User user = new User();
		// ResultSet (rs) から、カラムの値を取得し User オブジェクトにセット
		user.setId((Integer) rs.getObject("id"));
		user.setLoginId(rs.getString("login_id"));
		user.setLoginPass(rs.getString("login_pass"));
		return user;
	}
}
