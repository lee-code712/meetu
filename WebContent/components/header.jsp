<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	<link rel="stylesheet" href="css/header.css" />
</head>

<body>
<div id="topHeader">
	<div id="topHeaderInner">
		<div>
			<div><a href="../login/login.jsp">로그인</a></div>
			<div>|</div>
			<div><a href="../join/join.jsp">회원가입</a></div>
		</div>
	</div>
</div>

<div id="underHeader">
	<div id="underHeaderInner">
		<div id="title"><a href="">MEETU</a></div>
		
		<div id="gnb">
			<div><a href="../notice/notice.jsp">공지사항</a></div>
			<div><a href="../reservation/reservation.jsp">상담예약</a></div>
			<div><a href="../message/message.jsp">쪽지함</a></div>
		</div>
		
		<div id="icon">
			<img src="images/alert.svg" />
			<img src="images/myPage.svg" />
		</div>
	</div>
</div>
</body>
</html>