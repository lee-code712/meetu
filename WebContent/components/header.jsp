<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <link rel="stylesheet" href="css/header.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <style>
        @charset "UTF-8";

        ul, li {
            text-decoration: none;
            list-style: none;
        }

        #header {
            width: 100%;
            height: 100px;
            border-bottom: 1px solid #eee;
            background: white;
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
            color: #FBAB7E;
            font-size: 24px;
            margin-right: -30px;
            font-family: 'Yellowtail', cursive;
            font-weight: bold;
        }

        #title:hover {
            cursor: pointer;
        }

        #gnb {
            display: flex;
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            color: #535353;
            align-items: center;
        }

        #gnb a {
            padding: 0 40px;
        }

        #alertIcon {
            width: 18px;
            height: 18px;
        }

        #alertIcon:hover,
        #noticeIcon:hover,
        #reserveIcon:hover,
        #messageIcon:hover {
            cursor: pointer;
        }

        #messageIcon,
        #noticeIcon,
        #reserveIcon {
            color: #535353;
        }

        a:link {
            color: #535353;
            text-decoration: none;
        }

        a:visited {
            color: #535353;
            text-decoration: none;
        }

        a:hover {
            color: #535353;
            text-decoration: none;
        }

        #title a:link,
        #title a:visited,
        #title a:hover {
            color: #FBAB7E;

        }

        #topHeader {
            width: 100%;
            height: 34px;
            background-color: #FBAB7E;
            background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%);
        }

        #topHeaderInner {
            margin: 0 auto;
            width: 1194px;
            height: 100%;
        }

        #topHeaderInner div {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            height: 100%;
            float: right;
            color: white;
        }

        #topHeaderInner div span {
            margin-left: 20px;
        }

        #topHeaderInner div a:link,
        #topHeaderInner div a:visited,
        #topHeaderInner div a:hover {
            color: white;
        }

        #gnb li a {
            font-size: 14px;
            position: relative;
        }

        #gnb li a:before {
            content: '';
            position: absolute;
            background-color: #FBAB7E;
            height: 6px;
            width: 0;
            bottom: -42px;
            transition: 0.5s;
            left: 50%;
            transform: translateX(-50%);
        }

        #gnb li a:hover:before {
            width: 100%;
        }

        #dropdown-button {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 60px;
            padding: 8px;
            width: 140px;
            font-size: 15px;
            border: none;
        }

        #dropdown {
            position: relative;
            display: inline-block;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 140px;
            padding: 8px;
            box-shadow: 0px 4px 8px 0px rgba(0, 0, 0, 0.2);
        }

        #dropdown-content a {
            color: black;
            padding: 8px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background-color: #f3f3f3;
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }
    </style>
</head>

<body>
	<div id="topHeader">
	    <div id="topHeaderInner">
	        <div>
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
	
	        <div id="dropdown">
	            <div id="dropdown-button">${mem_dto.getName()}<img src="/components/images/more.svg"/></div>
	            <div id="dropdown-content">
	                <a href="myPage.do">마이페이지</a>
	                <a href="logout.do">로그아웃</a>
	            </div>
	        </div>
	
	        <img src="/components/images/bell.svg" id="alertIcon"/>
	    </div>
	</div>
</body>
</html>