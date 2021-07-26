<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 페이지</title>

    <script type="text/javascript">
        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();//today의 Date를 세어주는 역할
        function prevCalendar() {//이전 달
            // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일
            //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            buildCalendar(); //달력 cell 만들어 출력
        }

        function nextCalendar() {//다음 달
            // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일
            //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            buildCalendar();//달력 cell 만들어 출력
        }

        function buildCalendar() {//현재 달 달력 만들기
            var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
            //이번 달의 첫째 날,
            //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.
            //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다.
            //왜냐면 getMonth()는 0~11을 반환하기 때문
            var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
            //이번 달의 마지막 날
            //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
            //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에
            //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
            var tbCalendar = document.getElementById("calendar");
            //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            //테이블에 정확한 날짜 찍는 변수
            //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
            //new를 찍지 않아서 month는 +1을 더해줘야 한다.
            tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";

            /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
            while (tbCalendar.rows.length > 2) {
                //열을 지워줌
                //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                tbCalendar.deleteRow(tbCalendar.rows.length - 1);
                //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지
                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
            }
            var row = null;
            row = tbCalendar.insertRow();
            //테이블에 새로운 열 삽입//즉, 초기화
            var cnt = 0;// count, 셀의 갯수를 세어주는 역할
            // 1일이 시작되는 칸을 맞추어 줌
            for (i = 0; i < doMonth.getDay(); i++) {
                /*이번달의 day만큼 돌림*/
                cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
            }
            /*달력 출력*/
            for (i = 1; i <= lastDate.getDate(); i++) {
                //1일부터 마지막 일까지 돌림
                cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
                if (cnt % 7 == 1) {/*일요일 계산*/
                    //1주일이 7일 이므로 일요일 구하기
                    //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                    cell.innerHTML = "<font color=#F79DC2>" + i
                    //1번째의 cell에만 색칠
                }
                if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
                    //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                    cell.innerHTML = "<font color=skyblue>" + i
                    //7번째의 cell에만 색칠
                    row = calendar.insertRow();
                    //토요일 다음에 올 셀을 추가
                }
                /*오늘의 날짜에 노란색 칠하기*/
                if (today.getFullYear() == date.getFullYear()
                    && today.getMonth() == date.getMonth()
                    && i == date.getDate()) {
                    //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                    cell.bgColor = "#FBAB7E";//셀의 배경색을 노랑으로
                }
            }
        }
    </script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link rel="stylesheet" href="/reservation/css/reservationContent.css"/>
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
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <script src="/reservation/js/reservationContent.js"></script>
    
    <style> 
    #calendar {
    	width:320px;
    	height: 280px;
    }
    
    #calendar td {
    	text-align: center;
    	border-radius: 10px;
    }
    
    #selectBox {
    	margin-top: 20px;
    }
    
    #selectOk {
    	color: #4E65B5;
    }
    
    #selectNotOk {
    	color: #DA3D3D;
    }
   
    </style>
</head>

<body id="reservationContentBodyBg">
<div id="topHeader">
    <div id="topHeaderInner">
        <div></div>
    </div>
</div>
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
                <a href="logout.do">로그아웃</a>
            </div>
        </div>

        <img src="/components/images/notification.svg" id="alertIcon"/>
    </div>
</div>

