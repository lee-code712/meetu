package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dto.MemberDTO;
import meetu.dto.UniversityDTO;
import meetu.dto.StudentDTO;
import meetu.dto.ProfessorDTO;
import meetu.dao.MemberDAO;

public class IndexProAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("user_id");
		MemberDTO m_dto = (MemberDTO) session.getAttribute("mem_dto");
		UniversityDTO u_dto = (UniversityDTO) session.getAttribute("univ_dto");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		if(m_dto.getRole().equals("0")) {
			StudentDTO s_dto = dao.getStudentInfo(u_dto.getUnivId(), user_id);
			session.setAttribute("stu_dto", s_dto);
			return "/index/indexStu.jsp";
		}
		else if(m_dto.getRole().equals("1")) {
			ProfessorDTO p_dto = dao.getProfessorInfo(u_dto.getUnivId(), user_id);
			session.setAttribute("prof_dto", p_dto);
			return "/index/indexProf.jsp"; // 아직 교수용 index페이지 구현 X
		}
		else {
			return "/index/indexStu.jsp"; // 관리자용 페이지가 없으므로 일단 학생 페이지로 이동
		}	
	}

}
