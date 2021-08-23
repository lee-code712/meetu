package meetu.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meetu.action.CommandAction;

public class FindPwdFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		return "/login/findPwdForm.jsp";
	}

}