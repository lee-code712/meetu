<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>MEETU</title>

    <link rel="stylesheet" href="/index/css/indexStu.css"/>

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
            setTableHTML += '<tr><th style="color: #FB7E7E; padding-left: 6px;">일</th><th style="padding-left: 6px;">월</th><th style="padding-left: 6px;">화</th><th style="padding-left: 6px;">수</th><th style="padding-left: 6px;">목</th><th style="padding-left: 6px;">금</th><th style="color: #7E99FB; padding-left: 6px;">토</th></tr>';
            for (var i = 0; i < 6; i++) {
                setTableHTML += '<tr height="120px" >';
                for (var j = 0; j < 7; j++) {
                    setTableHTML += '<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                    setTableHTML += '    <div style="padding: 0 0 0 10px; background: white" class="cal-day"></div>';
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

                if (today.getFullYear()) {
                    $tdDay.eq(today.getDay()).css("width", "20px");
                    $tdDay.eq(today.getDay()).css("height", "24px");
                    $tdDay.eq(today.getDay()).css("background", "#1abc9c");
                    $tdDay.eq(today.getDay()).css("color", "white");
                    $tdDay.eq(today.getDay()).css("border-radius", "50px");
                }
            }
            for (var i = 0; i < 42; i += 7) {
                $tdDay.eq(i).css("color", "#FB7E7E");
            }


            for (var i = 6; i < 42; i += 7) {
                $tdDay.eq(i).css("color", "#7E99FB");
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
                    "2021": {
                        "08": {
                            "7": "000교수님 오전 9:00"
                            , "15": "000교수님 오전 10:00"
                            , "23": "000교수님 오전 12:00"
                        }
                        , "09": {
                            "4": "000교수님 오후 1:00"
                            , "23": "000교수님 오후 2:00"
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
                        $tdSche.eq(dateMatch).css("background", "#1abc9c");
                        $tdSche.eq(dateMatch).css("color", "white");
                        $tdSche.eq(dateMatch).css("padding-left", "10px");
                        $tdSche.eq(dateMatch).css("border-radius", "3px");
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
</head>

<body>
<div id="header">
    <div id="headerInner">
        <div id="headerInnerL">
            <div id="title">MEETU</div>
            <div id="gnb">
                <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
                <div><a id="reserveIcon" href="reservationPro.do">상담예약</a></div>
                <div><a id="messageIcon" href="message.do">쪽지함</a></div>
            </div>
        </div>
        <div id="headerInnerR">
            <div id="dropdown">
                <div id="dropdown-button">${mem_dto.getName()} 😊</div>
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
                    <div id="introImg"><img src="/images/calendarImage.svg"/></div>
                    <div id="introTitle">상담일정</div>
                    <div id="introText">상담일정을 통해 등록된 예약을<br/>한 눈에 확인할 수 있습니다.</div>
                </div>

                <div id="introBox">
                    <div id="introImg"><img src="/images/messageImage.svg"/></div>
                    <div id="introTitle">쪽지기능</div>
                    <div id="introText">상담예약이 확정된 교수님과<br/>메시지를 주고 받을 수 있습니다.</div>
                </div>

                <div id="introBox">
                    <div id="introImg"><img src="/images/clockImage.svg"/></div>
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
            <!--
            <span id="cal_top_dayName"></span>요일
                    (<span id="cal_top_date"></span>일) -->
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

    <div id="footer">
        Copyrights © 2021 by 시나브로. All Rights Reserved.
    </div>
</body>
</html>
