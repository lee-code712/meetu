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
		String user_id = req.getParameter("user_id");
		String password = req.getParameter("password");
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
		
        // 필요한 인스턴스 가져오기
        MemberDAO mem_dao = MemberDAO.getInstance();
		UniversityDAO univ_dao = UniversityDAO.getInstance();
		
		// login 성공 여부 check
		MemberUserDTO mem_usr_dto = new MemberUserDTO();
		mem_usr_dto.setUserId(user_id);
		mem_usr_dto.setPassword(password);
		
		UniversityDTO univ_dto = univ_dao.getUnivInfo(univ_id);
		
		MemberDTO mem_dto = null;
		if(univ_dto != null) {
			mem_dto = mem_dao.loginOk(mem_usr_dto, univ_id, role);
		}
		
		// login 성공 여부에 따른 페이지 반환
		if (mem_dto != null) { // 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("user_id", user_id); // 회원 id 저장
			session.setAttribute("mem_dto", mem_dto); // 회원정보(학번,이름,역할) 저장
			session.setAttribute("univ_dto", univ_dto); // 대학정보(id,이름) 저장
			
			return "index.do";
		}
		else { // 로그인 실패
			return "loginForm.do?ck=0";
		}
	}
	
}