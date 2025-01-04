package domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class Plan {
	private int id; // 旅行プランID
	private String title; // タイトル
	private String detail; // プラン内容
	private String place; // 目的地
	private String category; // カテゴリ
	private User user; // 作成者のユーザーID
	private Date registeredAt; // 作成日時
}
