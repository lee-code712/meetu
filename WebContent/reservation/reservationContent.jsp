<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 페이지</title>

    <link rel="stylesheet" href="../components/css/header.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/reservation/js/reservationContent.js"></script>

    <script>
        $(function () {
            var btn1 = $(".startTimeBox")
            btn1.find("a").click(function () {
                btn1.removeClass("active");
                $(this).parent().addClass("active");
            })
        })

        $(function () {
            var btn2 = $(".timeBox")
            btn2.find("a").click(function () {
                btn2.removeClass("active");
                $(this).parent().addClass("active");
            })
        })

        $(function () {
            var btn3 = $(".typeBtn")
            btn3.find("a").click(function () {
                btn3.removeClass("active");
                $(this).parent().addClass("active");
            })
        })
    </script>

    <style type="text/css">
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

        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
            list-style: none;
        }

        .reservationWrap {
            display: flex;
            margin: 0 auto;
            width: 1194px;
            height: 840px;
        }

        .mylist {
            margin-top: 80px;
            width: 18rem;
            height: 840px;
            border: none;
            border-radius: 10px;
        }

        .selectProf {
            display: flex;
            align-items: flex-start;
            width: 100%;
            height: 40px;
            font-size: 18px;
            font-weight: bold;
            border-bottom: 1px dotted #363B40;
        }

        .list {
            line-height: 40px;
            font-size: 14px;
            cursor: pointer;
            border-bottom: 1px dotted #C4C4C4;
        }

        .profList th,
        .profList td {
            padding: 10px;
            font-size: 14px;
        }

        .profList td {
            text-align: center;
        }

        .profInfo a {
            color: #2575AF;
        }

        .selectProf a {
            color: #CE2E2E;
        }

        .profInfo a:hover {
            cursor: pointer;
        }

        .selectProf a:hover {
            cursor: pointer;
        }

        #reservationContentBodyBg {
            background: #FAFAFA;
        }

        #contentBlank {
            width: 700px;
            height: 20px;

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

        .reservationInner {
            margin-top: 80px;
            display: block;
            width: 894px;
            height: 840px;
        }

        .reservationInnerWrap {
            width: 900px;
            height: 550px;
        }

        .reservationResult {
            display: block;
            margin-left: 80px;
            width: 820px;
        }

        .contentTitle {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 10px 20px;
            width: 830px;
            background: white;
            font-weight: bold;
            border-top: 1px solid #eee;
            border-left: 1px solid #eee;
            border-right: 1px solid #eee;
        }

        .contentBody {
            padding: 20px;
            width: 830px;
            background: white;
            border: 1px solid #eee;
            font-weight: bold;
        }

        .startTimeBox {
            display: flex;
            align-items: center;
            justify-content: center;

            height: 40px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
            cursor: pointer;
        }

        .startTimeBox:hover > a,
        .startTimeBox:focus > a,
        .startTimeBox:active > a,
        .startTimeBox.active > a {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 40px;
            width: 96px;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
            cursor: pointer;
            border: 1px solid #F8CA6B;
            background: #F8CA6B;
            color: white;

        }

        .timeBox {
            display: flex;
            align-items: center;
            justify-content: center;

            height: 40px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
            cursor: pointer;
        }

        .timeBox:hover,
        .startTimeBox:hover {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 40px;
            width: 96px;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
            cursor: pointer;
            border: 1px solid #F8CA6B;
            background: #F8CA6B;
            color: white;
        }

        .typeBtn:hover {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 40px;
            width: 96px;
            border-radius: 50px;
            text-align: center;
            font-weight: regular;
            cursor: pointer;
            border: 1px solid #F8CA6B;
            background: #F8CA6B;
            color: white;
        }

        .timeBox:hover > a,
        .timeBox:focus > a,
        .timeBox:active > a,
        .timeBox.active > a {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 40px;
            width: 96px;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
            cursor: pointer;
            border: 1px solid #F8CA6B;
            background: #F8CA6B;
            color: white;

        }

        .typeBtnWrap {
            display: flex;
            margin-left: 240px;
            margin-bottom: 20px;
            flex-direction: row;
            justify-content: space-between;
            width: 328px;
        }

        .typeBtn {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 40px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 50px;
            text-align: center;
            font-weight: regular;
            cursor: pointer;
        }

        .typeBtn:hover > a,
        .typeBtn:focus > a,
        .typeBtn:active > a,
        .typeBtn.active > a {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 40px;
            width: 96px;
            border-radius: 50px;
            text-align: center;
            font-weight: regular;
            cursor: pointer;
            border: 1px solid #F8CA6B;
            background: #F8CA6B;
            color: white;
        }

        .reservationBtn {
            margin-top: 40px;
            float: right;
            display: block;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #FBAB7E;
            color: white;
            border: none;
            border: 1px solid #FBAB7E;
        }

        #topHeader {
            width: 100%;
            height: 34px;
            background-color: #FBAB7E;
            background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%);
        }

        .reservationBtn:hover {
            cursor: pointer;
        }

        .timeTitle {
            margin-bottom: 20px;
        }

        .timeBoxWrap {
            margin-bottom: 20px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 328px;
        }

        #anotherReason {
            width: 236px;
            border-radius: 30px;
            border: 1px solid #C4C4C4;
            margin-left: 20px;
            padding: 4px 10px;
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

        #calendar td {
            text-align: center;
            border-radius: 10px;
        }

        #selectBox {
            margin-top: 20px;
            float: right;
        }

        #selectOk {
            color: #4E65B5;
        }

        #selectNotOk {
            margin-left: 20px;
            color: #DA3D3D;
        }

        a {
            color: #000000;
            text-decoration: none;
        }

        .scriptCalendar {
            text-align: center;
            margin-left: 234px;
        }

        .scriptCalendar > thead > tr > td {
            width: 48px;
            height: 48px;
            border-radius: 50px;
        }

        .scriptCalendar > thead > tr:first-child > td {
            font-weight: bold;
        }

        .scriptCalendar > thead > tr:last-child > td {
            background-color: #90EE90;
        }

        .scriptCalendar > tbody > tr > td {
            width: 48px;
            height: 48px;
            border-radius: 50px;
        }


        #timeBoxesWrap,
        #reasonWrap {
            margin-left: 240px;
        }

        input[type=checkbox]:not(old),
        input[type=radio   ]:not(old) {
            width: 28px;
            margin: 0;
            padding: 0;
            opacity: 0;
        }

        input[type=checkbox]:not(old) + label,
        input[type=radio   ]:not(old) + label {
            display: inline-block;
            margin-left: -28px;
            padding-left: 28px;
            background: url('/reservation/images/checkesImg.svg') no-repeat 0 0;
            line-height: 24px;
        }

        input[type=checkbox]:not(old):checked + label {
            background-position: 0 -24px;
        }

        input[type=radio]:not(old):checked + label {
            background-position: 0 -48px;
        }
    </style>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            buildCalendar();
        });

        var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할

        /**
         * @brief   이전달 버튼 클릭
         */
        function prevCalendar() {
            this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            buildCalendar();    // @param 전월 캘린더 출력 요청
        }

        /**
         * @brief   다음달 버튼 클릭
         */
        function nextCalendar() {
            this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            buildCalendar();    // @param 명월 캘린더 출력 요청
        }

        /**
         * @brief   캘린더 오픈
         * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
         */
        function buildCalendar() {

            let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
            let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

            let tbCalendar = document.querySelector(".scriptCalendar > tbody");


            document.getElementById("calYear").innerText = today.getFullYear();                                  // @param YYYY월
            document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // @param MM월


            // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
            while (tbCalendar.rows.length > 0) {
                tbCalendar.deleteRow(tbCalendar.rows.length - 1);
            }


            // @param 첫번째 개행
            let row = tbCalendar.insertRow();


            // @param 날짜가 표기될 열의 증가값
            let dom = 1;

            // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
            //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.


            let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

            // @param 달력 출력

            // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
            for (let day = 1 - doMonth.getDay(); daysLength >= day; day++) {

                let column = row.insertCell();

                // @param 평일( 전월일과 익월일의 데이터 제외 )
                if (Math.sign(day) == 1 && lastDate.getDate() >= day) {


                    // @param 평일 날짜 데이터 삽입

                    column.innerText = autoLeftPad(day, 2);


                    // @param 일요일인 경우
                    if (dom % 7 == 1) {
                        column.style.color = "#FF4D4D";
                    }

                    // @param 토요일인 경우
                    if (dom % 7 == 0) {
                        column.style.color = "#4D4DFF";
                        row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
                    }

                }

                // @param 평일 전월일과 익월일의 데이터 날짜변경
                else {
                    let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
                    column.innerText = autoLeftPad(exceptDay.getDate(), 2);
                    column.style.color = "#E5E5E5";
                }

                // @brief   전월, 명월 음영처리
                // @details 현재년과 선택 년도가 같은경우
                if (today.getFullYear() == date.getFullYear()) {

                    // @details 현재월과 선택월이 같은경우
                    if (today.getMonth() == date.getMonth()) {

                        // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                        if (date.getDate() > day && Math.sign(day) == 1) {
                            column.style.color = "#E5E5E5";
                        }

                        // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                        else if (date.getDate() < day && lastDate.getDate() >= day) {
                            column.style.backgroundColor = "#FFFFFF";
                            column.style.cursor = "pointer";
                            column.onclick = function () {
                                calendarChoiceDay(this);
                            }
                        }

                        // @details 현재일인 경우
                        else if (date.getDate() == day) {
                            column.style.backgroundColor = "#FBAB7E";
                            column.style.cursor = "pointer";
                            column.onclick = function () {
                                calendarChoiceDay(this);
                            }
                        }

                        // @details 현재월보다 이전인경우
                    } else if (today.getMonth() < date.getMonth()) {
                        if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                            column.style.color = "#E5E5E5";
                        }
                    }

                    // @details 현재월보다 이후인경우
                    else {
                        if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                            column.style.backgroundColor = "#FFFFFF";
                            column.style.cursor = "pointer";
                            column.onclick = function () {
                                calendarChoiceDay(this);
                            }
                        }
                    }
                }

                // @details 선택한년도가 현재년도보다 작은경우
                else if (today.getFullYear() < date.getFullYear()) {
                    if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#E5E5E5";
                    }
                }

                // @details 선택한년도가 현재년도보다 큰경우
                else {
                    if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function () {
                            calendarChoiceDay(this);
                        }
                    }
                }


                dom++;

            }
        }

        /**
         * @brief   날짜 선택
         * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
         */
        function calendarChoiceDay(column) {

            // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
            if (document.getElementsByClassName("choiceDay")[0]) {
                document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
                // 추가 - 기존 선택일이 존재하는 경우 hidden 값 삭제
                $("#choiceDay").remove();
                $("#choiceMonth").remove();
            }

            // @param 선택일 체크 표시
            column.style.backgroundColor = "#F8CA6B";
            column.style.color = "white";


            // @param 선택일 클래스명 변경

            column.classList.add("choiceDay");

            // 추가 - hidden 값 생성
            // 선택한 일
            var newInputDayElement = document.createElement("input");
            $(newInputDayElement).attr("type", "hidden");
            $(newInputDayElement).attr("id", "choiceDay");
            $(newInputDayElement).attr("name", "choiceDay");

            var contentDay = column.innerHTML;
            $(newInputDayElement).attr("value", contentDay);

            $("#contentBody").append(newInputDayElement);

            // 선택한 월
            var newInputMonthElement = document.createElement("input");
            $(newInputMonthElement).attr("type", "hidden");
            $(newInputMonthElement).attr("id", "choiceMonth");
            $(newInputMonthElement).attr("name", "choiceMonth");

            var contentMonth = document.getElementById("calMonth").innerHTML;
            $(newInputMonthElement).attr("value", contentMonth);

            $("#contentBody").append(newInputMonthElement);
        }

        /**
         * @brief   숫자 두자릿수( 00 ) 변경
         * @details 자릿수가 한지라인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
         * @param   num     앞에 0을 붙일 숫자 값
         * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
         */
        function autoLeftPad(num, digit) {
            if (String(num).length < digit) {
                num = new Array(digit - String(num).length + 1).join("0") + num;
            }
            return num;

        }

    </script>
