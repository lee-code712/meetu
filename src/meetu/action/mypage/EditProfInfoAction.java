package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.MemberDAO;
import meetu.dto.*;

public class EditProfInfoAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		MemberDTO mem_dto = (MemberDTO) session.getAttribute("mem_dto");
		String column = (String) req.getParameter("item");
		String value = (String) req.getParameter("value");
		
		// 인스턴스 가져오기
		MemberDAO mem_dao = MemberDAO.getInstance();

		// prof_info 변경
		ProfessorDTO prof_dto = new ProfessorDTO();
		prof_dto.setProfId(mem_dto.getMemberId());
		if(column.equals("major")) {
			prof_dto.setMajor(value);
		}
		else if(column.equals("email")) {
			prof_dto.setEmail(value);
		}
		else if(column.equals("office")) {
			prof_dto.setOffice(value);
		}
		
		boolean change_success = mem_dao.changeProfInfo(prof_dto, column, univ);
		if(!change_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "change state failed");
		}
		
		return "profInfoPage.do";
	}
}
