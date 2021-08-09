package meetu.dto;

public class ConsultableTimeDTO {
	private String disable_date;
	private String disable_time;
	private String p_user_id;
	
	public String getDisableDate() {
		return disable_date;
	}

	public void setDisableDate(String disable_date) {
		this.disable_date = disable_date;
	}

	public String getDisableTime() {
		return disable_time;
	}

	public void setDisableTime(String disable_time) {
		this.disable_time = disable_time;
	}

	public String getP_user_id() {
		return p_user_id;
	}
	
	public void setP_user_id(String p_user_id) {
		this.p_user_id = p_user_id;
	}

}
