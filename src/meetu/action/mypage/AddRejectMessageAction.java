package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.ReservationDAO;
import meetu.action.CommandAction;
import meetu.dto.*;

public class AddRejectMessageAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();		
		String res_id = req.getParameter("res_id");
		String sender = req.getParameter("sender");
		String reject_msg = req.getParameter("reject_msg");
		
		// 인스턴스 가져오기
		ReservationDAO reservation_dao = ReservationDAO.getInstance();

		// reject_msg 추가
		ReservationDTO reservation_dto = new ReservationDTO();
		reservation_dto.setResId(res_id);
		reservation_dto.setRejectMsg(sender + "/" + reject_msg);
			
		boolean change_success = false;
		change_success = reservation_dao.addRejectMessage(reservation_dto, univ);
			
		if(!change_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "add reject message failed");
		}
		
		return "myPage.do";
	}
}
