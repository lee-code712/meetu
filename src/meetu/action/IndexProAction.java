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
			StudentDTO stu_dto = dao.getStudentInfo(u_dto.getUnivId(), user_id);
			session.setAttribute("stu_dto", stu_dto);
		}
		else if(m_dto.getRole().equals("1")) {
			ProfessorDTO prof_dto = dao.getProfessorInfo(u_dto.getUnivId(), user_id);
			session.setAttribute("prof_dto", prof_dto);
		}	
		
		return "index.do";
	}

}
