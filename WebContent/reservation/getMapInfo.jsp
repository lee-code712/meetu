<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.ReservationDAO"%>
<%@ page import="meetu.dto.OfficeMapInfoDTO"%>
<%@ page import="meetu.dto.UniversityDTO"%>
<%@ page import="org.json.simple.*"%>

<%!@SuppressWarnings("unchecked")%>
<%
	ReservationDAO dao = ReservationDAO.getInstance();
	
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String prof_id = request.getParameter("prof_id");
	
	OfficeMapInfoDTO officeMapInfo = dao.getMapInfo(univ_dto.getUnivId(), prof_id);
	
	if (officeMapInfo != null) {
		JSONObject mapJson = new JSONObject();
		JSONArray mapJsonArray = new JSONArray(); 
		
		JSONObject m = null; // JSONArray 내에 들어갈 json

		String office = officeMapInfo.getOffice();
		double longitude = officeMapInfo.getLongitude();
		double latitude = officeMapInfo.getLatitude();
		
		m = new JSONObject(); // JSONArray 내에 들어갈 json
	
		if (prof_id != null)
			m.put("prof_id", prof_id);
		if (office != null)
			m.put("office", office);
		
		m.put("longitude", longitude);
		m.put("latitude", latitude);
	
		if (m != null)
			mapJsonArray.add(m);
		
		mapJson.put("map", mapJsonArray); // json 배열을 저장
		out.println(mapJsonArray);
	}
	else {
		response.setStatus(400); // bad request
		response.addHeader("Status", "Unregistered map info");
		return;
	}
%>