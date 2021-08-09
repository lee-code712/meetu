package meetu.dto;

public class ReservationDTO {
	private String res_id;
	private String start_time;
	private String end_time;
	private String reason;
	private int type;
	private int state;
	private String reject_msg;
	private String p_user_id;
	private String s_user_id;
	
	public String getResId() {
		return res_id;
	}
	
	public void setResId(String res_id) {
		this.res_id = res_id;
	}
	
	public String getStartTime() {
		return start_time;
	}

	public void setStartTime(String start_time) {
		this.start_time = start_time;
	}

	public String getEndTime() {
		return end_time;
	}

	public void setEndTime(String end_time) {
		this.end_time = end_time;
	}

	public String getReason() {
		return reason;
	}
	
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public int getType() {
		return type;
	}
	
	public void setType(int type) {
		this.type = type;
	}
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	public String getRejectMsg() {
		return reject_msg;
	}
	
	public void setRejectMsg(String reject_msg) {
		this.reject_msg = reject_msg;
	}
	
	public String getPUserId() {
		return p_user_id;
	}
	
	public void setPUserId(String p_user_id) {
		this.p_user_id = p_user_id;
	}
	
	public String getSUserId() {
		return s_user_id;
	}
	
	public void setSUserId(String s_user_id) {
		this.s_user_id = s_user_id;
	}

}
