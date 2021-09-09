package meetu.action.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import java.text.SimpleDateFormat;
import org.json.simple.*;

import meetu.action.CommandAction;
import meetu.dao.AlertDAO;
import meetu.dao.MemberDAO;
import meetu.dao.ReservationDAO;
import meetu.dto.*;

public class ReservationFormAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		HttpSession session = req.getSession();
		UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
		String univ = univ_dto.getUnivId();
		String s_user_id = (String) session.getAttribute("user_id");
		String p_user_id = (String) req.getParameter("p_user_id");
		ArrayList<String> reservation = (ArrayList<String>) req.getAttribute("reservation");
		
		// 예약 페이지에서 보일 교수 정보 반환
		MemberDAO mem_dao = MemberDAO.getInstance();
		MemberDTO mem_dto = mem_dao.getMemberInfo(univ, p_user_id);
		DepartmentDTO dept_dto = mem_dao.getDepartmentInfo(mem_dto, univ);
		ProfessorDTO prof_dto = mem_dao.getProfessorInfo(univ, p_user_id);
		ArrayList<CourseDTO> courses = mem_dao.getCourseInfo(prof_dto, univ);
		String course = "";		
		for (int j = 0; j < courses.size(); j++) {
			if (j == courses.size() - 1)
				course += courses.get(j).getTitle();
			else
				course += courses.get(j).getTitle() + ", ";
		}
				
		String param = "p_user_id=" + p_user_id;
		param += "&prof_id=" + prof_dto.getProfId();
		param += "&name=" + mem_dto.getName();
		param += "&dept=" + dept_dto.getDeptName();
		param += "&major=" + prof_dto.getMajor();
		param += "&email=" + prof_dto.getEmail();
		param += "&office=" + prof_dto.getOffice();
		param += "&course=" + course;

		// 같은 교수에게 예약 레코드가 있는지 여부 구함
		ReservationDAO reservationDAO = new ReservationDAO();	
		boolean is_reservated = reservationDAO.isReservatedProfessor(univ, s_user_id, p_user_id);
		
		// 해당 교수의 상담 가능 시간 json배열에 저장
		ArrayList<ConsultableTimeDTO> consultable_times = reservationDAO.getConsultableTimes(univ, p_user_id);
								
		JSONObject timeJson = new JSONObject();
		JSONArray timeJsonArray = new JSONArray();
 	
		if(consultable_times == null) {
			return "reservation.do?has_consultable_time=0"; // 상담가능 시간대를 아직 작성하지 않은 경우 교수 선택 페이지로 리턴
		}
		else {
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
 
		if(reservation == null && is_reservated) { 
			return "reservation.do?is_reservated=1"; // 예약 레코드가 있는 경우 교수 선택 페이지로 리턴
		}
		else {
			// 이미 예약된 시간도 json 배열에 저장
			ArrayList<ReservationDTO> reservations = reservationDAO.getReservationInfo(univ_dto.getUnivId(), p_user_id);
						
			if(reservations != null) {
				Iterator<ReservationDTO> iterator = reservations.iterator();
							
				while(iterator.hasNext()) {
					JSONObject r = null; // JSONArray 내에 들어갈 json
					ReservationDTO reserve = iterator.next();
					String start_time = reserve.getStartTime();
					String end_time = reserve.getEndTime();
					int state = reserve.getState();
				
					if (state == 0 || state == 1) { // 예약 승인 대기 중 혹은 확정된 예약에 대해 예약 불가능 시간대로 지정
						r = new JSONObject();
									
						// 불가능 날짜의 요일을 구함
						String disable_date = "" ;
								     
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
						Date nDate = dateFormat.parse(start_time.substring(0, 10));
								     
						Calendar cal = Calendar.getInstance();
						cal.setTime(nDate);
								     
						int dayNum = cal.get(Calendar.DAY_OF_WEEK);
								    
						switch (dayNum) { // 0(일)-6(토)
							case 1:
								disable_date = "0";
								break;
							case 2:
								disable_date = "1";
								break;
							case 3:
								disable_date = "2";
								break;
							case 4:
								disable_date = "3";
								break;
							case 5:
								disable_date = "4";
								break;
							case 6:
								disable_date = "5";
								break;
							case 7:
								disable_date = "6";
								break;   
						}
									
						// 불가능 시간대를 구함
						String disable_day = start_time.substring(5, 10); 
						start_time = start_time.substring(11, 16);
						end_time = end_time.substring(11, 16);
						String disable_time = start_time + "~" + end_time;
				
						if (disable_date != null)
							r.put("disable_date", disable_date);
						if (disable_time != null)
							r.put("disable_time", disable_time);
						if(disable_day != null)
							r.put("disable_day", disable_day);
								
						if (r != null)
							timeJsonArray.add(r);
					}
				}
			}
			
			timeJson.put("time", timeJsonArray); // json 배열을 저장
			// System.out.println(timeJsonArray);
			req.setAttribute("consultable_times", timeJsonArray);	
			
			// 새로운 알림개수 검색 후 반환
			AlertDAO alert_dao = AlertDAO.getInstance();
			String count_alert = (String) session.getAttribute("count_alert");
			String now_count_alert = Integer.toString(alert_dao.getNewAlert(s_user_id, univ));
			if(count_alert == null) {
				session.setAttribute("count_alert", now_count_alert);
			}
			else if(!count_alert.equals(now_count_alert)) {
				session.setAttribute("count_alert", now_count_alert);
			}
			
			if(reservation != null) {
				return "/reservation/reservationUpdateForm.jsp?" + param; // 전달받은 예약 내역이 존재하면 예약 수정 페이지로 이동
			}
			else {
				return "/reservation/reservationForm.jsp?" + param; // 예약 내역이 없으면 예약 페이지로 이동
			}
		}
	}

}