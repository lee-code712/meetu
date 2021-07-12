package meetu.dto;

public class MessageInformationDTO {
	private int msg_id;
	private String sent_time;
	private int is_read;
	private String send_id;
	private String recv_id;
	private MessageContentDTO msg_content_dto;
	
	public int getMsgId() {
		return msg_id;
	}
	
	public void setMsgId(int msg_id) {
		this.msg_id = msg_id;
	}
	
	public String getSentTime() {
		return sent_time;
	}
	
	public void setSentTime(String sent_time) {
		this.sent_time = sent_time;
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
	
	public MessageContentDTO getMsgContentDto() {
		return msg_content_dto;
	}

	public void setMsgContentDto(MessageContentDTO msg_content_dto) {
		this.msg_content_dto = msg_content_dto;
	}
	
}
