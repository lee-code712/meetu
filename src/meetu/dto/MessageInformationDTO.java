package meetu.dto;

public class MessageInformationDTO {
	private String msg_id;
	private String date;
	private int is_read;
	private String send_id;
	private String recv_id;
	
	public String getMsgId() {
		return msg_id;
	}
	
	public void setMsgId(String msg_id) {
		this.msg_id = msg_id;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getIsRead() {
		return is_read;
	}
	
	public void setIsRead(int is_read) {
		this.is_read = is_read;
	}
	
	public String getSendId() {
		return send_id;
	}
	
	public void setSendId(String send_id) {
		this.send_id = send_id;
	}
	
	public String getRecvId() {
		return recv_id;
	}
	
	public void setRecvId(String recv_id) {
		this.recv_id = recv_id;
	}
	
}
