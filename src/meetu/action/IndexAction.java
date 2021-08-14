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
		
		if(role.equals("2")) {
			return "notice.do"; // 관리자인 경우 공지사항 페이지만 접근
		}
		else {
			return "/index/indexPage.jsp";
		}	
	}

}