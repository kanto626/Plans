package domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
//adminsテーブルの情報を格納する「Admin」クラス
public class Admin {
	private Integer id;
	private String loginId;
	private String loginPass;
	private String name;
}
