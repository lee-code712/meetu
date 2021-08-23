package meetu.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dto.MemberUserDTO;
import meetu.dto.MemberDTO;
import meetu.dto.UniversityDTO;
import meetu.action.CommandAction;
import meetu.dao.MemberDAO;
import meetu.dao.UniversityDAO;

public class LoginAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		MemberUserDTO mem_usr_dto = new MemberUserDTO();
		mem_usr_dto.setUserId(req.getParameter("user_id"));
		mem_usr_dto.setPassword(req.getParameter("password"));
		
		
		String user_id = mem_usr_dto.getUserId();
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
        
		MemberDAO mem_dao = MemberDAO.getInstance();
		UniversityDAO univ_dao = UniversityDAO.getInstance();
		
		UniversityDTO univ_dto = univ_dao.getUnivInfo(univ_id);
		MemberDTO mem_dto = null;
		if(univ_dto != null) {
			mem_dto = mem_dao.loginOk(mem_usr_dto, univ_id, role);
		}
		
		if (mem_dto != null) { // 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("user_id", user_id); // 회원 id 저장
			session.setAttribute("mem_dto", mem_dto); // 회원정보(학번,이름,역할) 저장
			session.setAttribute("univ_dto", univ_dto); // 대학정보(id,이름) 저장
			
			return "index.do";
		}
		else { // 로그인 실패
			return "login.do?ck=0";
		}
	}
	
}