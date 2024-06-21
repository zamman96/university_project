package lecture.vo;

public class TimeVO {
	private String time_id;
	private String time_week;
	private int time_class;
	private String time_str;
	
	public TimeVO() {
	}

	public String getTime_id() {
		return time_id;
	}

	public void setTime_id(String time_id) {
		this.time_id = time_id;
	}

	public String getTime_week() {
		return time_week;
	}

	public void setTime_week(String time_week) {
		this.time_week = time_week;
	}

	public int getTime_class() {
		return time_class;
	}

	public void setTime_class(int time_class) {
		this.time_class = time_class;
	}

	public String getTime_str() {
		return time_str;
	}

	public void setTime_str(String time_str) {
		this.time_str = time_str;
	}

}
