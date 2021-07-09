<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>noticeContent</title>
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

        header {
            width: 100%;
            height: 100px;
            top: 0px;
            background: rgba(0, 0, 0, .800);
            box-sizing: border-box;
            transition: All 0.2s ease;
            -webkit-transition: All 0.2s ease;
            -moz-transition: All 0.2s ease;
            -o-transition: All 0.2s ease;
        }

        #header_inner {
            display: flex;
            align-items: center;
            margin: 0 auto;
            width: 1194px;
            height: 100px;
        }

        #title {
            display: flex;
            align-items: center;
            width: 200px;
            height: 100%;
            color: white;
            font-size: 24px;
            font-family: 'Yellowtail', cursive;
            font-weight: bold;
        }

        #title:hover {
            cursor: pointer;
        }

        #gnb {
            display: flex;
            width: 100%;
            font-size: 14px;
            font-weight: bold;
            color: white;
            align-items: center;
        }

        #gnb a {
            padding: 0 40px;
        }

        #alertIcon:hover,
        #noticeIcon:hover,
        #reserveIcon:hover,
        #messageIcon:hover,
        #myPageIcon:hover {
            cursor: pointer;
        }

        #dropdown {
            position: relative;
            display: inline-block;
        }

        #dropBtn {
            width: 160px;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            background: none;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border: 1px solid white;
            border-radius: 500px;
        }

        #dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background: rgba(0, 0, 0, 0.1);
            border-radius: 500px;
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }

		#noticeContent {
			margin: 0 auto;
			width: 1194px;
		}
    </style>
</head>
<body>
<header>
    <nav id="header_inner">
        <div id="title"><a>MEETU</a></div>
        <div id="gnb">
            <a id="noticeIcon">공지사항</a>
            <a id="reserveIcon">상담예약</a>
            <a id="messageIcon">쪽지함</a>
            <a id="myPageIcon">마이페이지</a>
        </div>
        <div id="dropdown">
            <button id="dropBtn">(이름)님 ▽</button>
            <div id="dropdown-content">
                <a href="#">로그아웃</a>
            </div>
        </div>
        <img src="../images/notifications_black_24dp.svg" id="alertIcon"/>
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

