package meetu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meetu.dao.UniversityDAO;

public class UnivSearchAction {

	public String univSearch (HttpServletRequest req, HttpServletResponse res) throws Throwable {
		UniversityDAO univ_dao = UniversityDAO.getInstance();
			
		String univs = univ_dao.univNameSearch(req.getParameter("q")); // q로 시작하는 대학명 검색
		
		if (univs != null) { // 검색 결과가 존재하는 경우
			return univs;
		}
		else {
			return "해당 글자로 시작하는 대학이 존재하지 않습니다.";
		}
	}
}
