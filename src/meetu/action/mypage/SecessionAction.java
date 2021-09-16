package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.MemberDAO;
import meetu.dao.ReservationDAO;
import meetu.dto.*;

public class SecessionAction implements CommandAction {
	
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		MemberDTO mem_dto = (MemberDTO) session.getAttribute("mem_dto");
		String user_id = (String) session.getAttribute("user_id");
		String pwd = req.getParameter("pwd");
		
		// 인스턴스 가져오기
		MemberDAO mem_dao = MemberDAO.getInstance();
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		
		MemberUserDTO mem_usr_dto = new MemberUserDTO();
		mem_usr_dto.setUserId(user_id);
		mem_usr_dto.setPassword(pwd);
		
		// 비밀번호 확인
		boolean pwd_ck = mem_dao.checkPwd(mem_usr_dto, univ);
		
		// 상황에 따라 페이지 반환
		if(pwd_ck) {
			boolean delete_success = mem_dao.deleteMemberUser(mem_usr_dto, univ);
			if(!delete_success) {
				res.setStatus(400);		// bad request
				res.addHeader("Status", "delete member user failed");
			}
			
			boolean change_success = reservation_dao.updateResId(mem_dto, univ);
			if(!change_success) {
				res.setStatus(400);		// bad request
				res.addHeader("Status", "change res_id failed");
			}
			
			return "loginForm.do?sc=1";
		}
		else { // 현재 비밀번호가 맞지 않는 경우
			return "secessionForm.do?pwd_ck=-1";
		}
	}
	
}