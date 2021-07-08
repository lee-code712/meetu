<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>reservationPage</title>

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
    <script src="/reservation/js/reservation.js"></script>        
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
            width: 1920px;
            height: 840px;
        }

        #deptWrap {
            display: table-cell;
            float: left;
            width: 310px;
            height: 840px;
            background-color: #3E454D;
            vertical-align: middle;
        }

        #selectDept {
            display: flex;
            align-items: center;
            padding-left: 20px;
            width: 100%;
            height: 80px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            border-bottom: 1px dotted white;
            margin-bottom: 10px;
        }

        .college {
            background-color: #3E454D;
            line-height: 40px;
            font-size: 14px;
            cursor: pointer;
            color: white;
        }

        .college:hover {
            background: #363B40;
            color: white;
        }

        .deptList {
            width: 310px;
            padding-left: 20px;
            background: #F6F6F6;
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
            width: 888px;
            margin: 0 auto;
            border-top: 3px solid #FFC42E;
        }

        .profList th {
            background-color: #FFFEFC;
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

        #reserveBanner {
            font-family: 'Yellowtail', cursive;
        }

        #messageInner {
            display: block;
            width: 1610px;
            height: 840px;
            background: #EBEBEB;
        }

        #sender {
            padding-top: 28px;
            padding-left: 20px;
            margin-left: 120px;
            margin-bottom: 40px;
            height: 40px;
            font-size: 18px;
            font-weight: bold;
            color: #3E454D;

        }

        #profListWrap {
            padding-left: 20px;
            margin-left: 120px;
            width: 900px;
            height: 700px;
            font-size: 18px;
            font-weight: bold;
            color: #3E454D;
        }

        #messageInnerWrap {
            widht: 1610px;
            height: 648px;

        }

        #search {
            width: 300px;
            height: 30px;
            font-size: 12px;
            background: white;
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 8px;
        }

        #searchText {
            width: 256px;
            height: 30px;
            border-radius: 30px;
            border: none;
            padding-left: 10px;
        }

        #searchBtn {
            padding-bottom: 3px;
        }

        #searchBtn:hover {
            cursor: pointer;
        }

        .profList {
            width: 1300px;
            border-top: 3px solid #eee;
        }

        .profList th {
            font-size: 14px;
            border-bottom: 1px solid #C4C4C4;
            text-align: center;
            background: white;
        }

        .profList td {
            font-size: 14px;
            text-align: center;
            background: white;
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
        
        #infoBtn:hover,
        #checkBtn:hover {
        	cursor: pointer;
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
				<button id="dropBtn">(이름)님 ▽</button>
				<div id="dropdown-content">
					<a href="logout.do">로그아웃</a>
				</div>
			</div>
			<img src="/reservation/images/notifications_black_24dp.svg" id="alertIcon"/>
		</nav>
	</header>
	
	<table id="reservationWrap">
		<tr>
			<td>
	
				<ul id="deptWrap">
					<li id="selectDept"><span id="reserveBanner">MEETU</span> &nbsp; 상담예약</li>
	
					<li class="college">&nbsp;&nbsp;&nbsp;&nbsp;인문대학
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
					<li class="college">&nbsp;&nbsp;&nbsp;&nbsp;사회과학대학
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
					<li class="college">&nbsp;&nbsp;&nbsp;&nbsp;자연과학대학
						<ul class="deptList">
							<li class="dept">식품영양학과</li>
							<li class="dept">보건관리학과</li>
							<li class="dept">응용화학전공</li>
							<li class="dept">화장품학전공</li>
							<li class="dept">체육학과</li>
							<li class="dept">토탈뷰티케어학과</li>
						</ul>
					</li>
					<li class="college">&nbsp;&nbsp;&nbsp;&nbsp;정보과학대학
						<ul class="deptList">
							<li class="dept">컴퓨터학과</li>
							<li class="dept">정보통계학과</li>
						</ul>
					</li>
					<li class="college">&nbsp;&nbsp;&nbsp;&nbsp;약학대학</li>
					<li class="college">&nbsp;&nbsp;&nbsp;&nbsp;예술대학
						<ul class="deptList">
							<li class="dept">회화과</li>
							<li class="dept">디지털공예과</li>
							<li class="dept">큐레이터학과</li>
							<li class="dept">피아노과</li>
							<li class="dept">관현악과</li>
							<li class="dept">성악과</li>
						</ul>
					</li>
					<li class="college">&nbsp;&nbsp;&nbsp;&nbsp;디자인대학
						<ul class="deptList">
							<li class="dept">패션디자인학과</li>
							<li class="dept">시각&실내디자인학과</li>
							<li class="dept">미디어디자인학과</li>
						</ul>
					</li>
					<li class="college">&nbsp;&nbsp;&nbsp;&nbsp;공연예술대학
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
						<input type="text" id="searchText" placeholder="교수명을 입력하세요."/>
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
								<th>정보보기 / 선택하기</th>
							</tr>
							</thead>
	
							<tbody>
							<!-- <tr>
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
									</div> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<img src="/reservation/images/check.svg" id="checkBtn"/>
								</td>
							</tr>  -->
	
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
