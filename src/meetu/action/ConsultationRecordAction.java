package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.ReservationDAO;
import meetu.dao.MemberDAO;
import meetu.dto.UniversityDTO;
import meetu.dto.ReservationDTO;
import meetu.dto.ConsultDTO;
import meetu.dto.MemberDTO;
import meetu.dto.DepartmentDTO;

public class ConsultationRecordAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();		
		String res_id = req.getParameter("res_id");
		
		// 예약정보 및 상담기록정보 반환
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		ReservationDTO reservation_dto = new ReservationDTO();
		reservation_dto.setResId(res_id);
		reservation_dto = reservation_dao.getReservation(reservation_dto, univ); // 해당하는 예약 정보를 가져옴
		
		ConsultDTO consult_dto = reservation_dao.getConsult(reservation_dto, univ); // 해당하는 예약의 상담기록이 있는지 확인
		
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
		
		// 상담을 받은 학생 정보 반환
		MemberDAO mem_dao = MemberDAO.getInstance();
		MemberDTO mem_dto = mem_dao.getMemberInfo(univ, reservation_dto.getSUserId());
		DepartmentDTO dept_dto = mem_dao.getDepartmentInfo(mem_dto, univ);
		
		// 필요한 정보들 request로 전달
		req.setAttribute("reservation_dto", reservation_dto);
		req.setAttribute("consult_dto", consult_dto);
		req.setAttribute("stu_mem_dto", mem_dto);
		req.setAttribute("stu_dept_dto", dept_dto);
		
		return "/myPage/consultationRecord.jsp";
	}

}