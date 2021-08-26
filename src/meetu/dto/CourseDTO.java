package meetu.dto;

public class CourseDTO {
	private String course_id;
	private String title;
	private String dept_id;
	
	public String getCourseId() {
		return course_id;
	}
	
	public void setCourseId(String course_id) {
		this.course_id = course_id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public String getDeptId() {
		return dept_id;
	}

	public void setDeptId(String dept_id) {
		this.dept_id = dept_id;
	}
}
