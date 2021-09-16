package meetu.dto;

public class ConsultRecordDTO {
	private String consult_id;
	private String start_time;
	private String end_time;
	private String reason;
	private String type;
	private String stu_id;
	private String prof_id;
	private String content;
	private String res_id;
	
	public String getConsultId() {
		return consult_id;
	}
	
	public void setConsultId(String consult_id) {
		this.consult_id = consult_id;
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
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getStuId() {
		return stu_id;
	}
	
	public void setStuId(String stu_id) {
		this.stu_id = stu_id;
	}
	
	public String getProfId() {
		return prof_id;
	}
	
	public void setProfId(String prof_id) {
		this.prof_id = prof_id;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public String getResId() {
		return res_id;
	}

	public void setResId(String res_id) {
		this.res_id = res_id;
	}

}