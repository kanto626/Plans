package domain;

import lombok.Data;

@Data
// usersテーブルの情報を格納する「User」クラス
public class User {
	private Integer id;
	private String loginId;
	private String loginPass;
}
