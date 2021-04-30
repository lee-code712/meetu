package meetu.dto;

public class ProfessorConsultTimeDTO {
	int consult_date;
	String consult_time;
	String prof_id;
	
	public int getConsultDate() {
		return consult_date;
	}
	
	public void setConsultDate(int consult_date) {
		this.consult_date = consult_date;
	}
	
	public String getConsultTime() {
		return consult_time;
	}
	
	public void setConsultTime(String consult_time) {
		this.consult_time = consult_time;
	}
	
	public String getProfId() {
		return prof_id;
	}
	
	public void setProfId(String prof_id) {
		this.prof_id = prof_id;
	}
}
