package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dao.MemberDAO;
import meetu.dao.UniversityDAO;
import meetu.dto.StudentDTO;
import meetu.dto.ProfessorDTO;
import meetu.dto.MemberUserDTO;
import meetu.dto.UniversityDTO;

public class JoinAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		MemberDAO mem_dao = MemberDAO.getInstance();
		UniversityDAO univ_dao = UniversityDAO.getInstance();
		HttpSession session = req.getSession();

		UniversityDTO univ_dto = univ_dao.getUnivInfoByName(req.getParameter("univ_name"));
		String univ_id = univ_dto.getUnivId(); // 대학 id 검색
		
		if (univ_id.equals("-1")) { // 존재하지 않는 대학명인 경우
			return "/join/join.jsp?ck=-1";
		}
		else {
			univ_dto.setUnivId(univ_id);
			session.setAttribute("univ_dto", univ_dto);
		}
		
		MemberUserDTO mem_usr_dto = new MemberUserDTO(); // 학번, id, pw 저장
		String member_id = req.getParameter("member_id");
		mem_usr_dto.setMemberId(member_id); // 학번 저장
		String user_id = mem_dao.userIdCreate(mem_usr_dto, univ_dto);	 
		
		if (user_id.equals("-2")) { // 존재하지 않는 학번인 경우
			return "/join/join.jsp?ck=-2";
		}
		else if (user_id.equals("-3")) { // 이미 가입된 학번인 경우
			return "/join/join.jsp?ck=-3";
		}
		else {
			mem_usr_dto.setUserId(user_id);
			mem_usr_dto.setPassword(req.getParameter("password")); // 아이디가 생성된 경우 dto에 pw 추가	
			
			// 이메일 검색
			String role = req.getParameter("role");
			String email = "";
			if (role.equals("student")) {
				StudentDTO stu_dto = mem_dao.getStudent(univ_id, member_id);
				if (stu_dto != null) {
					email = stu_dto.getEmail();
				}
			}
			else {
				ProfessorDTO prof_dto = mem_dao.getProfessor(univ_id, member_id);
				if (prof_dto != null) {
					email = prof_dto.getEmail();
				}
			}
			
			if (email != null) {
				session.setAttribute("email", email);
			}
			
			session.setAttribute("mem_usr_dto", mem_usr_dto);
		}
		
		return "joinSendMail.do";

		/*
		 * String is_added = mem_dao.addUser(mem_usr_dto, univ_dto);
		 * 
		 * if (is_added.equals("-4")) { // db에 추가 실패한 경우 return "/join/join.jsp?ck=-4";
		 * return "/join/join.jsp?ck=-4"; } else { // 회원가입 정보 db에 추가 성공 return
		 * "/join/joinPro.jsp?user_id=" + user_id; return "/join/joinPro.jsp?user_id=" +
		 * user_id; }
		 */
	}
}
