package meetu.action.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.NoticeDAO;
import meetu.dto.UniversityDTO;
import meetu.dto.NoticeDTO;

public class NoticeContentPageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();		
		int notice_id = Integer.parseInt(req.getParameter("no"));
		
		NoticeDAO notice_dao = NoticeDAO.getInstance();
		notice_dao.changeView(notice_id, univ);
		NoticeDTO notice_dto = (NoticeDTO) notice_dao.getNotice(notice_id, univ);
		
		req.setAttribute("notice_dto", notice_dto);
		
		return "/notice/noticeContentPage.jsp";
	}

}