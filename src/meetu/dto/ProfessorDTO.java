package meetu.dto;

public class ProfessorDTO {
	private String prof_id;
	private String major;
	private String email;
	private String office;
	private String dept_id;
	
	public String getProfId() {
		return prof_id;
	}
	
	public void setProfId(String prof_id) {
		this.prof_id = prof_id;
	}
	
	public String getMajor() {
		return major;
	}
	
	public void setMajor(String major) {
		this.major = major;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getOffice() {
		return office;
	}
	
	public void setOffice(String office) {
		this.office = office;
	}
	
	public String getDeptId() {
		return dept_id;
	}
	
	public void setDeptId(String dept_id) {
		this.dept_id = dept_id;
	}
}
