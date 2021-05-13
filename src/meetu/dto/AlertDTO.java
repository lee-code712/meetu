package meetu.dto;

public class AlertDTO {
	private String alert_id;
	private String alert_date;
	private int alert_type;
	private String user_id;
	
	public String getAlert_id() {
		return alert_id;
	}
	
	public void setAlert_id(String alert_id) {
		this.alert_id = alert_id;
	}
	public String getAlert_date() {
		return alert_date;
	}
	
	public void setAlert_date(String alert_date) {
		this.alert_date = alert_date;
	}
	
	public int getAlert_type() {
		return alert_type;
	}
	
	public void setAlert_type(int alert_type) {
		this.alert_type = alert_type;
	}
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
