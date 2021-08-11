package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meetu.action.CommandAction;

public class WriteRejectMessagePageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {	
		return "/myPage/writeRejectMessagePage.jsp";
	}

}

