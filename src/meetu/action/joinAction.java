package meetu.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meetu.dto.UniversityDTO;
import meetu.dto.MemberUserDTO;
import meetu.dao.MemberDAO;

public class joinAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		UniversityDTO univDTO = new UniversityDTO(); // 대학명, 대학 id 저장
		univDTO.setUnivName(req.getParameter("univ_name"));
		
		MemberDAO dao = MemberDAO.getInstance();

		univDTO = dao.univSearch(univDTO); 
		
		if (univDTO.getUnivId() == null) { // 존재하지 않는 대학명인 경우
			return "/join/join.jsp?ck=-1";
		}
		
		MemberUserDTO memUsrDTO = new MemberUserDTO(); // 학번, id, pw 저장
		memUsrDTO.setMember_id(req.getParameter("member_id")); // 학번
		
		memUsrDTO = dao.memberIdCheck(memUsrDTO, univDTO);
		
		if (memUsrDTO == null) { // 존재하지 않는 학번인 경우
			return "/join/join.jsp?ck=-2";
		}
		if (memUsrDTO.getUser_id() == null) { // 중복된 학번인 경우
			return "/join/join.jsp?ck=-3";
		}

		memUsrDTO.setPassword(req.getParameter("password")); // 아이디가 생성된 경우 dto에 pw 추가	
		
		return null;
	}
}
