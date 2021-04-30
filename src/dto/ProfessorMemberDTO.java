package meetu.dto;

public class ProfessorMemberDTO {
	private String p_user_id;
	private String password;
	private String prof_id;
	
	public String getPUserId() {
		return p_user_id;
	}
	
	public void setPUserId(String p_user_id) {
		this.p_user_id = p_user_id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getProfId() {
		return prof_id;
	}
	
	public void setProfId(String prof_id) {
		this.prof_id = prof_id;
	}
}
