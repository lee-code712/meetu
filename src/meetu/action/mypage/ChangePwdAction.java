package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.MemberDAO;
import meetu.dto.*;

public class ChangePwdAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		String old_pwd = req.getParameter("old_pwd");
		String new_pwd = req.getParameter("new_pwd");
		String new_pwd_ck = req.getParameter("new_pwd_ck");
		
		// 인스턴스 가져오기
		MemberDAO mem_dao = MemberDAO.getInstance();
		
		MemberUserDTO mem_usr_dto = new MemberUserDTO();
		mem_usr_dto.setUserId(user_id);
		mem_usr_dto.setPassword(old_pwd);
		
		// 현재 비밀번호 확인
		boolean old_pwd_ck = mem_dao.checkPwd(mem_usr_dto, univ);
		
		// 상황에 따라 페이지 반환
		if(old_pwd_ck) {
			if(new_pwd.equals(new_pwd_ck)) {
				mem_usr_dto.setPassword(new_pwd);
				boolean change_success = mem_dao.changePwd(mem_usr_dto, univ);
				if(!change_success) {
					res.setStatus(400); // bad request
					res.addHeader("Status", "change password failed");
				}
				return "myPage.do?change_pwd=1";
			}
			else { // 새 비밀번호와 새 비밀번호 확인 값이 같지 않는 경우
				return "changePwdForm.do?change_pwd=-2";
			}
		}
		else { // 현재 비밀번호가 맞지 않는 경우
			return "changePwdForm.do?change_pwd=-1";
		}
	}
	
}
