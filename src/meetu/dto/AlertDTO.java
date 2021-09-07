package meetu.dto;

public class AlertDTO {
	private String alert_id;
	private String alert_date;
	private int alert_type;
	private String alert_msg;
	private int is_read;
	private String user_id;
	
	public String getAlertId() {
		return alert_id;
	}
	
	public void setAlertId(String alert_id) {
		this.alert_id = alert_id;
	}
	public String getAlertDate() {
		return alert_date;
	}
	
	public void setAlertDate(String alert_date) {
		this.alert_date = alert_date;
	}
	
	public int getAlertType() {
		return alert_type;
	}
	
	public void setAlertType(int alert_type) {
		this.alert_type = alert_type;
	}
	
	public String getAlertMsg() {
		return alert_msg;
	}

	public void setAlertMsg(String alert_msg) {
		this.alert_msg = alert_msg;
	}

	public int getIsRead() {
		return is_read;
	}

	public void setIsRead(int is_read) {
		this.is_read = is_read;
	}

	public String getUserId() {
		return user_id;
	}
	
	public void setUserId(String user_id) {
		this.user_id = user_id;
	}
	
}
