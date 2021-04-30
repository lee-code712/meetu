package meetu.dto;

public class DepartmentDTO {
	private String dept_id;
	private String dept_name;
	private String college_id;
	
	public String getDeptId() {
		return dept_id;
	}
	
	public void setDeptId(String dept_id) {
		this.dept_id = dept_id;
	}
	
	public String getDeptName() {
		return dept_name;
	}
	
	public void setDeptName(String dept_name) {
		this.dept_name = dept_name;
	}
	
	public String getCollegeId() {
		return college_id;
	}
	
	public void setCollegeId(String college_id) {
		this.college_id = college_id;
	}
}
