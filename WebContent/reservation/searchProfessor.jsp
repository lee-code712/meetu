<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.MemberDAO"%>
<%@ page import="meetu.dto.ProfessorDTO"%>
<%@ page import="org.json.simple.*"%>

<%! @SuppressWarnings("unchecked") %>
<%
	MemberDAO dao = new MemberDAO();
	String searchText = request.getParameter("searchText");
	
	ArrayList<ProfessorDTO> profs = dao.ProfessorSearch(searchText); 
	
	if (profs != null) {	
		JSONObject profJson = new JSONObject();

		JSONArray profJsonArray = new JSONArray(); 
		for (int i = 0; i < profs.size(); i++) {
			// 교수 member_id에 해당하는 name 검색
			String name = dao.getName(profs.get(i).getProfId());
			String major = profs.get(i).getMajor();
			String email = profs.get(i).getEmail();
			String office = profs.get(i).getOffice();
			String dept_id = profs.get(i).getDeptId();
			
			JSONObject p = new JSONObject(); // 배열 내에 들어갈 json

			if (name != null)
				p.put("name", name);
			if (major != null)
				p.put("major", major);
			if (email != null)
				p.put("email", email);
			if (office != null)
				p.put("office", office);
			if (dept_id != null)
				p.put("dept_id", dept_id);
			
			if (p != null)
				profJsonArray.add(p);
		}
		
		profJson.put("prof", profJsonArray); // json 배열을 저장
		out.println(profJsonArray);
	}
	else {				// unregistered customer
		response.setStatus(400);		// bad request
		response.addHeader("Status", "Unregistered professor");
		return;
	}
%>