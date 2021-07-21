<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="meetu.dao.*"%>
<%@ page import="meetu.dto.*"%>

<%
	UniversityDTO univ_dto = (UniversityDTO) session.getAttribute("univ_dto");
	String univ = univ_dto.getUnivId();
	String option = request.getParameter("option");
	String keyword = request.getParameter("keyword");
		
	// 인스턴스 가져오기
	NoticeDAO notice_dao = NoticeDAO.getInstance();
	
	// notice size 구해 반환
	int notice_size = 0;
	if(keyword.equals("")) {
		notice_size = notice_dao.getAllNoticeRowSize(univ);
	}
	else {
		notice_size = notice_dao.getSearchNoticeRowSize(option, keyword, univ);
	}
	
	out.print(notice_size);
%>