package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.NoticeDAO;
import meetu.dto.UniversityDTO;

public class NoticeAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		
		NoticeDAO notice_dao = NoticeDAO.getInstance();
		
		int notice_size = notice_dao.getNoticeRowSize(univ);
		req.setAttribute("notice_size", notice_size); // notice의 총 개수 반환
				
		return "/notice/notice.jsp";
	}

}
