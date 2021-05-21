package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dto.MemberDTO;
import meetu.dto.UniversityDTO;
import meetu.dao.MemberDAO;

public class IndexProAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("user_id");
		String univ_id = (String) session.getAttribute("univ_id");
		
		MemberDAO dao = MemberDAO.getInstance();		
		MemberDTO m_dto = dao.getStudentInfo(univ_id, user_id);
		UniversityDTO u_dto = dao.getUnivInfo(univ_id);
		
		req.setAttribute("mem_dto", m_dto);
		req.setAttribute("univ_dto", u_dto);
				
		return "/index/index.jsp";
	}

}
