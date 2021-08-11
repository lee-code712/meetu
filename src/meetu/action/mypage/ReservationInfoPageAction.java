package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;

import meetu.action.CommandAction;
import meetu.dao.MemberDAO;
import meetu.dao.ReservationDAO;
import meetu.dto.*;

public class ReservationInfoPageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();		
		String res_id = req.getParameter("res_id");
		
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		MemberDAO mem_dao = MemberDAO.getInstance();
		
		ReservationDTO reservation_dto = new ReservationDTO();
		reservation_dto.setResId(res_id);
		reservation_dto = reservation_dao.getReservation(reservation_dto, univ);
		
		MemberDTO s_mem_dto = mem_dao.getMemberInfo(univ, reservation_dto.getSUserId());
		MemberDTO p_mem_dto = mem_dao.getMemberInfo(univ, reservation_dto.getPUserId());
		
		DepartmentDTO s_dept_dto = mem_dao.getDepartmentInfo(s_mem_dto, univ);
		DepartmentDTO p_dept_dto = mem_dao.getDepartmentInfo(p_mem_dto, univ);
		
		StudentDTO stu_dto = mem_dao.getStudentInfo(univ, reservation_dto.getSUserId());
		ProfessorDTO prof_dto = mem_dao.getProfessorInfo(univ, reservation_dto.getPUserId());
		
		ArrayList<String> stu_info = new ArrayList<>();
		stu_info.add(s_mem_dto.getName());
		stu_info.add(s_dept_dto.getDeptName());
		stu_info.add(Integer.toString(stu_dto.getYear()));
		stu_info.add(stu_dto.getEmail());
		
		ArrayList<String> prof_info = new ArrayList<>();
		prof_info.add(p_mem_dto.getName());
		prof_info.add(p_dept_dto.getDeptName());
		prof_info.add(prof_dto.getEmail());
		
		req.setAttribute("reservation_dto", reservation_dto);
		req.setAttribute("stu_info", stu_info);
		req.setAttribute("prof_info", prof_info);
		
		return "/myPage/reservationInfoPage.jsp";
	}

}