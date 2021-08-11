package meetu.action.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.ReservationDAO;
import meetu.action.CommandAction;
import meetu.dao.MemberDAO;
import meetu.dto.UniversityDTO;
import meetu.dto.ReservationDTO;
import meetu.dto.StudentDTO;
import meetu.dto.ConsultDTO;
import meetu.dto.MemberDTO;
import meetu.dto.ProfessorDTO;
import meetu.dto.DepartmentDTO;

public class ConsultationRecordPageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();		
		String res_id = req.getParameter("res_id");
		
		// 예약정보 및 상담기록정보 반환
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		MemberDAO mem_dao = MemberDAO.getInstance();
		
		ReservationDTO reservation_dto = new ReservationDTO();
		reservation_dto.setResId(res_id);
		reservation_dto = reservation_dao.getReservation(reservation_dto, univ);
		
		// 해당하는 예약의 상담기록이 있는지 확인
		ConsultDTO consult_dto = reservation_dao.getConsult(reservation_dto, univ); 
		
		if(consult_dto == null) { // 상담기록이 없으면
			consult_dto = new ConsultDTO();
			consult_dto.setResId(res_id);
			consult_dto.setContent(" ");
			boolean add_success = reservation_dao.addConsult(consult_dto, univ);
			if(!add_success) {
				res.setStatus(400);		// bad request
				res.addHeader("Status", "add consult failed");
			}
		}
		
		MemberDTO s_mem_dto = mem_dao.getMemberInfo(univ, reservation_dto.getSUserId());
		MemberDTO p_mem_dto = mem_dao.getMemberInfo(univ, reservation_dto.getPUserId());
		
		DepartmentDTO s_dept_dto = mem_dao.getDepartmentInfo(s_mem_dto, univ);
		DepartmentDTO p_dept_dto = mem_dao.getDepartmentInfo(p_mem_dto, univ);
		
		StudentDTO stu_dto = mem_dao.getStudentInfo(univ, reservation_dto.getSUserId());
		
		ArrayList<String> stu_info = new ArrayList<>();
		stu_info.add(s_mem_dto.getName());
		stu_info.add(s_dept_dto.getDeptName());
		stu_info.add(Integer.toString(stu_dto.getYear()));
		stu_info.add(s_mem_dto.getMemberId());
		
		ArrayList<String> prof_info = new ArrayList<>();
		prof_info.add(p_mem_dto.getName());
		prof_info.add(p_dept_dto.getDeptName());
		prof_info.add(p_mem_dto.getMemberId());

		// 필요한 정보들 request로 전달
		req.setAttribute("reservation_dto", reservation_dto);
		req.setAttribute("consult_dto", consult_dto);
		req.setAttribute("stu_info", stu_info);
		req.setAttribute("prof_info", prof_info);
		
		return "/myPage/consultationRecordPage.jsp";
	}

}