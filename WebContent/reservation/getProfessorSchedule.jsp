<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*"%>
<%@ page import="org.json.simple.*"%>

<%@ page import="meetu.dao.MemberDAO"%>
<%@ page import="meetu.dao.ReservationDAO"%>
<%@ page import="meetu.dto.MemberDTO"%>
<%@ page import="meetu.dto.ProfessorDTO"%>
<%@ page import="meetu.dto.UniversityDTO"%> 
<%@ page import="meetu.dto.MemberUserDTO"%> 
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
	
	// 해당 교수의 상담 가능 시간 DTO
	ArrayList<ConsultableTimeDTO> consultableTimes = reservationDAO.getConsultableTimes(univ_dto.getUnivId(), p_user_id);
	
	if (consultableTimes != null) {	
		JSONObject timeJson = new JSONObject();
		JSONArray timeJsonArray = new JSONArray(); 
		
		for (int i = 0; i < consultableTimes.size(); i++) {
			JSONObject c = null; // JSONArray 내에 들어갈 json
	
			String disable_date = consultableTimes.get(i).getDisableDate();
			String disable_time = consultableTimes.get(i).getDisableTime();

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
		
		timeJson.put("time", timeJsonArray); // json 배열을 저장
		out.println(timeJsonArray);
	}
	else {
		response.setStatus(400); // bad request
		response.addHeader("Status", "Unregistered professor");
		return;
	}
%>