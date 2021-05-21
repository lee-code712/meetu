package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dto.MemberUserDTO;
import meetu.dto.UniversityDTO;
import meetu.dao.MemberDAO;

public class LoginAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		MemberUserDTO m_u_dto = new MemberUserDTO();
		m_u_dto.setUser_id(req.getParameter("user_id"));
		m_u_dto.setPassword(req.getParameter("password"));
		
		String user_id = m_u_dto.getUser_id();
		String role = req.getParameter("role"); // memberDTO에 저장해서 써야 하나??
		String univ_id = ""; // universityDTO에 저장해서 써야 하나??
		int i = 0;
        char c = user_id.charAt(i);
        while(c >= 'a' && c <= 'z') {
        	univ_id += c;
        	i++;
        	if(i >= user_id.length())
        		break;
        	c = user_id.charAt(i);
        }
		
		MemberDAO dao = MemberDAO.getInstance();
		boolean ck = false;
		
		UniversityDTO u_dto = dao.getUnivInfo(univ_id);
		if(u_dto != null) {
			ck = dao.loginOk(m_u_dto, univ_id, role);
		}
		
		if (ck) { // 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("user_id", user_id);
			session.setAttribute("univ_id", univ_id);
			
			if(role.equals("0"))
				return "indexPro.do";
			else
				return "indexPro.do"; // 아직 교수용 웹 X
		}
		else { // 로그인 실패
			return "/login/login.jsp?ck=" + ck;
		}
	}
	
}