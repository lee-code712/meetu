package meetu.action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.NoticeDAO;
import meetu.dto.UniversityDTO;
import meetu.dto.NoticeDTO;

public class AddNoticeAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		// 인스턴스 가져오기
		NoticeDAO notice_dao = NoticeDAO.getInstance();

		// notice 저장
		NoticeDTO notice_dto = new NoticeDTO();
		notice_dto.setTitle(title);
		notice_dto.setContent(content);
		
		boolean notice_success = notice_dao.addNotice(notice_dto, univ);
		if(!notice_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "add notice failed");
		}
		
		return "notice.do";
	}
}
