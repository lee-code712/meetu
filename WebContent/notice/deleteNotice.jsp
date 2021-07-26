<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>
<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	int notice_id = Integer.parseInt(request.getParameter("notice_id"));
	
	// 인스턴스 가져오기
	NoticeDAO notice_dao = NoticeDAO.getInstance();

	// notice 삭제
	NoticeDTO notice_dto = new NoticeDTO();
	notice_dto.setNoticeId(notice_id);
	
	boolean notice_success = notice_dao.deleteNotice(notice_dto, univ);
	if(!notice_success) {
		response.setStatus(400);		// bad request
		response.addHeader("Status", "add notice failed");
	}
%>