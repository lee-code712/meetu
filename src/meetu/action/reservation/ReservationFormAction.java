package meetu.action.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import meetu.action.CommandAction;
import meetu.dao.MemberDAO;
import meetu.dao.ReservationDAO;
import meetu.dto.*;

public class ReservationFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String s_user_id = (String) session.getAttribute("user_id");
		String p_user_id = (String) req.getParameter("p_user_id");
		
		// 예약 페이지에서 보일 교수 정보 get으로 전송
		MemberDAO mem_dao = MemberDAO.getInstance();
		MemberDTO mem_dto = mem_dao.getMemberInfo(univ, p_user_id);
		ProfessorDTO prof_dto = mem_dao.getProfessorInfo(univ, p_user_id);
		ArrayList<CourseDTO> courses = mem_dao.getCourseInfo(prof_dto, univ);
		String course = "";		
		for (int j = 0; j < courses.size(); j++) {
			if (j == courses.size() - 1)
				course += courses.get(j).getTitle();
			else
				course += courses.get(j).getTitle() + ", ";
		}
				
		String param = "p_user_id=" + p_user_id;
		param += "&name=" + mem_dto.getName();
		param += "&major=" + prof_dto.getMajor();
		param += "&email=" + prof_dto.getEmail();
		param += "&office=" + prof_dto.getOffice();
		param += "&course=" + course;

		// 같은 교수에게 예약 레코드가 있는지 여부 구함
		ReservationDAO reservationDAO = new ReservationDAO();	
		boolean isReservated = reservationDAO.isReservatedProfessor(univ_dto.getUnivId(), s_user_id, p_user_id);
		
		// 예약정보가 존재하는지 확인(예약내역 수정 시)
		ArrayList<String> reservation = (ArrayList<String>) req.getAttribute("reservation");
				
		if(reservation != null) {
			return "/reservation/reservationUpdateForm.jsp?" + param;
		}
		else {
			if(isReservated) { // 예약 레코드가 있는 경우 교수 선택 페이지로 리턴
				return "/reservation/reservationPage.jsp?isReservated=1";
			}
			else {
				return "/reservation/reservationForm.jsp?" + param;
			}
		}
	}

}