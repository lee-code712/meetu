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
			return "/index/indexAdmin.jsp"; // 관리자용 index페이지 일단 분리
		}	
	}

}