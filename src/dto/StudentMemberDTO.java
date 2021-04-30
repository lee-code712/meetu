package meetu.dto;

public class StudentMemberDTO {
	private String s_user_id;
	private String password;
	private String stu_id;
	
	public String getSUserId() {
		return s_user_id;
	}
	
	public void setSUserId(String s_user_id) {
		this.s_user_id = s_user_id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getStuId() {
		return stu_id;
	}
	
	public void setStuId(String stu_id) {
		this.stu_id = stu_id;
	}
}
