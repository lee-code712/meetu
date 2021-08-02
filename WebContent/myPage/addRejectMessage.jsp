<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>

<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	String user_id = (String) session.getAttribute("user_id");
	String res_id = (String) request.getParameter("res_id");
	String reject_msg = request.getParameter("reject_msg");
	
	// 인스턴스 가져오기
	ReservationDAO reservation_dao = ReservationDAO.getInstance();

	// reject_msg 추가
	ReservationDTO reservation_dto = new ReservationDTO();
	reservation_dto.setResId(res_id);
	reservation_dto.setRejectMsg(reject_msg);
		
	boolean change_success = false;
	change_success = reservation_dao.addRejectMessage(reservation_dto, univ);
		
	if(!change_success) {
		response.setStatus(400);		// bad request
		response.addHeader("Status", "add reject message failed");
	}
%>