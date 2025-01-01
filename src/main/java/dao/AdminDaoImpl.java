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
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT * FROM admins WHERE login_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, loginId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				// ハッシュ化されたパスワードを比較
				if (BCrypt.checkpw(loginPass, rs.getString("login_pass"))) {
					admin = mapToAdmin(rs);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		return admin;
	}

	private Admin mapToAdmin(ResultSet rs) throws Exception {
		Admin admin = new Admin();
		admin.setId(rs.getInt("id"));
		admin.setName(rs.getString("name"));
		admin.setLoginId(rs.getString("login_id"));
		admin.setLoginPass(rs.getString("login_pass")); // ハッシュ化されたパスワード
		return admin;
	}
}
