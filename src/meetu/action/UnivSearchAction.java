package meetu.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meetu.dto.UniversityDTO;
import meetu.dao.UnivSearchDAO;

public class UnivSearchAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		UniversityDTO dto = new UniversityDTO();
		dto.setUnivName(req.getParameter("univ_name"));
		
		UnivSearchDAO dao = UnivSearchDAO.getInstance();
		
		ArrayList<UniversityDTO> univs = dao.univSearch(dto);
		
		if (univs != null) { // 로그인 성공
			req.setAttribute("dto", dto);
			
			return "/index/index.jsp";
		}
		else // 로그인 실패
			return "/login/login.jsp?ck=-1";
	}

}
