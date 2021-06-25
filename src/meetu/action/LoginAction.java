package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dto.MemberUserDTO;
import meetu.dto.MemberDTO;
import meetu.dto.UniversityDTO;
import meetu.dao.MemberDAO;
import meetu.dao.UniversityDAO;

public class LoginAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		MemberUserDTO m_u_dto = new MemberUserDTO();
		m_u_dto.setUser_id(req.getParameter("user_id"));
		m_u_dto.setPassword(req.getParameter("password"));
		
		String user_id = m_u_dto.getUser_id();
		String role = req.getParameter("role");
		String univ_id = "";
		int i = 0;
        char c = user_id.charAt(i);
        while(c >= 'a' && c <= 'z') {
        	univ_id += c;
        	i++;
        	if(i >= user_id.length())
        		break;
        	c = user_id.charAt(i);
        }
        
		MemberDAO m_dao = MemberDAO.getInstance();
		UniversityDAO u_dao = UniversityDAO.getInstance();
		
		UniversityDTO u_dto = u_dao.getUnivInfo(univ_id);
		MemberDTO m_dto = null;
		if(u_dto != null) {
			m_dto = m_dao.loginOk(m_u_dto, univ_id, role);
		}
		
		if (m_dto != null) { // 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("user_id", user_id); // 회원 id 저장
			session.setAttribute("mem_dto", m_dto); // 회원정보(학번,이름,역할) 저장
			session.setAttribute("univ_dto", u_dto); // 대학정보(id,이름) 저장
			
			return "indexPro.do";
		}
		else { // 로그인 실패
			return "/login/login.jsp?ck=0";
		}
	}
	
}