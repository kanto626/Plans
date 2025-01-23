package domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Category {
	 private int id; // カテゴリID
	    private String name; // カテゴリ名
	    private boolean isSelected;
}
