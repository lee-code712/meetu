package meetu.dto;

public class StudentDTO {
	private String stu_id;
	private int year;
	private String email;
	private String dept_id;
	
	public String getStuId() {
		return stu_id;
	}
	
	public void setStuId(String stu_id) {
		this.stu_id = stu_id;
	}
	
	public int getYear() {
		return year;
	}
	
	public void setYear(int year) {
		this.year = year;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getDeptId() {
		return dept_id;
	}
	
	public void setDeptId(String dept_id) {
		this.dept_id = dept_id;
	}
}
