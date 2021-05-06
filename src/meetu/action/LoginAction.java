package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meetu.dto.MemberDTO;
import meetu.dao.LoginDAO;

public class LoginAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		//데이베이스 접근하고
		//받아온 정보를 가지고 실제 데이터베이와 비교해서
		
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(req.getParameter("user_id"));
		dto.setPassword(req.getParameter("password"));
		dto.setRoll(req.getParameter("roll"));
		
		LoginDAO dao = LoginDAO.getInstance();
		dto = dao.loginOk(dto);
		
		if (dto != null) { // 로그인 성공
			req.setAttribute("dto", dto);
			
			if(dto.getRoll().equals("s"))
				return "/index/index.jsp";
			else
				return "/index/index.jsp"; // 아직 교수용 웹 X
		}
		else // 로그인 실패
			return "/login/login.jsp?ck=-1";
	}

}
