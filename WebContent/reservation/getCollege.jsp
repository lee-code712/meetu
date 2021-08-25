<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.MemberDAO"%>
<%@ page import="meetu.dto.CollegeDTO"%>
<%@ page import="meetu.dto.UniversityDTO"%>
<%@ page import="org.json.simple.*"%>

<%!@SuppressWarnings("unchecked")%>
<%
	MemberDAO dao = MemberDAO.getInstance();

	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	
	ArrayList<CollegeDTO> colleges = dao.getCollege(univ_dto);
	
	if(colleges != null) {
		JSONObject collegeJson = new JSONObject();
		JSONArray collegeJsonArray = new JSONArray(); 
		
		for (int i = 0; i < colleges.size(); i++) {
			JSONObject c = null; // JSONArray 내에 들어갈 json
			
			String college_id = colleges.get(i).getCollegeId();
			String college_name = colleges.get(i).getCollegeName();

			c = new JSONObject();
			if (college_id != null)
				c.put("college_id", college_id);
			if (college_name != null)
				c.put("college_name", college_name);
		
			if (c != null)
				collegeJsonArray.add(c);
		}
		
		collegeJson.put("college", collegeJsonArray); // json 배열을 저장
		out.println(collegeJsonArray);
	}
	else {
		response.setStatus(400); // bad request
		response.addHeader("Status", "Unregistered College");
		return;
	}
%>