package meetu.action.reservation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.ReservationDAO;
import meetu.dao.MemberDAO;
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
		MemberDAO mem_dao = MemberDAO.getInstance();
		
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
		
		// 예약 페이지에서 보일 교수 정보 get으로 전송
		MemberDTO mem_dto = mem_dao.getMemberInfo(univ, reservation_dto.getPUserId());
		ProfessorDTO prof_dto = mem_dao.getProfessorInfo(univ, reservation_dto.getPUserId());
		ArrayList<CourseDTO> courses = mem_dao.getCourseInfo(prof_dto, univ);
		String course = "";		
		for (int j = 0; j < courses.size(); j++) {
			if (j == courses.size() - 1)
				course += courses.get(j).getTitle();
			else
				course += courses.get(j).getTitle() + ", ";
		}
		
		String param = "name=" + mem_dto.getName();
		param += "&major=" + prof_dto.getMajor();
		param += "&email=" + prof_dto.getEmail();
		param += "&office=" + prof_dto.getOffice();
		param += "&course=" + course;
		
		return "reservationForm.do?" + param;
	}
}
