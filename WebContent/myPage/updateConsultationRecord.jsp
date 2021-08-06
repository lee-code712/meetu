<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>

<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	String res_id = request.getParameter("res_id");
	String content = request.getParameter("content");
	
	// 인스턴스 가져오기
	ReservationDAO reservation_dao = ReservationDAO.getInstance();

	// reseved list json 만들어 반환
	ConsultDTO consult_dto = new ConsultDTO();
	consult_dto.setResId(res_id);
	consult_dto.setContent(content);
	
	boolean update_success = reservation_dao.updateConsultContent(consult_dto, univ);
	if(!update_success) {
		response.setStatus(400);		// bad request
		response.addHeader("Status", "update consult content failed");
	}	
%>