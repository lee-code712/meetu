<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*"%>
<%@ page import="org.json.simple.*"%>

<%@ page import="meetu.dao.MemberDAO"%>
<%@ page import="meetu.dto.*"%>

<%!@SuppressWarnings("unchecked")%>
<%
	MemberDAO dao = MemberDAO.getInstance();

	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String searchText = request.getParameter("searchText");
	String keyword = searchText.replaceAll(" ", "");
	
	// 검색 결과 교수 DTO
	ArrayList<ProfessorDTO> profs = dao.professorSearchByProfInfo(univ_dto, keyword);
	if(profs == null) {
		profs = dao.professorSearchByConsultRecord(univ_dto, keyword);
	}
	
	JSONArray profJsonArray = new JSONArray(); 
	
	if (profs != null) {			
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
			ArrayList<MemberUserDTO> member_users = dao.getAllMemberUsers(univ_dto.getUnivId());
			boolean is_member = false;
			String user_id = null;
			
			for (int j = 0; j < member_users.size(); j++) {
				String member_id = member_users.get(j).getMemberId();
				
				if (member_id.equals(prof_id)) {
					is_member = true;
					user_id = member_users.get(j).getUserId();
				}
			}
		
			// 대학 구성원 정보를 가져와 교수 이름 구하기
			ArrayList<MemberDTO> members = dao.getAllMembers(univ_dto.getUnivId());
			String name = null;
			String dept_name = null;
			
			for (int j = 0; j < members.size(); j++) {
				String member_id = members.get(j).getMemberId();
				
				if (member_id.equals(prof_id)) {
					name = members.get(j).getName();
					// 학과 정보 구하기
					DepartmentDTO dept_dto = dao.getDepartmentInfo(members.get(j), univ_dto.getUnivId());
					dept_name = dept_dto.getDeptName();
				}
			}
			
			// 이하 정보는 professor 테이블에 존재		
			String major = profs.get(i).getMajor();
			String email = profs.get(i).getEmail();
			String office = profs.get(i).getOffice();
			
			p = new JSONObject(); // JSONArray 내에 들어갈 json
	
			if(user_id != null)
				p.put("p_user_id", user_id);
			if (name != null)
				p.put("name", name);
			if(dept_name != null)
				p.put("dept", dept_name);
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
	}
	
	out.println(profJsonArray);
%>