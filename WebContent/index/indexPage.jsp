<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>MEETU</title>

    <!--<link rel="stylesheet" href="/index/css/indexStu.css"/>-->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="/index/js/jquery.bxslider.min.js"></script>
    <link href="/index/css/jquery.bxslider.css" rel="stylesheet"/>

    <script src="/index/js/index.js"></script>

    <script>
        
    </script>
    <style>
        /* 배너사이즈와 위치 */
        #banner_wrap {
            margin-top: 100px;
            margin: 0 auto;
            width: 1920px;
            height: 720px;
            z-index: 0;
        }

        .banner_01 {
            width: 1920px;
            height: 720px;
            background-image: url('../images/banner1.svg');
            background-position: center;
            background-size: cover;
        }

        .banner_02 {
            width: 1920px;
            height: 720px;
            background-image: url('../images/banner2.jpg');
            background-position: center;
            background-size: cover;
        }

        .banner_03 {
            width: 1920px;
            height: 720px;
            background-image: url('../images/banner3.jpg');
            background-position: center;
            background-size: cover;
        }

        #bx-pager1 a {
            float: left;
            margin: 0 5px;
            display: block;
            width: 20px;
            height: 20px;
            font-size: 12px;
            line-height: 18px;
            text-align: center;
            background: pink;
            color: #333
        }

        * {
            padding: 0;
            margin: 0;
            text-decoration: none;
        }

        a:link {
            color: white;
            text-decoration: none;
        }

        a:visited {
            color: white;
            text-decoration: none;
        }

        a:hover {
            color: white;
            text-decoration: underline;
        }

        #footer {
            display: flex;
            margin-top: -40px;
            margin: 0 auto;
            width: 100%;
            height: 200px;
            background: #EDEDED;
            justify-content: center;
            align-items: center;
            color: #535353;
        }


        @charset "UTF-8";

        ul, li {
            text-decoration: none;
            list-style: none;
        }


        #introBody {
            display: flex;
            justify-content: space-between;
            margin: 0 auto;
            width: 1194px;

        }

        #introBox img {
            display: block;
            margin: 0px auto;
        }

        #introBox div {
            text-align: center;
        }

        #introWrap {
            position: absolute;
            display: flex;
            justify-content: center;
            top: 690px;
            left: 50%;
            transform: translate(-50%, 0%);
            margin: 0 auto;
            width: 1194px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 2px 4px 0px rgb(0, 0, 0, 0.2);
        }

        #intro {
            margin: 0 auto;
            width: 1194px;
        }

        #introTitle {
            margin-top: 30px;
            margin-bottom: 14px;
        }

        #introText {
            font-size: 10px;
            color: #535353;
        }

        #siteName {
            font-size: 24px;
            font-family: 'Yellowtail', cursive;
        }


        #introBox {
            width: 386px;
            padding: 40px 0;
        }

        #introBox:hover {
            box-shadow: 0px 2px 4px 0px rgb(0, 0, 0, 0.2);
            cursor: pointer;
        }

        #logo {
            color: #1abc9c;
            font-family: 'Yellowtail', cursive;
        }

        #banner1Title {
            margin-top: 100px;
            display: flex;
            justify-content: center;
            font-weight: bold;
            font-size: 18px;
        }

        #banner1Text {
            padding: 20px 0 60px 0;
            margin: 0 auto;
            text-align: center;
            width: 300px;
            font-size: 12px;
            color: #535353;
        }

        #reservationBtn {
            display: block;
            margin: 0 auto;
            width: 200px;
            padding: 8px 0;
            border: 1px solid #1abc9c;
            color: #1abc9c;
            border-radius: 500px;
            background: white;
        }

        #reservationBtn:hover {
            display: block;
            margin: 0 auto;
            width: 200px;
            padding: 8px 0;
            border: 1px solid #1abc9c;
            color: white;
            border-radius: 500px;
            background: #1abc9c;
            cursor: pointer;
        }


        .cal_top {
            font-size: 24px;
            margin-bottom: 40px;
        }

        .cal {
            text-align: center;
        }

        table.calendar {
            display: inline-table;
            text-align: left;
        }

        table.calendar th {
            padding-bottom: 10px;
        }

        table.calendar td {
            vertical-align: top;
            border: 1px solid #eee;
            width: 80px;
            background: white;
        }

        #manageWrap {
            padding: 100px 0 140px 0;
            margin: 0 auto;
            width: 100%;
            background: #FAFAFA;
        }

        #manage {
            margin: 0 auto;
            width: 1194px;
        }

        #cal_top_left {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        #prevMonth {
            margin-left: 10px;
        }

        #manageHeader {
            margin-top: 100px;
            margin-bottom: 60px;
        }

        #siteName {
            font-size: 24px;
            font-family: 'Yellowtail', cursive;
        }

        #subTitle {
            display: flex;
            justify-content: center;
            color: #535353;
            font-size: 10px;
            margin-bottom: 10px;
        }

        #originTitleWrap {
            display: flex;
            justify-content: center;
        }

        #originTitle {
            font-size: 24px;
        }

        #shortLine {
            margin: 0 auto;
            margin-top: 24px;
            width: 30px;
            height: 4px;
            background: #1abc9c;
        }

        #noticeIcon:hover,
        #reserveIcon:hover,
        #messageIcon:hover {
            cursor: pointer;
        }

        #noticeIcon,
        #reserveIcon,
        #messageIcon {
            color: black;
        }

        a:link {
            color: black;
            text-decoration: none;
        }

        a:visited {
            color: black;
            text-decoration: none;
        }

        a:hover {
            color: black;
            text-decoration: none;
        }

        #title,
        #title a:link,
        #title a:visited,
        #title a:hover {
            color: #1abc9c;

        }

        #header {
            width: 100%;
            height: 80px;
            background: white;
            border-bottom: 1px solid #EAEAEA;
            z-index: 10; 
            top: 0px; 
            position: fixed; 
            box-sizing: border-box; 
            transition: All 0.2s ease; 
            -webkit-transition: All 0.2s ease; 
            -moz-transition: All 0.2s ease; 
            -o-transition: All 0.2s ease;
        }

        #headerInner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 auto;
            width: 1194px;
            height: 100%;
        }

        #headerInnerL {
            display: flex;
            align-items: center;
        }

        #title {
            font-family: 'Yellowtail', cursive;
            font-size: 18px;
            font-weight: bold;
        }

        #gnb {
            margin-left: 140px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 300px;
            font-size: 14px;
        }

        #headerInnerR {
            display: flex;
            align-items: center;
        }

        #dropdown {
            position: relative;
            display: inline-block;
            font-size: 14px;
            padding: 14px;
        }

        #dropdown-button div {
            justify-content: flex-end;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            margin-top: 14px;
            min-width: 130px;
            padding: 4px;
            border-radius: 5px;
            box-shadow: 0px 4px 8px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        #dropdown-content a {
            color: black;
            padding: 8px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background-color: #FAFAFA;
            border-radius: 5px;
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }

        #headerInnerR img {
            margin-left: 60px;
        }

        #noticeImg {
            width: 14px;
            height: 14px;
        }

        #noticeImg:hover {
            cursor: pointer;
        }

        #cal_msg {
            margin-bottom: 10px;
            padding: 20px 10px;
            text-align: center;
            border-radius: 10px;
            background-color: white;
            border: 1px solid #DFE3E4;
            color: black;
            font-size: 14px;
        }

        #calWrap {
            display: flex;
            justify-content: space-between;
        }

        #calendar_wrap {
            display: inline-block;
            width: 300px;
            height: 657px;
            border-radius: 5px 0 0 5px;
        }
        
        #banner03Wrap {
        	margin: 0 auto;
        	padding-top: 90px;
        	width: 1194px;
        }
        
        #banner03Title {
            display: flex;
            font-weight: bold;
            font-size: 18px;
        }

        #banner03Text {
            padding: 20px 0 60px 0;
            width: 300px;
            font-size: 12px;
            color: #535353;
        }

        #banner03Btn {
            display: block;
            width: 200px;
            padding: 8px 0;
            border: 1px solid #1abc9c;
            color: #1abc9c;
            border-radius: 500px;
            background: white;
        }
            
        #banner02Wrap {
        	margin: 0 auto;
        	padding-top: 90px;
        	width: 1194px;
        }
        
        #banner02Title {
            display: flex;
            font-weight: bold;
            font-size: 18px;
        }

        #banner02Text {
            padding: 20px 0 60px 0;
            width: 300px;
            font-size: 12px;
            color: #535353;
        }

        #banner02Btn {
            display: block;
            width: 200px;
            padding: 8px 0;
            border: 1px solid #1abc9c;
            color: #1abc9c;
            border-radius: 500px;
            background: #eaf0ff;
        }
            
        #banner02Btn:hover,
        #banner03Btn:hover {
                cursor: pointer;
                background: #1abc9c;
                color: white;         
        }
        
        #blank {
        	height: 80px;
        }
    </style>
