package meetu.dto;

public class NoticeDTO {
	private int notice_id;
	private String title;
	private String write_date;
	private int views;
	private String content;
	
	public int getNoticeId() {
		return notice_id;
	}
	
	public void setNoticeId(int notice_id) {
		this.notice_id = notice_id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getWriteDate() {
		return write_date;
	}
	
	public void setWriteDate(String write_date) {
		this.write_date = write_date;
	}
	
	public int getViews() {
		return views;
	}
	
	public void setViews(int views) {
		this.views = views;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
}
