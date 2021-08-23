package meetu.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;

public class LogoutAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "loginForm.do";
	}

}