</head>

<body>
<div id="blank"></div>
<div id="header">
    <div id="headerInner">
        <div id="headerInnerL">
            <div id="title"><a href="index.do">MEETU</a></div>
            <div id="gnb">
                <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
                <c:if test="${mem_dto.getRole()=='0'}">
                    <div><a id="reserveIcon" href="reservation.do">상담예약</a></div>
                    <div><a id="messageIcon" href="message.do">쪽지함</a></div>
                </c:if>
               	<c:if test="${mem_dto.getRole()=='1'}">             
                	<div><a id="messageIcon" href="message.do">쪽지함</a></div>
                	<div><a id="reserveIcon" href="#"/></div>
                </c:if>
            </div>
        </div>
        <div id="headerInnerR">
            <div id="dropdown">
                <div id="dropdown-button">${mem_dto.getName()}님 😊</div>
                <div id="dropdown-content">
                    <a href="myPage.do">마이페이지</a>
                    <a href="logout.do">로그아웃</a>
                </div>
            </div>
            <img src="/images/bell.svg" id="noticeImg"/>
        </div>
    </div>
</div>

    <div id="banner_wrap">
        <ul class="banner_slide">
            <li class="banner_01">
                <div id="banner1Title">간편한 상담 예약 시스템 &nbsp; <span id="logo">MEETU</span></div>
                <div id="banner1Text">교수님과 상담을 하고 싶다면 간편한 상담 예약 시스템 MEETU를 사용하여 상담을 예약해보세요!</div>
                <button id="reservationBtn" onclick="location.href='reservation.do'">예약하러 가기</button>
            </li>
            <li class="banner_02">
                <div id="banner02Wrap">
            		<div id="banner02Title">간편한 상담 예약 시스템 &nbsp; <span id="logo">MEETU</span></div>
            		<div id="banner02Text">교수님과의 상담 예약일을 알고 싶다면 캘린더를 통해 상담일정을 확인해보세요!</div>
            		<button id="banner02Btn">캘린더 보러가기</button>
            	</div>    
            </li>
            <li class="banner_03">
            	<div id="banner03Wrap">
            		<div id="banner03Title">간편한 상담 예약 시스템 &nbsp; <span id="logo">MEETU</span></div>
            		<div id="banner03Text">교수님과 소통을 하고 싶다면 상담 승인 후 쪽지 기능을 통해 대화를 주고받아보세요!</div>
            		<button id="banner03Btn" onclick="location.href='message.do'">쪽지함 가기</button>
            	</div>
            </li>
        </ul>
    </div>

    <div id="introWrap">
        <div id="intro">
            <div id="introBody">
                <div id="introBox">
                    <div id="introImg"><img src="../images/calendarImage.svg"/></div>
                    <div id="introTitle">상담일정</div>
                    <div id="introText">상담일정을 통해 등록된 예약을<br/>한 눈에 확인할 수 있습니다.</div>
                </div>

                <div id="introBox">
                    <div id="introImg"><img src="../images/messageImage.svg"/></div>
                    <div id="introTitle">쪽지기능</div>
                    <div id="introText">상담예약이 확정된 교수님과<br/>메시지를 주고 받을 수 있습니다.</div>
                </div>

                <div id="introBox">
                    <div id="introImg"><img src="../images/clockImage.svg"/></div>
                    <div id="introTitle">알람기능</div>
                    <div id="introText">알람기능을 통해<br/>상담 가능 여부를 전달해드립니다.</div>
                </div>
            </div>
        </div>
    </div>


    <div id="manageWrap">
        <div id="manage">
            <div id="manageHeader">
                <div id="subTitle">캘린더를 통해 상담일정을 관리해보세요.</div>
                <div id="originTitleWrap"><span id="siteName">MEETU</span> &nbsp;&nbsp; <span
                        id="originTitle">상담일정 관리</span></div>
                <div id="shortLine"></div>
            </div>
           
            <!--  <span id="cal_top_dayName"></span>요일
            (<span id="cal_top_date"></span>일) -->
            <div id="calWrap">
                <div id="calendar_wrap">
					<!-- <div id="more_btn">
						+ <span id="cal_top_dayName"></span>요일
						(<span id="cal_top_date"></span>일)
						일정 더 보기
					</div> -->
                </div>
                <div class="cal_body">
                    <div class="cal_top">
                        <div id="cal_top_left">
                            <span id="cal_top_year"></span>.
                            <span id="cal_top_month"></span>
                            <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit"><img
                                    src="../images/prevImg.svg"/></span></a>
                            <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit"><img
                                    src="../images/nextImg.svg"/></span></a>
                        </div>
                    </div>
                    <div id="cal_tab" class="cal">

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="footer">
        Copyrights © 2021 by 시나브로. All Rights Reserved.
    </div>
</body>
</html>
