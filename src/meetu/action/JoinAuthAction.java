package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.MemberDAO;
import meetu.dto.MemberUserDTO;
import meetu.dto.UniversityDTO;

public class JoinAuthAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		MemberDAO mem_dao = MemberDAO.getInstance();
		HttpSession session = req.getSession();
		
		MemberUserDTO mem_usr_dto = (MemberUserDTO) session.getAttribute("mem_usr_dto");
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		
		String input_code = req.getParameter("input_code");
		String code = (String) session.getAttribute("authNum");
		
		if (input_code.equals(code)) {
			String is_added = mem_dao.addUser(mem_usr_dto, univ_dto);
			 
			if (is_added.equals("-4")) { // db에 추가 실패한 경우 return "/join/join.jsp?ck=-4";
				return "/join/join.jsp?ck=-4";
			}
			else { // 회원가입 정보 db에 추가 성공 return "/join/joinPro.jsp?user_id=" + user_id;
				String user_id = mem_usr_dto.getUserId();
				return "/join/joinPro.jsp?user_id=" + user_id;
			}
		}
		else {
			return "joinAuthForm.do?ck=-1"; // 메일 인증에 실패한 경우
		}
	}
}
