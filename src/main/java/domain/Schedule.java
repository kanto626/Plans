package domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Schedule {
	 private String place;
	    private String comment;
	    private String image;
	    private String transport;
	    private String time;

}
