<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.MemberDAO"%>
<%@ page import="meetu.dto.DepartmentDTO"%>
<%@ page import="meetu.dto.UniversityDTO"%>
<%@ page import="org.json.simple.*"%>

<%!@SuppressWarnings("unchecked")%>
<%
	MemberDAO dao = MemberDAO.getInstance();
	
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String college_id = request.getParameter("college_id");
	
	// 단대에 해당하는 학과 dto
	ArrayList<DepartmentDTO> depts = dao.getDeptByCollege(univ_dto, college_id);
	
	if (depts != null) {
		JSONObject deptJson = new JSONObject();
		JSONArray deptJsonArray = new JSONArray(); 
		
		for (int i = 0; i < depts.size(); i++) {
			JSONObject d = null; // JSONArray 내에 들어갈 json
	
			String dept_id = depts.get(i).getDeptId();
			String dept_name = depts.get(i).getDeptName();
			
			d = new JSONObject(); // JSONArray 내에 들어갈 json
		
			if (dept_id != null)
				d.put("dept_id", dept_id);
			if (dept_name != null)
				d.put("dept_name", dept_name);
			if (college_id != null)
				d.put("college_id", college_id);
		
			if (d != null)
				deptJsonArray.add(d);
		}
		
		deptJson.put("dept", deptJsonArray); // json 배열을 저장
		out.println(deptJsonArray);
	}
	else {
		response.setStatus(400); // bad request
		response.addHeader("Status", "Unregistered department");
		return;
	}
%>