package domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Plan {
	private int id; // 旅行プランID
	private String title; // タイトル
	private String schedule; // プラン内容
	private String place; // 目的地
	private User user; // 作成者のユーザーID
	private Date registeredAt; // 投稿日
	private List<Integer> categoryIds; // カテゴリIDのリスト

	// categoryIds を除外したコンストラクタ
	// (mapToPlan メソッドで使用する引数に一致するコンストラクタを明示的に定義)
	public Plan(int id, String title, String schedule, String place, User user, Date registeredAt) {
		this.id = id;
		this.title = title;
		this.schedule = schedule;
		this.place = place;
		this.user = user;
		this.registeredAt = registeredAt;
	}
}
