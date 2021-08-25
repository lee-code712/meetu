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

<%!
	public static Comparator<ReservationDTO> ReservationsComparator = new Comparator<ReservationDTO>() 
	{
	    @Override
	    public int compare(ReservationDTO r1, ReservationDTO r2) {
	        return ((r1.getStartTime()).compareTo(r2.getStartTime()));
	    }
	};
%>

<%
	ReservationDAO reservation_dao = ReservationDAO.getInstance();
	MemberDAO member_dao = MemberDAO.getInstance();

	String user_id = (String) session.getAttribute("user_id");
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	MemberDTO logined_member_dto = (MemberDTO) session.getAttribute("mem_dto");
	
	ArrayList<ReservationDTO> reservations = reservation_dao.getReservationInfo(univ_dto.getUnivId(), user_id);
	
	if(reservations != null) {
		reservations.sort(ReservationsComparator);
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
			
			// 이름 가져오기
			MemberDTO member_dto = null;
			String name = "";
			if (logined_member_dto.getRole().equals("1")) { // 교수 회원의 경우
				member_dto = member_dao.getMemberInfo(univ_dto.getUnivId(), s_user_id); // 학생의 이름이 달력에 출력되어야 함
			}
			else { // 학생 회원의 경우
				member_dto = member_dao.getMemberInfo(univ_dto.getUnivId(), p_user_id);
			}
			
			if (member_dto != null) {
				name = member_dto.getName();
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
			r.put("name", name);
		
			if (r != null) {
				reservationJsonArray.add(r);
			}
				
		}
		
		reservationJson.put("reservation", reservationJsonArray); // json 배열을 저장
		out.println(reservationJsonArray);
	}
	else {
		return;
	}
%>