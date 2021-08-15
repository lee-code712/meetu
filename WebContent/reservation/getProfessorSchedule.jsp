<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="org.json.simple.*"%>

<%@ page import="meetu.dao.MemberDAO"%>
<%@ page import="meetu.dao.ReservationDAO"%>
<%@ page import="meetu.dto.MemberDTO"%>
<%@ page import="meetu.dto.ProfessorDTO"%>
<%@ page import="meetu.dto.UniversityDTO"%> 
<%@ page import="meetu.dto.MemberUserDTO"%> 
<%@ page import="meetu.dto.ReservationDTO"%>
<%@ page import="meetu.dto.ConsultableTimeDTO"%>
    
<%!@SuppressWarnings("unchecked")%>
<%
	MemberDAO memberDAO = new MemberDAO();
	ReservationDAO reservationDAO = new ReservationDAO();

	String prof_email = request.getParameter("prof_email");

	// 교수 학번 구하기
	// 모든 교수 정보를 가져옴
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	ArrayList<ProfessorDTO> professors = memberDAO.getAllProfessors(univ_dto.getUnivId());
	
	String p_user_id = "";
	for(int i = 0; i < professors.size(); i++) {
		if(professors.get(i).getEmail() != null) {
			if(professors.get(i).getEmail().equals(prof_email)) { // 이메일은 중복 불가 - 교수 구분 위해 사용
				String prof_id = professors.get(i).getProfId(); // 이메일이 같은 경우, 해당 교수 학번을 불러옴
				
				// 모든 회원 정보를 가져와 해당 교수의 id 검색
				ArrayList<MemberDTO> members = memberDAO.getAllMemberUsers(univ_dto.getUnivId());
				for (int j = 0; j < members.size(); j++) {
					if (members.get(j).getMemberId().equals(prof_id)) { 
						MemberUserDTO p_user = memberDAO.getMemberUserInfo(members.get(j), univ_dto.getUnivId());
						
						p_user_id = p_user.getUserId();
					}
				}
			}
		}
	}
	
	// 해당 교수의 상담 가능 시간 DTO
	ArrayList<ConsultableTimeDTO> consultableTimes = reservationDAO.getConsultableTimes(univ_dto.getUnivId(), p_user_id);
	
	JSONObject timeJson = new JSONObject();
	JSONArray timeJsonArray = new JSONArray(); 
	
	if (consultableTimes != null) {	
		for (int i = 0; i < consultableTimes.size(); i++) {
			JSONObject c = null; // JSONArray 내에 들어갈 json
	
			String disable_date = consultableTimes.get(i).getDisableDate(); // 0-6
			String disable_time = consultableTimes.get(i).getDisableTime(); // 15:00~17:00

			c = new JSONObject(); // JSONArray 내에 들어갈 json
	
			if (p_user_id != null)
				c.put("p_user_id", p_user_id);
			if (disable_date != null)
				c.put("disable_date", disable_date);
			if (disable_time != null)
				c.put("disable_time", disable_time);
		
			if (c != null)
				timeJsonArray.add(c);
		}
	}
	else {
		response.setStatus(400); // bad request
		response.addHeader("Status", "Unregistered professor");
		return;
	}
	
	// 해당 교수의 상담 예약된 시간도 불가능 처리
	ArrayList<ReservationDTO> reservations = reservationDAO.getReservationInfo(univ_dto.getUnivId(), p_user_id);
	
	if (reservations != null) {	
		for (int i = 0; i < reservations.size(); i++) {
			JSONObject r = null; // JSONArray 내에 들어갈 json
	
			String start_time = reservations.get(i).getStartTime();
			String end_time = reservations.get(i).getEndTime();
			int state = reservations.get(i).getState();
			
			if (state == 0 || state == 1) { // 예약 승인 대기 중 혹은 확정된 예약에 대해 예약 불가능 시간대로 지정
				r = new JSONObject(); // JSONArray 내에 들어갈 json
				
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
			            break ;
			        case 2:
			        	disable_date = "1";
			            break ;
			        case 3:
			        	disable_date = "2";
			            break ;
			        case 4:
			        	disable_date = "3";
			            break ;
			        case 5:
			        	disable_date = "4";
			            break ;
			        case 6:
			        	disable_date = "5";
			            break ;
			        case 7:
			        	disable_date = "6";
			            break ;
			             
			    }
				
			    // 불가능 시간대를 구함
				start_time = start_time.substring(11, 16);
				end_time = end_time.substring(11, 16);
				String disable_time = start_time + "~" + end_time;
				
				if (p_user_id != null)
					r.put("p_user_id", p_user_id);
				if (disable_date != null)
					r.put("disable_date", disable_date);
				if (disable_time != null)
					r.put("disable_time", disable_time);
			
				if (r != null)
					timeJsonArray.add(r);
			}
		}
	}
	
	timeJson.put("time", timeJsonArray); // json 배열을 저장
	out.println(timeJsonArray);
%>