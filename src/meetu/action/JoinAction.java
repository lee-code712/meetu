package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meetu.dao.MemberDAO;
import meetu.dao.UniversityDAO;
import meetu.dto.MemberUserDTO;
import meetu.dto.UniversityDTO;

public class JoinAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		MemberDAO memDAO = MemberDAO.getInstance();
		UniversityDAO univDAO = UniversityDAO.getInstance();
		
		UniversityDTO univDTO = univDAO.getUnivInfo(req.getParameter("univ_name"));
		String univ_id = univDTO.getUnivId(); // 대학 id 검색
		
		if (univ_id.equals("-1")) { // 존재하지 않는 대학명인 경우
			return "/join/join.jsp?ck=-1";
		}
		else {
			univDTO.setUnivId(univ_id);
		}
		
		MemberUserDTO memUsrDTO = new MemberUserDTO(); // 학번, id, pw 저장
		memUsrDTO.setMember_id(req.getParameter("member_id")); // 학번 저장
		String user_id = memDAO.userIdCreate(memUsrDTO, univDTO);	 
		
		if (user_id.equals("-2")) { // 존재하지 않는 학번인 경우
			return "/join/join.jsp?ck=-2";
		}
		else if (user_id.equals("-3")) { // 이미 가입된 학번인 경우
			return "/join/join.jsp?ck=-3";
		}
		else {
			memUsrDTO.setUser_id(user_id);
			memUsrDTO.setPassword(req.getParameter("password")); // 아이디가 생성된 경우 dto에 pw 추가	
		}

		String is_added = memDAO.addUser(memUsrDTO, univDTO);
		
		if (is_added.equals("-4")) { // db에 추가 실패한 경우
			return "/join/join.jsp?ck=-4";
			
		}
		else { // 회원가입 정보 db에 추가 성공 
			return "/join/joinPro.jsp?user_id=" + user_id;
		}
	}
}
