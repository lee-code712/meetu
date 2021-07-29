<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <link rel="stylesheet" href="css/header.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
</head>

<body>
<div id="topHeader">
    <div id="topHeaderInner">
        <div><a href="myPage.do">${mem_dto.getName()}님 환영합니다!</a><span>|</span><span><a href="logout.do">로그아웃</a></span>
        </div>
    </div>
</div>

<div id="header">
    <div id="header_inner">
        <div id="title"><a href="index.do">MEETU</a></div>
        <ul id="gnb">
            <li><a id="noticeIcon" href="notice.do">공지사항</a></li>
            <li><a id="reserveIcon" href="reservationPro.do">상담예약</a></li>
            <li><a id="messageIcon" href="message.do">쪽지함</a></li>
        </ul>

        <img src="images/bell.svg" id="alertIcon"/>
    </div>
</div>
</body>
</html>