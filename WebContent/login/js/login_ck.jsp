<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="meetu.action.LoginAction" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String posit = request.getParameter("position");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String ck = LoginAction.checkLogin(posit, id, pwd);
	if(ck == "-1") {
		response.sendRedirect("login.jsp?ck=" + ck);
	}
	else {
		session.setAttribute("univ", ck);
		session.setAttribute("id", id);
		if(posit.equals("0")) {
			response.sendRedirect("../../index/js/index.jsp");
		}
		else {
			response.sendRedirect("../../index/js/index.jsp"); // 교수용 사이트는 아직 구현 안함
		}
	}
%>
</body>
</html>