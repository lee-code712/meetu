package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.ReservationDAO;
import meetu.dto.ReservationDTO;
import meetu.dto.UniversityDTO;

public class RejectMessageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();		
		String res_id = req.getParameter("res_id");
		
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		// reject message 반환
		ReservationDTO reservation_dto = new ReservationDTO();
		reservation_dto.setResId(res_id);
		reservation_dto = reservation_dao.getReservation(reservation_dto, univ);
		String reject_msg = reservation_dto.getRejectMsg();
		
		req.setAttribute("reject_msg", reject_msg);
		
		return "/myPage/rejectMessage.jsp";
	}

}