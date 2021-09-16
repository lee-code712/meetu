package meetu.dto;

public class MemberUserDTO {
	private String user_id;
	private String password;
	private String phone;
	private String member_id;
	
	public String getUserId() {
		return user_id;
	}
	
	public void setUserId(String user_id) {
		this.user_id = user_id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getMemberId() {
		return member_id;
	}
	
	public void setMemberId(String member_id) {
		this.member_id = member_id;
	}
	
}
