<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>noticeContent</title>
	<link rel="stylesheet" href="../../components/css/header.css" />
	<link rel="stylesheet" href="/notice/css/noticeContent.css" />
</head>
<body>
	<div id="topHeader">
		<div id="topHeaderInner">
			<div>
				<div><a href="../../login/js/login.jsp">로그인</a></div>
				<div>|</div>
				<div><a href="../../join/js/join.jsp">회원가입</a></div>
			</div>
		</div>
	</div>

	<div id="underHeader">
		<div id="underHeaderInner">
			<div id="title"><a href="">MEETU</a></div>
		
			<div id="gnb">
				<div><a href="../../notice/js/notice.jsp">공지사항</a></div>
				<div><a href="../../reservation/js/reservation.jsp">상담예약</a></div>
				<div><a href="../../message/js/message.jsp">쪽지함</a></div>
			</div>
		
			<div id="icon">
				<img src="../../components/images/alert.svg" />
				<img src="../../components/images/myPage.svg" />
			</div>
		</div>
	</div>

	<div id="banner">
		<div>공지사항</div>
	</div>
	
	<div id="contentTitle">(글제목)</div>
	<div id="content">(내용)</div>
	<button id="listBtn">목록</button>
</body>
</html>
