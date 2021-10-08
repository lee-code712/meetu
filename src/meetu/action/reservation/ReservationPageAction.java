package meetu.action.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import meetu.action.CommandAction;
import meetu.dao.AlertDAO;
import meetu.dao.MemberDAO;
import meetu.dao.ReservationDAO;
import meetu.dto.*;

public class ReservationPageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		MemberDTO mem_dto = (MemberDTO) session.getAttribute("mem_dto");
		String user_id = (String) session.getAttribute("user_id");
		
		MemberDAO mem_dao = MemberDAO.getInstance();
		ArrayList<ProfessorDTO> profs = null; // 조건에 해당하는 교수 정보들을 저장하는 변수
		boolean is_member = false;
		String tag = "";
		HashMap<String, Object> p_map = null; // 교수 정보 중 랜덤으로 하나를 맵으로 저장하는 변수
				
		// 학생 회원의 학과에 속하는 교수님 중 한 분의 정보를 추천
		StudentDTO stu_dto = mem_dao.getStudentInfo(univ, user_id);
		DepartmentDTO dept_dto = mem_dao.getDepartmentDTO(univ_dto, stu_dto.getDeptId());
		profs = mem_dao.professorSearchByDept(univ_dto, dept_dto.getDeptName());
		
		// 교수 정보가 null이 아니면 랜덤으로 교수 정보 반환
		if(profs != null) {
			ReservationDAO reservation_dao = ReservationDAO.getInstance();
			double random = Math.random();
			int index = (int)(random * profs.size());
			ProfessorDTO prof = profs.get(index);
			MemberDTO p_mem_dto = mem_dao.getMemberInfoByMemberID(univ, prof.getProfId());
			MemberUserDTO mem_usr_dto = mem_dao.getMemberUserInfo(p_mem_dto, univ);
			DepartmentDTO p_dept_dto = mem_dao.getDepartmentDTO(univ_dto, prof.getDeptId());
			ArrayList<String> consult_reasons = (ArrayList<String>) reservation_dao.getConsultReason(p_mem_dto, univ);

			if(consult_reasons != null) {
				Iterator<String> iterator = consult_reasons.iterator();
				while(iterator.hasNext()) {
					String reason = iterator.next();
					tag += "#" + reason + "&nbsp;";
				}
			}
			
			if(mem_usr_dto != null) {
				is_member = true;
			}
			
			ArrayList<CourseDTO> courses = mem_dao.getCourseInfo(prof, univ_dto.getUnivId());
			String course = "";
			
			for (int j = 0; j < courses.size(); j++) {
				if (j == courses.size() - 1)
					course += courses.get(j).getTitle();
				else
					course += courses.get(j).getTitle() + ", ";
			}
			
			p_map = new HashMap<>();
			
			if(mem_usr_dto != null)
				p_map.put("p_user_id", mem_usr_dto.getUserId());
			p_map.put("name", p_mem_dto.getName());
			p_map.put("dept", p_dept_dto.getDeptName());
			p_map.put("major", prof.getMajor());
			p_map.put("email", prof.getEmail());
			p_map.put("office", prof.getOffice());
			p_map.put("course", course);
			p_map.put("is_member", is_member);
			p_map.put("tag", tag);
			
			req.setAttribute("recommend_prof", p_map);
			// System.out.println(p_map);
		}
		
		
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
		
		return "/reservation/reservationPage.jsp";
	}

}