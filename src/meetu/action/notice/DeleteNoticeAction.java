package meetu.action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.NoticeDAO;
import meetu.dto.UniversityDTO;
import meetu.dto.NoticeDTO;

public class DeleteNoticeAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		int notice_id = Integer.parseInt(req.getParameter("notice_id"));
		
		// 인스턴스 가져오기
		NoticeDAO notice_dao = NoticeDAO.getInstance();

		// notice 삭제
		NoticeDTO notice_dto = new NoticeDTO();
		notice_dto.setNoticeId(notice_id);
		
		boolean notice_success = notice_dao.deleteNotice(notice_dto, univ);
		if(!notice_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "add notice failed");
		}
		
		return "notice.do";
	}
}
