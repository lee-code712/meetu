<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_id = request.getParameter("user_id");
%>
회원가입에 성공했습니다. 회원님의 아이디는 <%= user_id %> 입니다.
<p/>
<a href="loginForm.do">로그인 페이지</a>
</body>
</html>