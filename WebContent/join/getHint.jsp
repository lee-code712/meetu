<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.UniversityDAO" %>
<%@ page import="meetu.dto.UniversityDTO" %>
<%@ page import="com.fasterxml.jackson.databind.*"%>

<%! @SuppressWarnings("unchecked") %>
<%
	UniversityDAO dao = UniversityDAO.getInstance();
	String univ_name = request.getParameter("univ_name");

	ArrayList<UniversityDTO> univs = dao.univSearch(univ_name);
	
	//Object mapper instance
	ObjectMapper mapper = new ObjectMapper();
			
	//Convert POJO to JSON
	String univsJSON = mapper.writeValueAsString(univs);
	
	out.println(univsJSON);
%>