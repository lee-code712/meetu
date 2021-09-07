package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.AlertDAO;
import meetu.dto.UniversityDTO;

public class MyPageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		
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
		
		return "/myPage/myPage.jsp";
	}

}
