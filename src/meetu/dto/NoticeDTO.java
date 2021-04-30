package meetu.dto;

public class NoticeDTO {
	private String notice_id;
	private String title;
	private String writer;
	private String date;
	private int views;
	private String contents;
	
	public String getNoticeId() {
		return notice_id;
	}
	
	public void setNoticeId(String notice_id) {
		this.notice_id = notice_id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public int getViews() {
		return views;
	}
	
	public void setViews(int views) {
		this.views = views;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}

}
