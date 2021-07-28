<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>
<%@ page import="com.fasterxml.jackson.databind.*"%> 

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
		TreeMap<Date, ArrayList<String>> reservation_map = new TreeMap<Date, ArrayList<String>>(); // 예약정보를 시간 순으로 정렬하기 위해 treemap 사용, 근데 보낸 시간이 정확히 같으면 하나만 저장됨..
		Iterator<ReservationDTO> iterator = reservations.iterator();
		
		int approval = -1;
		if(clicked_item.equals("completeBtn")) {
			approval = 0;
		}
		else if(clicked_item.equals("cancelBtn")) {
			approval = 2;
		}
		else if(clicked_item.equals("okBtn")) {
			approval = 1;
		}
		
		while(iterator.hasNext()) {
			ReservationDTO reservation_dto = iterator.next();
			
			if(reservation_dto.getApproval() == approval) {
				String res_date = reservation_dto.getResDate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
				Date date = sdf.parse(res_date);
				
				MemberDTO member = null;
				if(reservation_dto.getSUserId().equals(user_id)) {
					member = (MemberDTO) mem_dao.getMemberInfo(univ, reservation_dto.getPUserId());
				}
				else {
					member = (MemberDTO) mem_dao.getMemberInfo(univ, reservation_dto.getSUserId());
				}
				DepartmentDTO dept_dto = mem_dao.getDepartmentInfo(member, univ);
				
				ArrayList<String> mem_list = new ArrayList<>();
				mem_list.add(reservation_dto.getResId());
				mem_list.add(member.getName());
				mem_list.add(member.getRole());
				mem_list.add(dept_dto.getDeptName());
				
				reservation_map.put(date, mem_list);
			}
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String result = mapper.writeValueAsString(reservation_map);
		// System.out.println(result);
		out.print(result);
	}
%>