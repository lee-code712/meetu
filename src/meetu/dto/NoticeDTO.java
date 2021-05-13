package meetu.dto;

public class NoticeDTO {
	private String notice_id;
	private String title;
	private String write_date;
	private int views;
	private String content;
	
	public String getNotice_id() {
		return notice_id;
	}
	
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getWrite_date() {
		return write_date;
	}
	
	public void setWrite_date(String write_date) {
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
