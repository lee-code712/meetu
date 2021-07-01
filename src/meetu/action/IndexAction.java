package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dto.MemberDTO;

public class IndexAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {		
		HttpSession session = req.getSession();
		MemberDTO m_dto = (MemberDTO) session.getAttribute("mem_dto");
		String role = m_dto.getRole();
		
		if(role.equals("0")) {
			return "/index/indexStu.jsp";
		}
		else if(role.equals("1")) {
			return "/index/indexProf.jsp"; // 아직 교수용 index페이지 구현 X
		}
		else {
			return "/index/indexStu.jsp"; // 관리자용 페이지가 없으므로 일단 학생 페이지로 이동
		}	
	}

}