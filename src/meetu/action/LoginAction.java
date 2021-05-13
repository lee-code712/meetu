package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dto.MemberUserDTO;
import meetu.dao.MemberDAO;

public class LoginAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		MemberUserDTO dto = new MemberUserDTO();
		dto.setUser_id(req.getParameter("user_id"));
		dto.setPassword(req.getParameter("password"));
		
		String id = dto.getUser_id();
		String role = req.getParameter("role"); // memberDTO에 저장해서 써야 하나??
		String univ = ""; // universityDTO에 저장해서 써야 하나??
		int i = 0;
        char c = id.charAt(i);
        while(c >= 'a' && c <= 'z') {
        	univ += c;
        	i++;
        	if(i >= id.length())
        		break;
        	c = id.charAt(i);
        }
		
		MemberDAO dao = MemberDAO.getInstance();
		boolean ck = false;
		
		if(dao.univCheck(univ)) {
			ck = dao.loginOk(dto, univ, role);
		}
		
		if (ck) { // 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("user_id", id);
			
			if(role.equals("0"))
				return "/index/index.jsp";
			else
				return "/index/index.jsp"; // 아직 교수용 웹 X
		}
		else { // 로그인 실패
			return "/login/login.jsp?ck=" + ck;
		}
	}
	
}
