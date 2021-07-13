<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.MemberDAO"%>
<%@ page import="meetu.dto.MemberDTO"%>
<%@ page import="meetu.dto.CourseDTO"%>
<%@ page import="meetu.dto.DepartmentDTO"%>
<%@ page import="meetu.dto.ProfessorDTO"%>
<%@ page import="meetu.dto.UniversityDTO"%>
<%@ page import="org.json.simple.*"%>

<%!@SuppressWarnings("unchecked")%>
<%
	MemberDAO dao = new MemberDAO();

	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String dept_name = request.getParameter("dept_name");
	
	// 검색 결과 교수 DTO
	ArrayList<ProfessorDTO> profs = dao.professorSearchByDept(univ_dto, dept_name);
	
	if (profs != null) {	
		JSONObject profJson = new JSONObject();
		JSONArray profJsonArray = new JSONArray(); 
		
		for (int i = 0; i < profs.size(); i++) {
		JSONObject p = null; // JSONArray 내에 들어갈 json
	
		String prof_id = profs.get(i).getProfId();
	
		// 교수 강의 정보
		ArrayList<CourseDTO> courses = dao.getCourseInfo(profs.get(i), univ_dto.getUnivId());
		String course = "";
		
		for (int j = 0; j < courses.size(); j++) {
			if (j == courses.size() - 1)
				course += courses.get(j).getTitle();
			else
				course += courses.get(j).getTitle() + ", ";
		}
		
		// 회원 정보를 가져와 회원인 교수는 is_member을 true로
		ArrayList<MemberDTO> member_users = dao.getAllMemberUsers(univ_dto.getUnivId());
		boolean is_member = false;
		
		for (int j = 0; j < member_users.size(); j++) {
			String member_id = member_users.get(j).getMemberId();
			
			if (member_id.equals(prof_id)) {
				is_member = true;
			}
		}
	
		// 대학 구성원 정보를 가져와 교수 이름 구하기
		ArrayList<MemberDTO> members = dao.getAllMembers(univ_dto.getUnivId());
		String name = null;
		
		for (int j = 0; j < members.size(); j++) {
			String member_id = members.get(j).getMemberId();
			
			if (member_id.equals(prof_id)) {
				name = members.get(j).getName();
			}
		}
		
		// 교수 학과 정보 구하기
		DepartmentDTO dept_dto = dao.getDepartmentDTO(univ_dto, profs.get(i).getDeptId());
		String major = dept_dto.getDeptName();
		
		// 이하 정보는 professor 테이블에 존재
		
		String email = profs.get(i).getEmail();
		String office = profs.get(i).getOffice();
		
		p = new JSONObject(); // JSONArray 내에 들어갈 json

		if (name != null)
			p.put("name", name);
		if (major != null)
			p.put("major", major);
		if (email != null)
			p.put("email", email);
		if (office != null)
			p.put("office", office);
		if (course != null)
			p.put("course", course);
		p.put("is_member", is_member);
	
		if (p != null)
			profJsonArray.add(p);
		}
		
		profJson.put("prof", profJsonArray); // json 배열을 저장
		out.println(profJsonArray);
	}
	else {
		response.setStatus(400); // bad request
		response.addHeader("Status", "Unregistered professor");
		return;
	}
%>