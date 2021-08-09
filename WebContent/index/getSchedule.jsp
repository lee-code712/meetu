<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="org.json.simple.*"%>

<%@ page import="meetu.dao.MemberDAO"%>
<%@ page import="meetu.dao.ReservationDAO"%>
<%@ page import="meetu.dto.MemberDTO"%>
<%@ page import="meetu.dto.ReservationDTO"%>
<%@ page import="meetu.dto.UniversityDTO"%>
<%@ page import="meetu.dto.ProfessorDTO"%>

<%
	ReservationDAO reservationDAO = new ReservationDAO();
	MemberDAO memberDAO = new MemberDAO();

	String user_id = (String) session.getAttribute("user_id");
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	
	ArrayList<ReservationDTO> reservations = reservationDAO.getReservationInfo(univ_dto.getUnivId(), user_id);
	
	if(reservations != null) {
		JSONObject reservationJson = new JSONObject();
		JSONArray reservationJsonArray = new JSONArray(); 
		
		for (int i = 0; i < reservations.size(); i++) {
			JSONObject r = null; // JSONArray 내에 들어갈 json
			
			String res_id = reservations.get(i).getResId();
			String start_time = reservations.get(i).getStartTime();
			String reason = reservations.get(i).getReason();
			int type = reservations.get(i).getType();
			int approval = reservations.get(i).getState();
			String reject_msg = reservations.get(i).getRejectMsg();
			String p_user_id = reservations.get(i).getPUserId();
			String s_user_id = reservations.get(i).getSUserId();
			
			// 교수 이름 가져오기
			MemberDTO memberDTO = memberDAO.getMemberInfo(univ_dto.getUnivId(), p_user_id);
			String p_name = "";
			if (memberDTO != null) {
				p_name = memberDTO.getName();
			}
				
			r = new JSONObject();
			r.put("res_id", res_id);
			r.put("start_time", start_time);
			r.put("reason", reason);
			r.put("type", type);
			r.put("approval", approval);
			r.put("reject_msg", reject_msg);
			r.put("p_user_id", p_user_id);
			r.put("s_user_id", s_user_id);
			r.put("p_name", p_name);
		
			if (r != null)
				reservationJsonArray.add(r);
		}
		
		reservationJson.put("reservation", reservationJsonArray); // json 배열을 저장
		out.println(reservationJsonArray);
	}
	else {
		response.setStatus(400); // bad request
		response.addHeader("Status", "Unregistered Reservation");
		return;
	}
%>