</head>

<body id="reservationContentBodyBg">
<div id="topHeader">
    <div id="topHeaderInner">
        <div><a href="myPage.do">${mem_dto.getName()}님 환영합니다!</a><span>|</span><span><a href="logout.do">로그아웃</a></span>
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

        <img src="/reservation/images/bell.svg" id="alertIcon"/>
    </div>
</div>

<form method="post" name="reservation_form" action="reservation.do" onsubmit="return ck_reservation_form()">
    <div class="reservationWrap">
        <div>
            <ul class="mylist">
                <li class="selectProf"><img src="/reservation/images/beenhere_black_24dp.svg"/>&nbsp;&nbsp;상담예약</li>
                <li class="list" id="name">▶ 교수명: ${param.name}</li>
                <li class="list" id="dept">▶ 학과: ${param.major}</li>
                <li class="list" id="course">▶ 담당과목: ${param.course}</li>
                <li class="list" id="email">▶ 이메일: ${param.email}</li>
                <li class="list" id="office">▶ 연구실 위치: ${param.office}</li>
            </ul>
        </div>

        <div class="reservationInner">
            <div class="reservationInnerWrap">
                <table class="reservationResult">
                    <tr>
                        <td class="contentTitle">날짜 및 시간 선택</td>
                    </tr>
                    <tr>
                        <td class="contentBody" id="contentBody">
                            <table class="scriptCalendar">
                                <thead>
                                <tr>
                                    <td onClick="prevCalendar();" style="cursor:pointer; color: #FBAB7E;">◀</td>
                                    <td colspan="5">
                                        <span id="calYear">YYYY</span>년
                                        <span id="calMonth">MM</span>월
                                    </td>
                                    <td onClick="nextCalendar();" style="cursor:pointer; color: #FBAB7E;">▶</td>
                                </tr>
                                <tr>
                                    <td style="background: white;">일</td>
                                    <td style="background: white;">월</td>
                                    <td style="background: white;">화</td>
                                    <td style="background: white;">수</td>
                                    <td style="background: white;">목</td>
                                    <td style="background: white;">금</td>
                                    <td style="background: white;">토</td>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                            <div id="selectBox"><span id="selectOk">■</span> 선택 가능 <span id="selectNotOk">■</span> 선택 불가
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td id="contentBlank"></td>
                    </tr>

                    <tr id="contentWrap">
                        <td class="contentTitle">상담 시간</td>
                    </tr>
                    <tr>
                        <td class="contentBody">
                            <div id="timeBoxesWrap">
                                <div class="timeTitle" id="startTimeTitle"><span style="color: #FBAB7E;">◈</span> 상담 시작
                                    시간
                                </div>
                                <div>
                                    <div class="timeBoxWrap">
                                        <div class="startTimeBox" id="9am"><a>9:00</a></div>
                                        <div class="startTimeBox" id="10am"><a>10:00</a></div>
                                        <div class="startTimeBox" id=11am"><a>11:00</a></div>
                                    </div>
                                    <div class="timeBoxWrap">
                                        <div class="startTimeBox" id="12pm"><a>12:00</a></div>
                                        <div class="startTimeBox" id="13pm"><a>13:00</a></div>
                                        <div class="startTimeBox" id="14pm"><a>14:00</a></div>
                                    </div>
                                    <div class="timeBoxWrap">
                                        <div class="startTimeBox" id="15pm"><a>15:00</a></div>
                                        <div class="startTimeBox" id="16pm"><a>16:00</a></div>
                                        <div class="startTimeBox" id="17pm"><a>17:00</a></div>
                                    </div>
                                </div>
                                <br/>
                                <div class="timeTitle" id="timeTitle"><span style="color: #FBAB7E;">◈</span> 상담 시간</div>
                                <div class="timeBoxWrap">
                                    <div class="timeBox" id="30m"><a>30분</a></div> &nbsp;&nbsp;
                                    <div class="timeBox" id="1h"><a>1시간</a></div> &nbsp;&nbsp;
                                    <div class="timeBox" id="2h"><a>2시간</a></div>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td id="contentBlank"></td>
                    </tr>

                    <tr id="contentWrap">
                        <td class="contentTitle">상담 신청 사유</td>
                    </tr>

                    <tr>
                        <td class="contentBody">
                            <div id="reasonWrap">
                                <div>
                                    <input id="radio1" type="radio" name="radio" value="1" checked="checked"><label
                                        for="radio1">전담 교수 상담</label>
                                </div>
                                <div>
                                    <input id="radio2" type="radio" name="radio" value="2"><label for="radio2">진로
                                    상담</label>
                                </div>
                                <div>
                                    <input id="radio3" type="radio" name="radio" value="3"><label for="radio3">휴학
                                    상담</label>
                                </div>
                                <div>
                                    <input id="radio4" type="radio" name="radio" value="4"><label for="radio4">대학원
                                    상담</label>
                                </div>
                                <div>
                                    <input id="radio5" type="radio" name="radio" value="5"><label
                                        for="radio5">기타:</label>
                                    <input type="input" placeholder="내용을 적어주세요." id="anotherReason">
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td id="contentBlank"></td>
                    </tr>

                    <tr id="contentWrap">
                        <td class="contentTitle">상담 유형</td>
                    </tr>

                    <tr>
                        <td class="contentBody">
                            <div class="typeBtnWrap">
                                <div id="typeBtnOff" class="typeBtn"><a>오프라인</a></div>
                                <div id="typeBtnOn" class="typeBtn"><a>온라인</a></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="reservationBtn" type="submit" value="예약하기"/>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
    </div>
</form>
</body>
</html>
