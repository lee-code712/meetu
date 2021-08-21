package meetu.dto;

public class ConsultableTimeDTO {
	private String able_date;
	private String able_time;
	private String p_user_id;
	
	public String getAbleDate() {
		return able_date;
	}

	public void setAbleDate(String able_date) {
		this.able_date = able_date;
	}

	public String getAbleTime() {
		return able_time;
	}

	public void setAbleTime(String able_time) {
		this.able_time = able_time;
	}

	public String getPUserId() {
		return p_user_id;
	}
	
	public void setPUserId(String p_user_id) {
		this.p_user_id = p_user_id;
	}

}
