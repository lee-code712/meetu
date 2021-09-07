package meetu.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;

public class LogoutAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		// 세션 강제종료
		HttpSession session = req.getSession();
		session.invalidate();
		
		// 로그인 페이지 반환
		return "loginForm.do";
	}

}