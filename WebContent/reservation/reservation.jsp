<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>reservationPage</title>

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
    <style>
        header {
            width: 100%;
            height: 100px;
            top: 0px;
            background: rgba(0, 0, 0, .800);
            box-sizing: border-box;
            transition: All 0.2s ease;
            -webkit-transition: All 0.2s ease;
            -moz-transition: All 0.2s ease;
            -o-transition: All 0.2s ease;
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
            color: white;
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
            font-size: 14px;
            font-weight: bold;
            color: white;
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
            width: 160px;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            background: none;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border: 1px solid white;
            border-radius: 500px;
        }

        #dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background: rgba(0, 0, 0, 0.1);
            border-radius: 500px;
        }

        #dropdown:hover #dropdown-content {
            display: block;
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

        #noticeIcon,
        #messageIcon,
        #myPageIcon {
            color: #8B8B8B;
        }

        #messageInner {
            display: block;
            width: 894px;
            height: 840px;

        }

        body {
            background: #F4F4F4;
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
            width: 1920px;
            height: 100px;
            background-color: white;
            border-radius: 5px;
        }

        #banner div {
            display: table-cell;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #3E454D;
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
        <div id="dropdown">
            <button id="dropBtn">${mem_dto.getName()}님 ▽</button>
            <div id="dropdown-content">
                <a href="#">로그아웃</a>
            </div>
        </div>
        <img src="/reservation/images/notifications_black_24dp.svg" id="alertIcon"/>
    </nav>
</header>

<div id="banner">
    <div>상담예약</div>
</div>

<table id="reservationWrap">
    <tr>
        <td>
            <ul id="deptWrap">
                <li id="selectDept"><img src="/reservation/images/school_black_24dp.svg"/>&nbsp;&nbsp;학과 선택</li>

                <li class="college"><img src="/reservation/images/label_important_black_24dp.svg"/>&nbsp;인문대학
                    <ul class="deptList">
                        <li class="dept">국어국문학과</li>
                        <li class="dept">국사학과</li>
                        <li class="dept">문예창작과</li>
                        <li class="dept">영어과</li>
                        <li class="dept">일본어과</li>
                        <li class="dept">프랑스어과</li>
                        <li class="dept">독일어과</li>
                        <li class="dept">중어중국학과</li>
                    </ul>
                </li>
                <li class="college"><img src="/reservation/images/label_important_black_24dp.svg"/>&nbsp;사회과학대학
                    <ul class="deptList">
                        <li class="dept">경영학과</li>
                        <li class="dept">세무회계학과</li>
                        <li class="dept">경제학과</li>
                        <li class="dept">국제경영학과</li>
                        <li class="dept">문헌정보학과</li>
                        <li class="dept">사회복지학과</li>
                        <li class="dept">아동학과</li>
                    </ul>
                </li>
                <li class="college"><img src="/reservation/images/label_important_black_24dp.svg"/>&nbsp;자연과학대학
                    <ul class="deptList">
                        <li class="dept">식품영양학과</li>
                        <li class="dept">보건관리학과</li>
                        <li class="dept">응용화학전공</li>
                        <li class="dept">화장품학전공</li>
                        <li class="dept">체육학과</li>
                        <li class="dept">토탈뷰티케어학과</li>
                    </ul>
                </li>
                <li class="college"><img src="/reservation/images/label_important_black_24dp.svg"/>&nbsp;정보과학대학
                    <ul class="deptList">
                        <li class="dept">컴퓨터학과</li>
                        <li class="dept">정보통계학과</li>
                    </ul>
                </li>
                <li class="college"><img src="/reservation/images/label_important_black_24dp.svg"/>&nbsp;약학대학</li>
                <li class="college"><img src="/reservation/images/label_important_black_24dp.svg"/>&nbsp;예술대학
                    <ul class="deptList">
                        <li class="dept">회화과</li>
                        <li class="dept">디지털공예과</li>
                        <li class="dept">큐레이터학과</li>
                        <li class="dept">피아노과</li>
                        <li class="dept">관현악과</li>
                        <li class="dept">성악과</li>
                    </ul>
                </li>
                <li class="college"><img src="/reservation/images/label_important_black_24dp.svg"/>&nbsp;디자인대학
                    <ul class="deptList">
                        <li class="dept">패션디자인학과</li>
                        <li class="dept">시각&실내디자인학과</li>
                        <li class="dept">미디어디자인학과</li>
                    </ul>
                </li>
                <li class="college"><img src="/reservation/images/label_important_black_24dp.svg"/>&nbsp;공연예술대학
                    <ul class="deptList">
                        <li class="dept">무용과</li>
                        <li class="dept">방송연예과</li>
                        <li class="dept">실용음악과</li>
                        <li class="dept">모델과</li>
                    </ul>
                </li>
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

                        <tbody>
                        <tr> <!--선택하기 버튼 있음-->
                            <td>1</td>
                            <td>000교수님</td>
                            <td>컴퓨터학과</td>
                            <td>
                                <div id="infoBox"><img src="/reservation/images/info.svg" id="infoBtn"/>
                                    <div id="infoBox-content">
                                        <p><span id="infoTitle">교수명</span></p>
                                        <p>000교수님</p>
                                        <p><span id="infoTitle">전공</span></p>
                                        <p>컴퓨터학과</p>
                                        <p><span id="infoTitle">담당과목</span></p>
                                        <p>모바일 소프트웨어</p>
                                        <p><span id="infoTitle">이메일</span></p>
                                        <p>이메일@dongduk.ac.kr</p>
                                        <p><span id="infoTitle">연구실 위치</span></p>
                                        <p>인문관 303호</p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <button id="checkBtn">선택하기</button>
                            </td>

                        </tr>

                        <tr> <!--선택하기 버튼 없음-->
                            <td>2</td>
                            <td>000교수님</td>
                            <td>컴퓨터학과</td>
                            <td>
                                <div id="infoBox"><img src="/reservation/images/info.svg" id="infoBtn"/>
                                    <div id="infoBox-content">
                                        <p><span id="infoTitle">교수명</span></p>
                                        <p>000교수님</p>
                                        <p><span id="infoTitle">전공</span></p>
                                        <p>컴퓨터학과</p>
                                        <p><span id="infoTitle">담당과목</span></p>
                                        <p>모바일 소프트웨어</p>
                                        <p><span id="infoTitle">이메일</span></p>
                                        <p>이메일@dongduk.ac.kr</p>
                                        <p><span id="infoTitle">연구실 위치</span></p>
                                        <p>인문관 303호</p>
                                    </div>
                                </div>
                            </td>
                            <td>

                            </td>

                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </td>
    </tr>
</table>

<script>
    $('.college').click(function () {
        $('.deptList').slideUp();
        if ($(this).children('.deptList').is(':visible')) {
            $(this).children('.deptList').slideUp();
        } else {
            $(this).children('.deptList').slideDown();
        }
    });
</script>
</body>
</html>