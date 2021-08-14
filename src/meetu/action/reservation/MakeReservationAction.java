package meetu.action.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.*;
import meetu.dto.*;
import java.util.*;
import java.io.PrintWriter;

public class MakeReservationAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		String prof_email = req.getParameter("prof_email");
		String choiceMonth = req.getParameter("choiceMonth");
		String choiceDay = req.getParameter("choiceDay");
		String startTime = req.getParameter("startTime");
		String consultTime = req.getParameter("consultTime");
		String typeBtn = req.getParameter("type");
		String radio = req.getParameter("radio");
		
		MemberDAO memberDAO = new MemberDAO();
		
		// 예약 일시 생성 - 21/07/28 09:00:00의 형식
		Calendar cal = Calendar.getInstance();
		String year = Integer.toString(cal.get(Calendar.YEAR));
		year = year.substring(2, 4);
		
		String start_time = year + "/" + choiceMonth + "/" + choiceDay + " " + startTime + ":00";
		
		// end_time 생성 - 21/07/28 09:00:00의 형식
		cal = Calendar.getInstance();
		year = Integer.toString(cal.get(Calendar.YEAR));
		
		String[] startTimeArr = startTime.split(":"); // 09:00을 09, 00으로 분리
		int start_timeInt =  Integer.parseInt(startTimeArr[0]); // 09만 이용
		int consultTimeInt = Integer.parseInt(consultTime.replaceAll("[^0-9]", ""));
		int endTimeInt = start_timeInt + consultTimeInt;
		
		String endTime = "";
		if (endTimeInt < 10) { // 시간이 한 자리 수인 경우 0을 붙여서 09와 같이 두 자리 수로 만들어 주어야 함
			endTime = "0" + Integer.toString(start_timeInt + consultTimeInt);
		}
		else {
			endTime = Integer.toString(start_timeInt + consultTimeInt);
		}
		
		String end_time = year + "/" + choiceMonth + "/" + choiceDay + " " + endTime + ":00:00";
		
		// 온라인/오프라인 상담 구분. 오프라인 0, 온라인 1
		int type;
		if(typeBtn.equals("오프라인")) {
			type = 0;
		}
		else {
			type = 1;
		}
		
		// 교수 아이디 구하기
		// 모든 교수 정보를 가져옴
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		ArrayList<ProfessorDTO> professors = memberDAO.getAllProfessors(univ_dto.getUnivId());
		
		String p_user_id = "";
		for(int i = 0; i < professors.size(); i++) {
			if(professors.get(i).getEmail().equals(prof_email)) { // 이메일은 중복 불가 - 교수 구분 위해 사용
				String prof_id = professors.get(i).getProfId(); // 이메일이 같은 경우, 해당 교수 학번을 불러옴
				
				// 모든 회원 정보를 가져와 해당 교수의 id 검색
				ArrayList<MemberDTO> members = memberDAO.getAllMemberUsers(univ_dto.getUnivId());
				for (int j = 0; j < members.size(); j++) {
					if (members.get(j).getMemberId().equals(prof_id)) { 
						MemberUserDTO p_user = memberDAO.getMemberUserInfo(members.get(j), univ_dto.getUnivId());
						
						p_user_id = p_user.getUserId();
					}
				}
			}
		}
		
		// 상담 이유
		String reason = "";
		if (radio.equals("1")) {
			reason = "전담 교수 상담";
		}
		else if (radio.equals("2")) {
			reason = "진로 상담";
		}
		else if (radio.equals("3")) {
			reason = "휴학 상담";
		}
		else if (radio.equals("4")) {
			reason = "대학원 상담";
		}
		else {
			reason = radio; // 기타
		}
		
		ReservationDAO reservationDAO = new ReservationDAO();
		boolean is_added = reservationDAO.makeReservation(univ_dto.getUnivId(), start_time, end_time, reason, type, p_user_id, (String)session.getAttribute("user_id"));
		
		if(!is_added) {
			res.setStatus(400); // bad request
			res.addHeader("Status", "add reservation failed");
		}
		req.setAttribute("add_ck", "성공");
		
		return "reservation.do";
	}

}