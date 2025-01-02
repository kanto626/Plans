package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.mindrot.jbcrypt.BCrypt;

import domain.Admin;

public class AdminDaoImpl implements AdminDao {
	//データベース接続に使用するDataSourceを保持するためのフィールドdsを用意
	private DataSource ds;

	// コンストラクタを通じて、DataSourceを受けとる
	// DataSourceの準備は、UserDaoImplを生成するクラス(DaoFactory)に委ねる
	public AdminDaoImpl(DataSource ds) {
		this.ds = ds;
	}
	/*
		@Override
		public List<Admin> findAll() throws Exception {
			// TODO 自動生成されたメソッド・スタブ
			return null;
		}
	
		@Override
		public Admin findById(Integer id) throws Exception {
			// TODO 自動生成されたメソッド・スタブ
			return null;
		}
	
		@Override
		public void insert(Admin admin) throws Exception {
			// TODO 自動生成されたメソッド・スタブ
	
		}
	
		@Override
		public void update(Admin admin) throws Exception {
			// TODO 自動生成されたメソッド・スタブ
	
		}
	
		@Override
		public void delete(Admin admin) throws Exception {
			// TODO 自動生成されたメソッド・スタブ
	
		}
	*/

	@Override
	public Admin findByLoginIdAndLoginPass(String loginId, String loginPass) throws Exception {
		Admin admin = null;
		// データベース接続を取得
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT * FROM admins WHERE login_id = ?"; // id が一致するデータを取得する
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, loginId);
			ResultSet rs = stmt.executeQuery();
			
			// ResultSet に1行以上のデータがある場合に true を返す
			if (rs.next()) {
				// 送信されたlogin_passをハッシュ化し比較
				if (BCrypt.checkpw(loginPass, rs.getString("login_pass"))) {
					// 一致した場合、mapToAdmin(rs) で作成した User オブジェクトをセット
					admin = mapToAdmin(rs);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		return admin; // ログインIDとパスワードが一致する場合のみ
	}

	private Admin mapToAdmin(ResultSet rs) throws Exception {
		// DBから取得した行データをUserクラスのインスタンスに変換
		Admin admin = new Admin();
		admin.setId(rs.getInt("id"));
		admin.setName(rs.getString("name"));
		admin.setLoginId(rs.getString("login_id"));
		admin.setLoginPass(rs.getString("login_pass")); // ハッシュ化されたパスワード
		return admin;
	}
}
