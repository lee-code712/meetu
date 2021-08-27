package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.ReservationDAO;
import meetu.dto.*;

public class DeleteConsultableTimeAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		String able_time = (String) req.getParameter("able_time");
		
		// 인스턴스 가져오기
		ReservationDAO reservation_dao = ReservationDAO.getInstance();

		// consultable_time 추가
		ConsultableTimeDTO consultable_time_dto = new ConsultableTimeDTO();
		String day = able_time.substring(0, 1);
		String time = able_time.substring(2, able_time.length());
		
		consultable_time_dto.setAbleDate(day);
		consultable_time_dto.setAbleTime(time);
		consultable_time_dto.setPUserId(user_id);
		
		boolean delete_success = reservation_dao.deleteConsultableTime(consultable_time_dto, univ);
		if(!delete_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "change state failed");
		}
		
		return "profInfoPage.do";
	}
}
