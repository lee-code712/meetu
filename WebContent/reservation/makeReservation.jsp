<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	String choiceDay = request.getParameter("choiceDay");
	String startTime = request.getParameter("startTime");
	String consultTime = request.getParameter("consultTime");
	String typeBtn = request.getParameter("typeBtn");
	String[] reasons = request.getParameterValues("reason");
	
	
	
	// 이전 페이지로 돌아감
	String forPage = request.getHeader("Referer");
	response.sendRedirect(forPage);
%>