package meetu.action.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.action.CommandAction;
import meetu.dao.MemberDAO;
import meetu.dto.*;

public class AddClassAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		MemberDTO mem_dto = (MemberDTO) session.getAttribute("mem_dto");
		String course_id = (String) req.getParameter("course_id");
		
		// 인스턴스 가져오기
		MemberDAO mem_dao = MemberDAO.getInstance();

		// class 추가
		CourseDTO course_dto = new CourseDTO();
		course_dto.setCourseId(course_id);
		
		boolean add_success = mem_dao.addClass(course_dto, mem_dto.getMemberId(), univ);
		if(!add_success) {
			res.setStatus(400);		// bad request
			res.addHeader("Status", "change state failed");
		}
		
		return "profInfoPage.do";
	}
}
