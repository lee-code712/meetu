<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/join/css/joinPro.css"/>
</head>

<body>
<%
	String user_id = request.getParameter("user_id");
%>
	<div id="joinProWrap">
	    <div id="logo">MEETU</div>
	    <div id="welcome">환영합니다!</div>
	    <div id="successMsg">회원가입에 성공했습니다.</div>
	    <div id="successMsg">회원님의 아이디는 <%= user_id %> 입니다.</div>
	    <button onclick="location.href='loginForm.do'" id="loginBtn">로그인</button>
	</div>
</body>
</html>