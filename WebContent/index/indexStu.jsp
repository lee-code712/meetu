<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>index</title>

    <!--<link rel="stylesheet" href="/index/css/indexStu.css"/>-->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="/index/js/jquery.bxslider.min.js"></script>
    <link href="/index/css/jquery.bxslider.css" rel="stylesheet"/>
	 
    <script src="/index/js/indexStu.js"></script>

    <script>
        var week = new Array('일', '월', '화', '수', '목', '금', '토');
        var today = null;
        var year = null;
        var month = null;
        var dayName = null;
        var firstDay = null;
        var lastDay = null;
        var $tdDay = null;
        var $tdSche = null;
        var jsonData = null;
        $(document).ready(function () {
            drawCalendar();
            initDate();
            drawDays();
            drawSche();
            $("#movePrevMonth").on("click", function () {
                movePrevMonth();
            });
            $("#moveNextMonth").on("click", function () {
                moveNextMonth();
            });
        });

        //Calendar 그리기
        function drawCalendar() {
            var setTableHTML = "";
            setTableHTML += '<table class="calendar">';
            setTableHTML += '<tr><th style="color: red " >일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th style="color: blue">토</th></tr>';
            for (var i = 0; i < 6; i++) {
                setTableHTML += '<tr height="45">';
                for (var j = 0; j < 7; j++) {
                    setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                    setTableHTML += '    <div class="cal-day"></div>';
                    setTableHTML += '    <div class="cal-schedule"></div>';
                    setTableHTML += '</td>';
                }
                setTableHTML += '</tr>';
            }
            setTableHTML += '</table>';
            $("#cal_tab").html(setTableHTML);
        }

        //날짜 초기화
        function initDate() {
            week = new Array('일', '월', '화', '수', '목', '금', '토');
            $tdDay = $("td div.cal-day")
            $tdSche = $("td div.cal-schedule")
            dayCount = 0;
            today = new Date();
            year = today.getFullYear();
            month = today.getMonth() + 1;
            date = today.getDate();
            dayName = week[today.getDay()];
            if (month < 10) {
                month = "0" + month;
            }
            firstDay = new Date(year, month - 1, 1);
            lastDay = new Date(year, month, 0);
        }

        //calendar 날짜표시
        function drawDays() {
            $("#cal_top_year").text(year);
            $("#cal_top_month").text(month);
            $("#cal_top_date").text(date);
            $("#cal_top_dayName").text(dayName);
            for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {
                $tdDay.eq(i).text(++dayCount);
            }
            for (var i = 0; i < 42; i += 7) {
                $tdDay.eq(i).css("color", "red");
            }
            for (var i = 6; i < 42; i += 7) {
                $tdDay.eq(i).css("color", "blue");
            }
        }

        //calendar 월 이동
        function movePrevMonth() {
            month--;
            if (month <= 0) {
                month = 12;
                year--;
            }
            if (month < 10) {
                month = String("0" + month);
            }
            getNewInfo();
        }

        function moveNextMonth() {
            month++;
            if (month > 12) {
                month = 1;
                year++;
            }
            if (month < 10) {
                month = String("0" + month);
            }
            getNewInfo();
        }

        //정보갱신
        function getNewInfo() {
            for (var i = 0; i < 42; i++) {
                $tdDay.eq(i).text("");
                $tdSche.eq(i).text("");
            }
            dayCount = 0;
            firstDay = new Date(year, month - 1, 1);
            lastDay = new Date(year, month, 0);
            drawDays();
            drawSche();
        }

        //데이터 등록
        function setData() {
            jsonData =
                {
                    "2019": {
                        "07": {
                            "17": "제헌절"
                        }
                        , "08": {
                            "7": "칠석"
                            , "15": "광복절"
                            , "23": "처서"
                        }
                        , "09": {
                            "13": "추석"
                            , "23": "추분"
                        }
                    }
                }
        }

        //스케줄 그리기
        function drawSche() {
            setData();
            var dateMatch = null;
            for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {
                var txt = "";
                txt = jsonData[year];
                if (txt) {
                    txt = jsonData[year][month];
                    if (txt) {
                        txt = jsonData[year][month][i];
                        dateMatch = firstDay.getDay() + i - 1;
                        $tdSche.eq(dateMatch).text(txt);
                    }
                }
            }
        }

        $(document).ready(function () {
            var slider_01 = $('.banner_slide').bxSlider({
                auto: true, autoControls: true, mode: 'horizontal',
            });
            // 클릭시 멈춤 현상 해결 //
            $(document).on('click', '.bx-next, .bx-prev', function () {
                slider.stopAuto();
                slider.startAuto();
                slider_01.stopAuto();
                slider_01.startAuto();
            });
            $(document).on('mouseover', '.bx-pager, #bx-pager1', function () {
                slider.stopAuto();
                slider.startAuto();
                slider_01.stopAuto();
                slider_01.startAuto();
                slider_02.stopAuto();
                slider_02.startAuto();
            });
        });
        $(function () {
            var lastScrollTop = 0, delta = 15;
            $(window).scroll(function (event) {
                var st = $(this).scrollTop();
                if (Math.abs(lastScrollTop - st) <= delta) return; // 스크롤값을 받아서 리턴한다.
                if ((st > lastScrollTop) && (lastScrollTop > 0)) {
                    $("header").css("top", "0px"); // 스크롤을 내렸을때 #header의 CSS 속성중 top 값을 -50px로 변경한다.
                    $("header").css("background", "rgba(0, 0, 0, .800)");
                    $("header").css("color", "black");
                } else {
                    $("header").css("top", "0px"); // 스크롤을 올렸을때 #header의 CSS 속성중 top 값을 0px로 변경한다.
                    $("header").css("background", "none");
                    $("header").css("color", "white");
                }
                lastScrollTop = st;
            });
        });
    </script>
    <style>
        /* 배너사이즈와 위치 */
        #banner_wrap {
        	margin-top: 100px;
            margin: 0 auto;
            width: 1920px;
            height: 720px;
        }

        .banner_01 {
            width: 1920px;
            height: 720px;
            background-image: url('/index/images/banner1.svg');
            background-position: center;
            background-size: cover;
        }

        .banner_02 {
            width: 1920px;
            height: 720px;
            background-image: url('/index/images/cat-6309964_1920.jpg');
            background-position: center;
            background-size: cover;
        }

        .banner_03 {
            width: 1920px;
            height: 720px;
            background-image: url('/index/images/fox-1758183_1920.jpg');
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

        #calendar_wrap {
            display: inline-block;
            width: 276px;
            border-radius: 5px 0 0 5px;
        }

        #cal_msg {
            margin-bottom: 20px;
            padding: 14px 0;
            text-align: center;
            border-radius: 50px;
            color: #535353;
            background: white;
            font-size: 14px;
            border: 1px solid #eee;
        }


        table.calendar {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        table.calendar th {
            width: 80px;
            font-size: 18px;
            padding-top: 90px;
            padding-bottom: 30px;
        }

        table.calendar td {
            width: 80px;
            height: 70px;
            text-align: center;
        }

        .cal_tit {
            color: white;
        }


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
            margin-right: 30px;
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

        #gnb div a {
            font-size: 14px;
            position: relative;
        }

        #gnb div a:before {
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

        #gnb div a:hover:before {
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
        	top: 740px;
        	left: 50%;
    		transform: translate(-50%, 0%);
            margin: 0 auto;
            width: 1194px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 2px 4px 0px rgb(0, 0, 0, 0.2);
        }

        #intro,
        #manage {
            margin: 0 auto;
            width: 1194px;
        }

        #subTitle,
        #originTitleWrap {
            display: flex;
            justify-content: center;
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

        #originTitle {
            font-size: 24px;
        }

        #subTitle {
            color: #535353;
            font-size: 10px;
            margin-bottom: 10px;
        }

        #introHeader {
            margin-bottom: 20px;
        }

        #manageHeader {
        	margin-top: 100px;
            margin-bottom: 100px;
        }

        #manageWrap {
            padding: 100px 0 140px 0;
            margin: 0 auto;
            width: 100%;
            background: #FAFAFA;
        }

        #manageBody {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }

        #prevMonth {
            padding-right: 20px;
        }

        #nextMonth {
            padding-left: 20px;
        }

        #manageInnerHeader {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 816px;
            height: 40px;
            border: 1px solid #FBAB7E;
            border-radius: 10px 10px 0 0;
            background: #FBAB7E;
        }

        #manageInnerBody {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 816px;
            height: 500px;
            border-radius: 0 0 10px 10px;
            background: white;
            box-shadow: 0px 2px 4px 0px rgb(0, 0, 0, 0.2);
        }

        #cal_top_year,
        #cal_top_month,
        #dot {
            color: white;
        }

        #shortLine {
            margin: 0 auto;
            margin-top: 24px;
            width: 30px;
            height: 4px;
            background: #FBAB7E;
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
			color: #FBAB7E;
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
			border: 1px solid #FBAB7E;
			color: #FBAB7E;
			border-radius: 500px;
			background: white;
		}
		
		#reservationBtn:hover {
			display: block;
			margin: 0 auto;
			width: 200px;
			padding: 8px 0;
			border: 1px solid #FBAB7E;
			color: white;
			border-radius: 500px;
			background: #FBAB7E;
			cursor: pointer;
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
        <div id="gnb">
            <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
            <div><a id="reserveIcon" href="reservationPro.do">상담예약</a></div>
            <div><a id="messageIcon" href="message.do">쪽지함</a></div>
        </div>

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

