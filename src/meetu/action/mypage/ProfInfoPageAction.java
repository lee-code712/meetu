package meetu.action.mypage;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import meetu.action.CommandAction;
import meetu.dao.MemberDAO;
import meetu.dao.ReservationDAO;
import meetu.dto.*;

public class ProfInfoPageAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {	
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String user_id = (String) session.getAttribute("user_id");
		MemberDTO mem_dto = (MemberDTO) session.getAttribute("mem_dto");
		
		// 교수정보 페이지에서 보일 교수 정보 반환
		MemberDAO mem_dao = MemberDAO.getInstance();
		DepartmentDTO dept_dto = mem_dao.getDepartmentInfo(mem_dto, univ);
		ProfessorDTO prof_dto = mem_dao.getProfessorInfo(univ, user_id);
		ArrayList<CourseDTO> courses = mem_dao.getCourseInfo(prof_dto, univ);
		String course = "";		
		for (int j = 0; j < courses.size(); j++) {
			if (j == courses.size() - 1)
				course += courses.get(j).getTitle();
			else
				course += courses.get(j).getTitle() + ", ";
		}
		
		String param = "&name=" + mem_dto.getName();
		param += "&dept=" + dept_dto.getDeptName();
		param += "&major=" + prof_dto.getMajor();
		param += "&email=" + prof_dto.getEmail();
		param += "&office=" + prof_dto.getOffice();
		param += "&course=" + course;
		
		// 교수정보 페이지에서 보일 상담가능시간 반환
		ReservationDAO reservation_dao = ReservationDAO.getInstance();
		ArrayList<ConsultableTimeDTO> consultable_times = reservation_dao.getConsultableTimes(univ, user_id);
										
		JSONObject timeJson = new JSONObject();
		JSONArray timeJsonArray = new JSONArray();
		
		if(consultable_times != null) {
		Iterator<ConsultableTimeDTO> iterator = consultable_times.iterator();
		
		while(iterator.hasNext()) {
				JSONObject c = null; // JSONArray 내에 들어갈 json
				ConsultableTimeDTO consultable_time = iterator.next();
				String able_date = consultable_time.getAbleDate(); // 0-6
				String able_time = consultable_time.getAbleTime(); // 15:00~17:00
										
				c = new JSONObject();
						
				if (able_date != null)
					c.put("able_date", able_date);
				if (able_time != null)
					c.put("able_time", able_time);
									
				if (c != null)
					timeJsonArray.add(c);
			}
		}
		
		timeJson.put("time", timeJsonArray); // json 배열을 저장
		req.setAttribute("consultable_times", timeJsonArray);
		
		return "/myPage/profInfoPage.jsp?" + param;
	}

}
