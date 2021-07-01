<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Untitled Document</title>
    
    <link rel="stylesheet" href="../css/index1.css" />
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

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

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="jquery.bxslider.min.js"></script>
    <link href="jquery.bxslider.css" rel="stylesheet"/>
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
            setTableHTML += '<tr><th style="color: red " >SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THUR</th><th>FRI</th><th style="color: blue">SAT</th></tr>';
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
            margin: 0 auto;
            width: 1920px;
            height: 720px;
            position: relative;
        }

        .banner_01 {
            width: 1920px;
            height: 720px;
            background-image: url('../images/cat-6309964_1920.jpg');
            background-position: center;
            background-size: cover;
        }

        .banner_02 {
            width: 1920px;
            height: 720px;
            background-image: url('../images/cat-2536662_1920.jpg');
            background-position: center;
            background-size: cover;
        }

        .banner_03 {
            width: 1920px;
            height: 720px;
            background-image: url('../images/fox-1758183_1920.jpg');
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

        header {
            width: 100%;
            height: 100px;
            z-index: 10;
            top: 0px;
            position: fixed;
            box-sizing: border-box;
            transition: All 0.2s ease;
            -webkit-transition: All 0.2s ease;
            -moz-transition: All 0.2s ease;
            -o-transition: All 0.2s ease;
        }

        #title {
            width: 100%;
            height: 100%;
            color: white;
            font-size: 24px;
            font-family: 'Yellowtail', cursive;
        }

        #title:hover {
            cursor: pointer;
        }

        #gnb {
            width: 100%;
            height: 100%;
        }

        #gnb div {
            font-size: 14px;
            color: white;
        }

        #gnb div:first-child {
            padding-left: 0px;
        }

        #gnb div a:hover,
        #gnb div a:focus {
            color: #4D4D4D;
            cursor: pointer;
        }

        #icon img {
            height: auto;
            padding-left: 28px;
        }

        #icon img:first-child {
            padding-left: 0px;
        }

        #icon img:hover {
            cursor: pointer;
        }

        #footer {
            display: flex;
            margin: 0 auto;
            width: 1920px;
            height: 200px;
            background: #333333;
            justify-content: center;
            align-items: center;
            color: white;
        }

        #header_inner {
            display: flex;
            margin: 0 auto;
            width: 1194px;
            height: 100px;
            align-items: center;
        }

        #title {
            display: flex;
            width: 180px;
            font-size: 24px;
            font-weight: bold;
            align-items: center;
        }

        #gnb {
            display: flex;
            font-size: 14px;
            font-weight: bold;
            color: white;
            align-items: center;
        }

        #gnb a {
            margin-left: 80px;
        }

        #gnb div:first-child {
            padding-left: 0px;
        }

        #calendar_wrap {
            width: 348px;
            height: 700px;
            border-radius: 5px 0 0 5px;
            background: #3E454D;
        }

        #section {
            display: table;
            margin: 40px auto;
            margin-bottom: 100px;
            width: 1194px;
            height: 390px;
        }

        #calendar {
            float: right;
            background: white;
        }

        #calendarHeader {
            display: table-cell;
            padding-left: 30px;
            width: 853px;
            height: 60px;
            border-bottom: 1px solid #eee;
            border-radius: 0 5px 0 0;
            vertical-align: middle;
            background: white;
            font-weight: bold;
        }

        #calendarBody {
            display: table;
            width: 853px;
            height: 640px;
            border-radius: 0 0 5px 0;
            background-color: white;
        }

        .cal_top {
            display: table-cell;
            float: left;
            margin: 0 0 0 44px;
            width: 260px;
            height: 240px;
            text-align: center;
            font-size: 18px;
            font-family: 'Yellowtail', cursive;
            color: white;
        }

        #cal_tab {
            display: table-cell;
            text-align: center;
            width: 400px;
            height: 320px;
        }

        #cal_msg {
            margin-left: 24px;
            padding: 20px 10px;
            width: 300px;
            height: 214px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            background-color: #F9F9F9;
            color: #C4C4C4;
            font-size: 14px;
        }

        table.calendar {
            display: inline-table;
            margin-top: 80px;
            text-align: left;
        }

        table.calendar th {
            width: 50px;
            text-align: center;
            font-size: 18px;
            padding-bottom: 20px;
            font-family: 'Yellowtail', cursive;
        }

        table.calendar td {
            width: 100px;
            height: 86px;
            text-align: center;
        }

        #cal_top_date {
            margin-top: 20px;
            font-size: 36px;
        }

        .cal_tit {
            padding: 10px;
            color: white;
        }

        body {
            background: #edf0f2;
        }

        #logout_btn {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 0 0 24px;
            width: 300px;
            cursor: pointer;
        }

        #logo {
            color: black;
            font-size: 36px;
            font-family: 'Yellowtail', cursive;
        }

        #l_text {
            font-size: 24px;
        }

        #l_title {
            margin-bottom: 40px;
        }

        #alertIcon:hover,
        #noticeIcon:hover,
        #reserveIcon:hover,
        #messageIcon:hover,
        #myPageIcon:hover {
            cursor: pointer;
        }

        #intro {
            margin: 0 auto;
            margin-top: 80px;
            width: 1920px;
            height: 800px;
            background: white;
        }

        #intro_title {
            padding-top: 80px;
            width: 1194px;
            margin: 0 auto;
        }

        #intro_text {
            margin: 40px auto;
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

        <img src="../images/notifications_black_24dp.svg" id="alertIcon"/>
    </nav>
</header>


<div id="banner_wrap">
    <ul class="banner_slide">
        <li class="banner_01"></li>
        <li class="banner_02"></li>
        <li class="banner_03"></li>
    </ul>
</div>


<table id="section">
    <tr>
        <td>
            <div id="l_title"><span id="logo">MEETU</span> &nbsp;&nbsp; <span id="l_text">상담일정 관리</span></div>
        </td>
    </tr>
    <tr>
        <td id="calendar_wrap">
            <div class="cal_top">
                <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">◀</span></a>
                <span id="cal_top_year"></span>.
                <span id="cal_top_month"></span>
                <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">▶</span></a>
                <div id="cal_top_date"></div>
                <span id="cal_top_dayName"></span>요일
            </div>

            <button type="button" class="btn btn-dark" id="logout_btn">+ 등록된 일정 더보기</button>
            <div id="cal_msg"><p>등록된 일정이 없습니다.</p>
                <p>등록된 일정이 없습니다.</p>
                <p>등록된 일정이 없습니다.</p>
                <p>등록된 일정이 없습니다.</p>
                <p>등록된 일정이 없습니다.</p></div>
        </td>

        <td id="calendar">
            <div id="calendarHeader">
                상담일정
            </div>
            <div id="calendarBody">
                <div id="cal_tab" class="cal"></div>
            </div>
        </td>
    </tr>
</table>

<div id="intro">
    <div id="intro_title"><span id="logo">MEETU</span> &nbsp;&nbsp; <span id="l_text">소개</span></div>
    <div id="intro_text">소개 부분 만드는 중 + 배너 이미지 준비 중 (일단 샘플로 넣어둠)</div>
</div>


<div id="footer">
    Copyrights © 2021 by 시나브로. All Rights Reserved.
</div>
</body>
</html>