<form method="post" action="">
    <div class="reservationWrap">
        <div>
            <ul class="mylist">
                <li class="selectProf"><img src="/reservation/images/beenhere_black_24dp.svg"/>&nbsp;&nbsp;상담예약</li>
                <li class="list">▶ 교수명: ${param.name}</li>
                <li class="list">▶ 학과: ${param.major}</li>
                <li class="list">▶ 담당과목: ${param.course}</li>
                <li class="list">▶ 이메일: ${param.email}</li>
                <li class="list">▶ 연구실 위치: ${param.office}</li>
            </ul>
        </div>

        <div class="reservationInner">
            <div class="reservationInnerWrap">
                <table class="reservationResult">
                    <tr class="contentWrap">
                        <td class="contentTitle">날짜 및 시간 선택</td>
                        <td class="contentBody">
                            <table id="calendar" align="center">
                                <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
                                    <td><label onclick="prevCalendar()">◀</label></td>
                                    <td align="center" id="tbCalendarYM" colspan="5">
                                        yyyy년 m월
                                    </td>
                                    <td><label onclick="nextCalendar()">▶

                                    </label></td>
                                </tr>
                                <tr>
                                    <td align="center"><font color="#F79DC2">일</td>
                                    <td align="center">월</td>
                                    <td align="center">화</td>
                                    <td align="center">수</td>
                                    <td align="center">목</td>
                                    <td align="center">금</td>
                                    <td align="center"><font color="skyblue">토</td>
                                </tr>
                            </table>
                            <script language="javascript" type="text/javascript">
                                buildCalendar();//
                            </script>
                            <div id="selectBox"><span id="selectOk">■</span> 선택 가능 <span id="selectNotOk">■</span> 선택 불가</div>
                        </td>
                    </tr>
                    <tr class="contentWrap">
                        <td class="contentTitle">상담 시간</td>
                        <td class="contentBody">
                            <div class="timeTitle">◈ 상담 시작 시간</div>
                            <div>
                                <div>
                                    <div class="startTimeBox">9:00</div> &nbsp;&nbsp;
                                    <div class="startTimeBox">10:00</div> &nbsp;&nbsp;
                                    <div class="startTimeBox">11:00</div>
                                </div>
                                <div class="timdBoxWrap">
                                    <div class="startTimeBox">12:00</div> &nbsp;&nbsp;
                                    <div class="startTimeBox">13:00</div> &nbsp;&nbsp;
                                    <div class="startTimeBox">14:00</div>
                                </div>
                                <div class="timdBoxWrap">
                                    <div class="startTimeBox">15:00</div> &nbsp;&nbsp;
                                    <div class="startTimeBox">16:00</div> &nbsp;&nbsp;
                                    <div class="startTimeBox">17:00</div>
                                </div>
                            </div>
                            <br/>
                            <div class="timeTitle">◈ 상담 시간</div>
                            <div>
                                <div class="timeBox">30분</div> &nbsp;&nbsp;
                                <div class="timeBox">1시간</div> &nbsp;&nbsp;
                                <div class="timeBox">2시간</div>
                            </div>
                        </td>
                    </tr>
                    <tr class="contentWrap">
                        <td class="contentTitle">상담 신청 사유</td>
                        <td class="contentBody">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    전담 교수 면담
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    진로 상담
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    휴학 상담
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    대학원 상담
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    기타: &nbsp; <input type="text" class="reason"/>
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr class="contentWrap">
                        <td class="contentTitle">상담 유형</td>
                        <td class="contentBody">
                            <div class="typeBtnWrap">
                                <div class="typeBtnOff">오프라인</div>
                                <div class="typeBtnOn">온라인</div>
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
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-8216c69d01441f36c0ea791ae2d4469f0f8ff5326f00ae2d00e4bb7d20e24edb.js"></script>

<script id="rendered-js">
    var div2 = document.getElementsByClassName("timeBox");

    function handleClick(event) {
        console.log(event.target);
        console.log(event.target.classList);
        if (event.target.classList[1] === "clicked") {
            event.target.classList.remove("clicked");
        } else {
            for (var i = 0; i < div2.length; i++) {
                if (window.CP.shouldStopExecution(0)) break;
                div2[i].classList.remove("clicked");
            }
            window.CP.exitedLoop(0);
            event.target.classList.add("clicked");
        }
    }

    function init() {
        for (var i = 0; i < div2.length; i++) {
            if (window.CP.shouldStopExecution(1)) break;
            div2[i].addEventListener("click", handleClick);
        }
        window.CP.exitedLoop(1);
    }

    init();
</script>

<script id="rendered-js">
    var div2 = document.getElementsByClassName("startTimeBox");

    function handleClick(event) {
        console.log(event.target);
        console.log(event.target.classList);
        if (event.target.classList[1] === "startTimeBoxClicked") {
            event.target.classList.remove("startTimeBoxClicked");
        } else {
            for (var i = 0; i < div2.length; i++) {
                if (window.CP.shouldStopExecution(0)) break;
                div2[i].classList.remove("startTimeBoxClicked");
            }
            window.CP.exitedLoop(0);
            event.target.classList.add("startTimeBoxClicked");
        }
    }

    function init() {
        for (var i = 0; i < div2.length; i++) {
            if (window.CP.shouldStopExecution(1)) break;
            div2[i].addEventListener("click", handleClick);
        }
        window.CP.exitedLoop(1);
    }

    init();
</script>


<script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>

</body>
</html>