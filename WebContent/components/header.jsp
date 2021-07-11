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
<header>
    <nav id="header_inner">
        <div id="title"><a>MEETU</a></div>
        <div id="gnb">
            <a id="noticeIcon">공지사항</a>
            <a id="reserveIcon">상담예약</a>
            <a id="messageIcon">쪽지함</a>
        </div>
        <div id="dropdown">
            <button id="dropBtn">(이름)님 ▽</button>
            <div id="dropdown-content">
                <a href="#">마이페이지</a>
                <a href="#">로그아웃</a>
            </div>
        </div>
        <img src="/components/images/notifications_black_24dp.svg" id="alertIcon"/>
    </nav>
</header>
</body>
</html>