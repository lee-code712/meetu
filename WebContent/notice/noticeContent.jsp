<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    
    <link rel="stylesheet" href="../components/css/header.css" />
    <link rel="stylesheet" href="/notice/css/noticeContent.css" />
	<link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <style>
        * {
            padding: 0px;
            margin: 0px;
            text-align: none;
        }

        body {
            background: #F4F4F4;
        }

        #banner {
            display: table;
            margin: 0 auto;
            width: 1920px;
            height: 100px;
            background-color: white;
            border-radius: 5px;
        }

        #banner div {
            display: table-cell;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #3E454D;
            vertical-align: middle;
        }

        #contentTitle {
            margin: 0 auto;
            margin-top: 50px;
            padding-left: 20px;
            padding-top: 10px;
            width: 1174px;
            height: 30px;
            border-top: 2px solid #3E454D;
            color: #3E454D;
            font-size: 14px;
            font-weight: bold;
            vertical-align: center;

        }

        #content {
            margin: 0 auto;
            padding-left: 20px;
            padding-top: 10px;
            width: 1174px;
            height: 510px;
            border-top: 1px solid #C4C4C4;
            font-size: 14px;
            vertical-align: center;
			border-bottom: 1px solid #C4C4C4;
        }

        #listBtn {
            display: block;
            float: right;
            margin-top: 20px;
            width: 114px;
            height: 40px;
            border: none;
            border-radius: 5px;
            color: white;
            background: #0D6EFD;
        }

        #listBtn:hover {
            cursor: pointer;
        }

		#noticeContent {
			margin: 0 auto;
			width: 1194px;
		}
		
		a:link { color: white; text-decoration: none;}
 		a:visited { color: white; text-decoration: none;}
 		a:hover { color: white; text-decoration: underline;}
    </style>
</head>
<body>
<header>
    <nav id="header_inner">
        <div id="title"><a href="index.do">MEETU</a></div>
        <div id="gnb">
            <a id="noticeIcon" href="notice.do">공지사항</a>
            <a id="reserveIcon" href="reservationPro.do">상담예약</a>
            <a id="messageIcon" href="message.do">쪽지함</a>
        </div>
        <div id="dropdown">
            <button id="dropBtn">${mem_dto.getName()}님 ▽</button>
            <div id="dropdown-content">
                <a href="#">마이페이지</a>
                <a href="#">로그아웃</a>
            </div>
        </div>
        <img src="/components/images/notifications_black_24dp.svg" id="alertIcon"/>
    </nav>
</header>

<div id="banner">
    <div>공지사항</div>
</div>

<div id="noticeContent">
    <div id="contentTitle">(글제목)</div>
    <div id="content">(내용)</div>
    <button id="listBtn">목록</button>
</div>
</body>
</html>

