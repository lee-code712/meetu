<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	<link rel="stylesheet" href="css/header.css" />
	<link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
</head>

<body>
	<div id="topHeader">
		<div id="topHeaderInner">
			<div></div>
		</div>
	</div>
	
	<div id="header">
	    <div id="header_inner">
	        <div id="title"><a href="index.do">MEETU</a></div>
	        <div id="gnb">
	            <a id="noticeIcon" href="notice.do">공지사항</a>
	            <a id="reserveIcon" href="reservationPro.do">상담예약</a>
	            <a id="messageIcon" href="message.do">쪽지함</a>
	        </div>
	        <div id="dropdown">
	            <div id="dropBtn">
	            	<div id="dropBtnTitle">${mem_dto.getName()}님</div>
	            <div>
	            	<img src="/components/images/keyboard_arrow_down_black_24dp.svg" id="dropImg"/>
	            </div>
	            </div>
	            <div id="dropdown-content">
	                <a href="myPage.do">마이페이지</a>
	                <a href="#">로그아웃</a>
	            </div>
	        </div>
	       
	        <img src="/components/images/notification.svg" id="alertIcon"/>
	    </div>
	</div>
</body>
</html>