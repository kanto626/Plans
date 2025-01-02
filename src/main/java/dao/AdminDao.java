package dao;

import domain.Admin;

public interface AdminDao {
	/*
	// 管理者一覧を取得
	List<Admin> findAll() throws Exception;
	
	// 管理者IDを使って管理者情報を取得する
	Admin findById(Integer id) throws Exception;
	
	// 必要に応じて、管理者を新規登録するメソッド
	void insert(Admin admin) throws Exception;
	
	// 管理者情報を更新するメソッド
	void update(Admin admin) throws Exception;
	
	// 管理者情報を削除するメソッド
	void delete(Admin admin) throws Exception;
	*/
	
	// 管理者のログインIDとパスワードを使って管理者情報を検索する
	Admin findByLoginIdAndLoginPass(String loginId, String loginPass) throws Exception;
}
