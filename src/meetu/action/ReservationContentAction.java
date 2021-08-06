package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import meetu.dto.MemberUserDTO;
import meetu.dto.MemberDTO;
import meetu.dto.UniversityDTO;
import meetu.dto.ProfessorDTO;

import meetu.dao.MemberDAO;
import meetu.dao.ReservationDAO;

public class ReservationContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		
		String s_user_id = (String) session.getAttribute("user_id");
		String prof_email = req.getParameter("email");
		
		String p_user_id = "";
		
		// 교수 아이디 구하기
		// 모든 교수 정보를 가져옴
		MemberDAO memberDAO = new MemberDAO();
		
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		ArrayList<ProfessorDTO> professors = memberDAO.getAllProfessors(univ_dto.getUnivId());

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
		
		// 같은 교수에게 예약 레코드가 있는지 여부 구함
		ReservationDAO reservationDAO = new ReservationDAO();
		
		boolean isReservated = reservationDAO.isReservatedProfessor(univ_dto.getUnivId(), s_user_id, p_user_id);
		
		if(isReservated) { // 예약 레코드가 있는 경우 교수 선택 페이지로 리턴
			return "/reservation/reservation.jsp?isReservated=1";
		}
		else {
			return "/reservation/reservationContent.jsp";
		}
	}

}