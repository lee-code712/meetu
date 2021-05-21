package meetu.dto;

public class MemberDTO {
	private String member_id;
	private String name;
	private String role;
	
	public String getMemberId() {
		return member_id;
	}
	
	public void setMemberId(String member_id) {
		this.member_id = member_id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}

}
