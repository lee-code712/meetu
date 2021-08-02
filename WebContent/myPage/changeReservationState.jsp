<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>
<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	String res_id = (String) request.getParameter("res_id");
	String selected_button = (String) request.getParameter("selected_button");
	
	// 인스턴스 가져오기
	ReservationDAO reservation_dao = ReservationDAO.getInstance();

	// state 변경
	ReservationDTO reservation_dto = new ReservationDTO();
	reservation_dto.setResId(res_id);
	
	boolean change_success = false;
	if(selected_button.equals("approvalBtn")) {
		reservation_dto.setState(1);
		change_success = reservation_dao.changeState(reservation_dto, univ);
	}
	else if(selected_button.equals("rejectBtn")) {
		reservation_dto.setState(2);
		change_success = reservation_dao.changeState(reservation_dto, univ);
	}
	else if(selected_button.equals("consultedBtn")) {
		reservation_dto.setState(3);
		change_success = reservation_dao.changeState(reservation_dto, univ);
	}
	else if(selected_button.equals("cancelBtn")) {
		reservation_dto.setState(4);
		change_success = reservation_dao.changeState(reservation_dto, univ);
	}
	
	if(!change_success) {
		response.setStatus(400);		// bad request
		response.addHeader("Status", "change state failed");
	}
%>