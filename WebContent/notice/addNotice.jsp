<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>
<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 인스턴스 가져오기
	NoticeDAO notice_dao = NoticeDAO.getInstance();

	// notice 저장
	NoticeDTO notice_dto = new NoticeDTO();
	notice_dto.setTitle(title);
	notice_dto.setContent(content);
	
	boolean notice_success = notice_dao.addNotice(notice_dto, univ);
	if(!notice_success) {
		response.setStatus(400);		// bad request
		response.addHeader("Status", "add notice failed");
	}
%>