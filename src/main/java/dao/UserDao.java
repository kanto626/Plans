package dao;

import java.util.List;

import domain.User;

public interface UserDao {
	
    // ユーザー一覧を取得
	List<User> findAll() throws Exception;
	// ユーザーIDを使ってユーザー情報を取得する
	User findById(Integer id) throws Exception;
	// 必要に応じて、ユーザーを新規登録するメソッド
	void insert(User user) throws Exception;
	// ユーザー情報を更新するメソッド
	void update(User user) throws Exception;
	// ユーザー情報を削除するメソッド
	void delete(User user) throws Exception;
	// ユーザーのログインIDとパスワードを使ってユーザー情報を検索する
	User findByLoginIdAndLoginPass(String loginId, String loginPass)
	throws Exception;
}
