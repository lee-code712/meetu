<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>MEETU</title>

    <!--  <link rel="stylesheet" href="/index/css/index.css"/> -->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="/index/js/jquery.bxslider.min.js"></script>
    <link href="/index/css/jquery.bxslider.css" rel="stylesheet"/>

    <script src="/index/js/index.js"></script>
    <style>
        #noticeCount {
            position: relative;
            right: 10px;
            top: -4px;
            font-size: 4px;
            color: white;
        }

        #noticeImg {
            width: 20px;
            height: 20px;

        }

        #noticeOnImg {
            cursor: pointer;
            width: 24px;
            height: 20px;
        }

        @charset "UTF-8";

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
            background-image: url('/images/banner1.svg');
            background-position: center;
            background-size: cover;
        }

        .banner_02 {
            width: 1920px;
            height: 720px;
            background-image: url('/images/banner2.jpg');
            background-position: center;
            background-size: cover;
        }

        .banner_03 {
            width: 1920px;
            height: 720px;
            background-image: url('/images/banner3.jpg');
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


        ul, li {
            text-decoration: none;
            list-style: none;
        }


        #siteName {
            font-size: 24px;
            font-family: 'Yellowtail', cursive;
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
            width: 120px;
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
            margin: 6px 0px 0px 14px;
            color: #C4C4C4;
            font-size: 12px;
        }

        #originTitleWrap {
            display: flex;
            justify-content: center;
            font-size: 24px;
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
            width: 16px;
            height: 16px;
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

        #blankDiv {
            width: 60px;
        }

        #infoWrap {
            display: flex;
            justify-content: center;
            align-content: center;
            flex-direction: column;
            width: 100%;
            height: 530px;
            background: white;
        }

        #infoTit {
            display: flex;
            justify-content: center;
            margin: 0 auto;
            font-size: 24px;
        }

        #infoSubTit {
            display: flex;
            justify-content: center;
            margin: 6px auto;
            font-size: 12px;
            color: #C4C4C4;
        }

        #greenLine {
            margin: 10px auto;
            width: 50px;
            height: 6px;
            border-radius: 30px;
            background: #CAE8E1;
        }

        #infoIconWrap {
            display: flex;
            justify-content: space-between;
            margin: 0 auto;
            margin-top: 80px;
            width: 920px;
        }

        #infoIcon {
            display: flex;
            justify-content: center;
            flex-direction: column;
            width: 160px;
            height: 180px;
        }

        #iconTit {
            display: flex;
            justify-content: center;
            margin: 20px 0px;
            font-size: 18px;
            font-weight: bold;
        }

        #iconSubTit {
            display: flex;
            justify-content: center;
            font-size: 12px;
            color: #C4C4C4;
            text-align: center;
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
                    <div id="blankDiv"></div>
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
            <img src="/images/bellOn.svg" id="noticeOnImg" onclick="readNewAlerts();"/>
            <div id="noticeCount">${count_alert}</div>
        </div>
    </div>
</div>

<div id="banner_wrap">
    <ul class="banner_slide">
        <li class="banner_01">
            <div id="banner1Title">간편한 상담 일정 관리 시스템 &nbsp; <span id="logo">MEETU</span></div>
            <div id="banner1Text">MEETU를 사용하여 상담 일정을 관리해보세요!</div>
            <button id="reservationBtn" onclick="location.href='reservation.do'">예약하러 가기</button>
        </li>
        <li class="banner_02">
            <div id="banner02Wrap">
                <div id="banner02Title">간편한 상담 일정 관리 시스템 &nbsp; <span id="logo">MEETU</span></div>
                <div id="banner02Text">상담 예약일을 알고 싶다면 캘린더를 통해 상담일정을 확인해보세요!</div>
                <button id="banner02Btn">캘린더 보러가기</button>
            </div>
        </li>
        <li class="banner_03">
            <div id="banner03Wrap">
                <div id="banner03Title">간편한 상담 일정 관리 시스템 &nbsp; <span id="logo">MEETU</span></div>
                <div id="banner03Text">소통을 하고 싶다면 상담 승인 후 쪽지 기능을 통해 대화를 주고받아보세요!</div>
                <button id="banner03Btn" onclick="location.href='message.do'">쪽지함 가기</button>
            </div>
        </li>
    </ul>
</div>

<div id="infoWrap">
    <div id="infoTit">MEETU 서비스</div>
    <div id="infoSubTit">MEETU 서비스에는 어떤 기능이 있나요?</div>
    <div id="greenLine"></div>

    <div id="infoIconWrap">
        <div id="infoIcon">
            <img src="/images/calendarImg.svg" id="calendarImg"/>
            <div id="iconTit">상담일정</div>
            <div id="iconSubTit">캘린더를 통해 상담일정을 확인해 볼 수 있습니다.</div>
        </div>

        <div id="infoIcon">
            <img src="/images/messageImg.svg" id="calendarImg"/>
            <div id="iconTit">쪽지기능</div>
            <div id="iconSubTit">상담예약이 확정된 후 메시지를 주고 받을 수 있습니다.</div>
        </div>

        <div id="infoIcon">
            <img src="/images/locationImg.svg" id="calendarImg"/>
            <div id="iconTit">위치기능</div>
            <div id="iconSubTit">위치기능을 사용하여 만나는 위치를 확인할 수 있습니다.</div>
        </div>

        <div id="infoIcon">
            <img src="/images/alarmImg.svg" id="calendarImg"/>
            <div id="iconTit">알림기능</div>
            <div id="iconSubTit">알림기능을 통해 소식을 받을 수 있습니다.</div>
        </div>
    </div>
</div>

<div id="manageWrap">
    <div id="manage">
        <div id="manageHeader">
            <div id="infoTit">MEETU 서비스</div>
            <div id="infoSubTit">MEETU 서비스에는 어떤 기능이 있나요?</div>
            <div id="greenLine"></div>
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
                                src="/images/prevImg.svg"/></span></a>
                        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit"><img
                                src="/images/nextImg.svg"/></span></a>
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
