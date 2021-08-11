package meetu.action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meetu.action.CommandAction;

public class NoticeWritePageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		return "/notice/noticeWritePage.jsp";
	}

}