<div id="banner_wrap">
    <ul class="banner_slide">
        <li class="banner_01"><div id="banner1Title">간편한 상담 예약 시스템 &nbsp; <span id="logo">MEETU</span></div>
        	<div id="banner1Text">교수님과 상담을 하고 싶다면 간편한 상담 예약 시스템 MEETU를 사용하여 상담을 예약해보세요!</div>
        	<button id="reservationBtn">예약하러 가기</button>
      	</li>
        <li class="banner_02"></li>
        <li class="banner_03"></li>
    </ul>
</div>

<div id="introWrap">
    <div id="intro">
        <div id="introBody">
            <div id="introBox">
                <div id="introImg"><img src="images/calendarImg.svg"/></div>
                <div id="introTitle">상담일정</div>
                <div id="introText">상담일정을 통해 등록된 예약을<br/>한 눈에 확인할 수 있습니다.</div>
            </div>

            <div id="introBox">
                <div id="introImg"><img src="images/messageImg.svg"/></div>
                <div id="introTitle">쪽지기능</div>
                <div id="introText">상담예약이 확정된 교수님과<br/>메시지를 주고 받을 수 있습니다.</div>
            </div>

            <div id="introBox">
                <div id="introImg"><img src="images/clockImg.svg"/></div>
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

        <div id="manageBody">
            <div id="calendar_wrap">
                <div id="cal_msg">등록된 예약이 없습니다.</div>
                <div id="cal_msg">등록된 예약이 없습니다.</div>
                <div id="cal_msg">등록된 예약이 없습니다.</div>
            </div>

            <div id="manageInnerWrap">
                <div id="manageInnerHeader">
                    <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">◀</span></a>
                    <span id="cal_top_year"></span><span id="dot">.</span>
                    <span id="cal_top_month"></span>
                    <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">▶</span></a>
                </div>
                <div id="manageInnerBody">
                    <div id="cal_tab" class="cal"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--               <div id="more_btn">
                                   + <span id="cal_top_dayName"></span>요일
                                   (<span id="cal_top_date"></span>일)
                                   일정 더 보기
                               </div>-->
<div id="footer">
    Copyrights © 2021 by 시나브로. All Rights Reserved.
</div>
</body>
</html>
