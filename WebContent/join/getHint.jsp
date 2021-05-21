<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="meetu.dao.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDAO dao = MemberDAO.getInstance();
	String univ_name = request.getParameter("univ_name");
	String univs = dao.univNameSearch(univ_name); // univ_name로 시작하는 대학명 검색
	
	out.print(univs);
%>
</body>
</html>