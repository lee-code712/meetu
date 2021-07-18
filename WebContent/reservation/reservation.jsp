<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>상담예약</title>
	<link rel="stylesheet" href="../components/css/header.css" />
	<link rel="stylesheet" href="/reservation/css/reservation.css" />
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	
	<script src="/reservation/js/reservation.js"></script>
	
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
        	padding: 0 4px 0 20px;
        	height: 100%;
        }
        
        #dropImg {
        	width: 20px;
        	heihgt: 20px;
        }
        
        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style: none;
        }
        #reservationWrap {
            margin: 0 auto;
            width: 1194px;
            height: 840px;
        }
        #deptWrap {
            margin-top: 80px;
            width: 18rem;
            height: 840px;
            border: none;
            border-radius: 10px;
        }
        #selectDept {
        	display: flex;
        	align-items: flex-start;
        	padding-top: 10px;
            padding-bottom: 55px;
            width: 100%;
            height: 40px;
            font-size: 18px;
            font-weight: bold;
            border-bottom: 1px dotted #363B40;
        }
        .college {
            line-height: 40px;
            font-size: 14px;
            cursor: pointer;
            border-bottom: 1px dotted #C4C4C4;
        }
        .college:hover {
            background: #363B40;
            color: white;
        }
        .deptList {
            width: 290px;
            padding-left: 20px;
            background: #ECECEC;
        }
        .dept {
            color: black;
        }
        .profListWrap {
            display: table-cell;
            float: right;
            margin-top: 40px;
        }
        .profList {
            width: 854px;
            margin: 0 auto;
            border-top: 2px solid #3E454D;
        }
        .profList th,
        .profList td {
            padding: 10px;
            font-size: 14px;
        }
        .profList td {
            text-align: center;
        }
        #profInfo a {
            color: #2575AF;
        }
        #selectProf a {
            color: #CE2E2E;
        }
        #profInfo a:hover {
            cursor: pointer;
        }
        #selectProf a:hover {
            cursor: pointer;
        }
        #messageInner {
            display: block;
            width: 894px;
            height: 840px;
        }
        body {
            background: #FAFAFA;
        }
        #sender {
            margin-top: 80px;
            margin-bottom: 30px;
            height: 34px;
            width: 900px;
            font-size: 18px;
            font-weight: bold;
            color: #3E454D;
        }
        #profListWrap {
            margin-left: 48px;
            width: 500px;
            height: 700px;
            font-size: 18px;
            font-weight: bold;
            color: #3E454D;
        }
        #messageInnerWrap {
            height: 648px;
        }
        #search {
            float: right;
            width: 330px;
            height: 34px;
            border: none;
            border-radius: 30px;
            background: #ffffff;
            box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 2px;
        }
        #searchText {
            font-size: 14px;
            width: 200px;
            margin: 8px 0 4px 12px;
            padding-left: 4px;
            border: 0px;
            outline: none;
            float: left;
            border-radius: 30px;
        }
        #searchBtn {
            width: 54px;
            height: 28px;
            margin: 4px 0;
            border: none;
            outline: none;
            float: right;
        }
        #searchBtn:hover {
            cursor: pointer;
        }
        .profList th {
            font-size: 14px;
            border-bottom: 1px solid #C4C4C4;
            text-align: center;
        }
        .profList td {
            font-size: 14px;
            text-align: center;
        }
        #infoBox {
            position: relative;
            display: inline-block;
        }
        #infoBtn {
            color: white;
            font-size: 16px;
            border: none;
            background: none;
        }
        #infoBox-content {
            padding-top: 14px;
            width: 310px;
            display: none;
            position: absolute;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.1);
            z-index: 1;
            border: 1px solid white;
            background: white;
            border-radius: 5px;
        }
        #infoBox-content p {
            color: #3E454D;
            text-decoration: none;
            display: block;
        }
        #infoBox:hover #infoBox-content {
            display: block;
        }
        #infoTitle {
            color: #3296B6;
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
        #checkBtn:hover {
            display: block;
            padding: 4px 8px;
            margin: 0 auto;
            border: 1px solid #3E454D;
            color: #3E454D;
            background: white;
            border-radius: 30px;
            cursor: pointer;
        }
        #checkBtn {
            display: block;
            padding: 4px 8px;
            margin: 0 auto;
            background: #3E454D;
            border: 1px solid #3E454D;
            color: white;
            border-radius: 30px;
        }
        
     	#messageIcon,
        #noticeIcon,
        #reserveIcon {
            color: #535353;
        }
        
		a:link { color: #535353; text-decoration: none;}
 		a:visited { color: #535353; text-decoration: none;}
 		a:hover { color: #535353; text-decoration: underline;}
 		
 		#title a:link {
 			color: black;
 		}
 		
 		#reserveIcon {
 			border-top: 14px solid #35454D;
 			border-bottom: 14px solid #35454D;
 			background: #3E454D;
 			color: white;
 			border-radius: 5px;
 		}
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

<table id="reservationWrap">
    <tr>
        <td>
            <ul id="deptWrap">
                <li id="selectDept"><img src="/reservation/images/beenhere_black_24dp.svg"/>&nbsp;&nbsp;상담예약</li>
				
            </ul>
        </td>
		 
        <td id="messageInner">
            <div id="sender">
                <div id="search">
                    <input type="text" placeholder="검색어를 입력하세요." id="searchText">
                    <img src="/reservation/images/search.svg" id="searchBtn"/>
                </div>
            </div>
            <div id="messageInnerWrap">
                <div id="profListWrap">
                    <table class="profList">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>교수명</th>
                            <th>학과</th>
                            <th>정보보기</th>
                            <th></th>
                        </tr>
                        </thead>

                        <tbody id="searchResult">

                        </tbody>
                    </table>
                </div>
            </div>
        </td>
    </tr>
</table>
</body>
</html>