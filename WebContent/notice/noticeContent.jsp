<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    
    <link rel="stylesheet" href="/notice/css/noticeContent.css" />
	<link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <style>
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
            color: black;
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
            font-size: 16px;
            font-weight: bold;
            color: #535353;
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
        	display: flex;
            width: 160px;
            color: #535353;
            padding: 16px;
            font-size: 16px;
            border: none;
            background: none;
        }

        #dropdown-content {
        	margin-left: 50px;
            display: none;
            position: absolute;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border: 1px solid white;
            border-radius: 5px;
            background: rgba(0, 0, 0, .800);
        }

        #dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background: rgba(0, 0, 0, 0.3);
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }
        
        #dropBtnTitle {
        	font-weight: bold;
        	padding: 0 4px 0 50px;
        	height: 100%;
        }
        
        #dropImg {
        	width: 20px;
        	heihgt: 20px;
        }
        * {
            padding: 0px;
            margin: 0px;
            text-align: none;
        }
        body {
            background: #FAFAFA;
        }
        #banner {
            display: table;
            margin: 0 auto;
            width: 100%;
            height: 120px;
            background-color: white;
            border-radius: 5px;
        }
        #banner div {
            display: table-cell;
            width: 1920px;
            height: 100%;
           	background: white;
            text-align: center;
            font-size: 24px;
            color: #333330;
            font-family: 'Noto Sans KR', sans-serif;
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
            background: white;
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
			background: white;
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
            background: #3E454D;
        }
        #listBtn:hover {
            cursor: pointer;
        }
		#noticeContent {
			margin: 0 auto;
			width: 1194px;
		}
		
		#messageIcon,
        #reserveIcon {
            color: #8B8B8B;
        }
		
		a:link { color: white; text-decoration: none;}
 		a:visited { color: white; text-decoration: none;}
 		a:hover { color: white; text-decoration: underline;}
    </style>
</head>
<body>
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


<div id="noticeContent">
    <div id="contentTitle">${notice_dto.getTitle()}</div>
    <div id="content">${notice_dto.getContent()}</div>
    <button id="listBtn" onclick="location.href='notice.do'">목록</button>
</div>
</body>
</html>