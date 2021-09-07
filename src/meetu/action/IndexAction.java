package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.AlertDAO;
import meetu.dto.MemberDTO;
import meetu.dto.UniversityDTO;

public class IndexAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {		
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		MemberDTO m_dto = (MemberDTO) session.getAttribute("mem_dto");
		String role = m_dto.getRole();
		
		// 새로운 알림개수 검색 후 반환
		AlertDAO alert_dao = AlertDAO.getInstance();
		String count_alert = (String) session.getAttribute("count_alert");
		String now_count_alert = Integer.toString(alert_dao.getNewAlert(user_id, univ));
		if(count_alert == null) {
			session.setAttribute("count_alert", now_count_alert);
		}
		else if(!count_alert.equals(now_count_alert)) {
			session.setAttribute("count_alert", now_count_alert);
		}
		
		if(role.equals("2")) {
			return "notice.do"; // 관리자인 경우 공지사항 페이지만 접근
		}
		else {
			return "/index/indexPage.jsp";
		}	
	}

}