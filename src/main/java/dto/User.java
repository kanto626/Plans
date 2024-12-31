package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
// usersテーブルの情報を格納する「User」クラス
public class User {
	private Integer id;
	private String loginId;
	private String loginPass;
	private String name;

	// 部分的なフィールドを使用するためのコンストラクタを追加
	// findAll(ユーザーリスト表示用)
	public User(Integer id, String name) {
		this.id = id;
		this.name = name;
	}
}