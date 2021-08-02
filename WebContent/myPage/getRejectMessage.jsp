<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>

<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	String user_id = (String) session.getAttribute("user_id");
	String res_id = request.getParameter("res_id");
	
	// 인스턴스 가져오기
	MemberDAO mem_dao = MemberDAO.getInstance();
	ReservationDAO reservation_dao = ReservationDAO.getInstance();

	// reseved list json 만들어 반환
	ReservationDTO reservation_dto = new ReservationDTO();
	reservation_dto.setResId(res_id);
	reservation_dto = reservation_dao.getReservation(reservation_dto, univ);
	
	String result = reservation_dto.getRejectMsg();
	// System.out.println(result);
	out.print(result);
%>