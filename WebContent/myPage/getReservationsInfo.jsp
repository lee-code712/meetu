<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>
<%@ page import="org.json.simple.*"%> 

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
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	String user_id = (String) session.getAttribute("user_id");
	String clicked_item = request.getParameter("clicked_item");
	
	// 인스턴스 가져오기
	MemberDAO mem_dao = MemberDAO.getInstance();
	ReservationDAO reservation_dao = ReservationDAO.getInstance();

	// reseved list json 만들어 반환
	ArrayList<ReservationDTO> reservations = (ArrayList<ReservationDTO>) reservation_dao.getReservationInfo(univ, user_id);
	
	if(reservations != null) {
		reservations.sort(ReservationsComparator);
		JSONArray resJsonArray = new JSONArray();
		
		int state = -1;
		if(clicked_item.equals("bookedList")) {
			state = 0;
		}
		else if(clicked_item.equals("approvedList")) {
			state = 1;
		}
		else if(clicked_item.equals("completedList")) {
			state = 3;
		}
		
		Iterator<ReservationDTO> iterator = reservations.iterator();

		while(iterator.hasNext()) {
			HashMap<String, String> mem_map = new HashMap<>();
			ReservationDTO reservation_dto = iterator.next();
						
			MemberDTO member = null;
			if(reservation_dto.getSUserId().equals(user_id)) {
				member = (MemberDTO) mem_dao.getMemberInfo(univ, reservation_dto.getPUserId());
			}
			else {
				member = (MemberDTO) mem_dao.getMemberInfo(univ, reservation_dto.getSUserId());
			}
			ProfessorDTO prof_dto = mem_dao.getProfessorInfo(univ, reservation_dto.getPUserId());
		
			if(clicked_item.equals("canceledList")) {
				if(reservation_dto.getState() == 2 || reservation_dto.getState() == 4) {
					JSONObject r = null;
					
					mem_map.put("name", member.getName());
					mem_map.put("role", member.getRole());
					mem_map.put("res_id", reservation_dto.getResId());
					mem_map.put("state", Integer.toString(reservation_dto.getState()));
					mem_map.put("start_time", reservation_dto.getStartTime());
					mem_map.put("end_time", reservation_dto.getEndTime());
					if(reservation_dto.getType() == 0) {
						mem_map.put("type", "오프라인");
					}
					else {
						mem_map.put("type", "온라인");
					}
					mem_map.put("reject_msg", reservation_dto.getRejectMsg());
					mem_map.put("office", prof_dto.getOffice());

					r = new JSONObject(mem_map);
					resJsonArray.add(r);
				}
			}
			else {
				if(reservation_dto.getState() == state) {
					JSONObject r = null;
					
					mem_map.put("name", member.getName());
					mem_map.put("role", member.getRole());
					mem_map.put("res_id", reservation_dto.getResId());
					mem_map.put("state", Integer.toString(reservation_dto.getState()));
					mem_map.put("start_time", reservation_dto.getStartTime());
					mem_map.put("end_time", reservation_dto.getEndTime());
					if(reservation_dto.getType() == 0) {
						mem_map.put("type", "오프라인");
					}
					else {
						mem_map.put("type", "온라인");
					}
					mem_map.put("reject_msg", reservation_dto.getRejectMsg());
					mem_map.put("office", prof_dto.getOffice());

					r = new JSONObject(mem_map);
					resJsonArray.add(r);
				}	
			}
		}
		
		// System.out.println(resJsonArray);
		out.print(resJsonArray);
	}
%>