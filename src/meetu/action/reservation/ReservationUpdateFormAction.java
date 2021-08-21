package meetu.action.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.ReservationDAO;
import meetu.dto.*;

public class ReservationUpdateFormAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();	
		String res_id = (String) req.getParameter("res_id");
		
		// 수정할 예약 정보 attribute에 저장
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		
		ReservationDTO reservation_dto = new ReservationDTO();
		reservation_dto.setResId(res_id);
		reservation_dto = reservation_dao.getReservation(reservation_dto, univ);
		
		ArrayList<String> reservation = new ArrayList<>();
		reservation.add(reservation_dto.getResId());
		reservation.add(reservation_dto.getStartTime().substring(5,7)); // month
		reservation.add(reservation_dto.getStartTime().substring(8,10)); // day
		reservation.add(reservation_dto.getStartTime().substring(11,16)); // start_time
		reservation.add(reservation_dto.getEndTime().substring(11,16)); // end_time
		reservation.add(reservation_dto.getReason());
		reservation.add(Integer.toString(reservation_dto.getType()));
		reservation.add(reservation_dto.getPUserId());
		reservation.add(reservation_dto.getSUserId());
		
		req.setAttribute("reservation", reservation);
		
		return "reservationForm.do?p_user_id=" + reservation_dto.getPUserId();
	}
}
