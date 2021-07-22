<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 페이지</title>
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
	<link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
	
	<script src="/reservation/js/reservationContent.js"></script>
	
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
        	padding: 0 4px 0 50px;
        	height: 100%;
        }
        
        #dropImg {
        	width: 20px;
        	heihgt: 20px;
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
        .clicked {
            background: #363B40;
            color: white;
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
        body {
            background: #FAFAFA;
        }
        .sender {
            margin-left: 80px;
            margin-top: 80px;
            padding-bottom: 10px;
            padding-top: 14px;
            padding-left: 20px;
            width: 810px;
            font-size: 16px;
            font-weight: bold;
            color: #3E454D;
            background: white;
            border-radius: 10px 10px 0 0;
            border-top: 1px solid #eee;
            border-left: 1px solid #eee;
            border-right: 1px solid #eee;
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
        
        .contentWrap {
        	display: flex;
        	flex-direction: row;
        }
        
        .contentTitle {
        	display: flex;
        	justify-content: center;
        	align-items: center;
        	width: 180px;
        	background: #F0F0F0;
        	font-weight: bold;
        	border-bottom: 2px solid white;
        }
        
        .contentBody {
        	padding: 20px;
        	width: 640px;
        	background: white;
        	border: 1px solid #eee;
        	padding-left: 160px;
        	font-weight: bold;
        }
        
        .timeBox {
            display: inline-block;
            padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
        }
        
        .clicked {
        	display: inline-block;
            padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
        	border-radius: 5px;
        	background: #3E454D;
        	color: white;
        	border: none;
        	border: 1px solid #3E454D;
        	cursor: pointer;
        }
        
        .timeBoxMid:hover {
        	display: inline-block;
            padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
        	border-radius: 5px;
        	background: #3E454D;
        	color: white;
        	border: none;
        	border: 1px solid #3E454D;
        	cursor: pointer;
        }
        
        .timeBoxMid {
        	display: inline-block;
        	margin: 0 10px;
            padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
        }
        
        .startTimeBox {
            display: inline-block;
            padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
        }
        
        .startTimeBoxClicked {
        	display: inline-block;
            padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
        	border-radius: 5px;
        	background: #3E454D;
        	color: white;
        	border: none;
        	border: 1px solid #3E454D;
        	cursor: pointer;
        }
        
        .startTimeBoxMid:hover {
        	display: inline-block;
            padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
        	border-radius: 5px;
        	background: #3E454D;
        	color: white;
        	border: none;
        	border: 1px solid #3E454D;
        	cursor: pointer;
        }
        
        .startTimeBoxMid {
        	display: inline-block;
        	margin: 0 10px;
            padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            text-align: center;
            font-weight: regular;
        }
        
        .typeBtnWrap {
        	display: flex;
        }
        
        .typeBtnOff {
        	margin-right: 128px;
            padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 30px;
            text-align: center;
        }
        
        .typeBtnOff, .typeBtnOn {
        	padding: 6px 0px;
            width: 96px;
            border: 1px solid #C4C4C4;
            border-radius: 30px;
            text-align: center;
        }
        
        .typeBtnOff:hover, .typeBtnOn:hover {
        	padding: 6px 0px;
            width: 96px;
            border-radius: 30px;
            text-align: center;
        	background: #3E454D;
        	color: white;
        	border: none;
        	border: 1px solid #3E454D;
        	cursor: pointer;
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
        	margin-top: 40px;
        	float: right;
        	display: block;
        	padding: 10px 20px;
        	border-radius: 5px;
        	color: #3E454D;
        	border: 1px solid #3E454D;
        	background: white;
        	cursor: pointer;
        }
        
        .timeTitle{
        	margin-bottom: 10px;
        }
        
        .timdBoxWrap {
        	margin-top: 8px;
        }
    	
    	.reason {
    		width: 248px;
    		height: 24px;
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
    
	</style>
</head>
<body>
	<div id="topHeader">
		<div id="topHeaderInner">
			<div>로그아웃</div>
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
	                <a href="#">로그아웃</a>
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
              	<li class="list">▶ 교수명: ${param.name} </li>
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
						<td class="contentBody">달력</td>
					</tr>
					<tr class="contentWrap">
						<td class="contentTitle">상담 시간</td>
						<td class="contentBody">
							<div class="timeTitle">◈ 상담 시작 시간</div>
							<div>
								<div>
									<div class="startTimeBox">9:00</div> &nbsp;&nbsp; <div class="startTimeBox">10:00</div> &nbsp;&nbsp; <div class="startTimeBox">11:00</div>
								</div>
								<div class="timdBoxWrap">
									<div class="startTimeBox">12:00</div> &nbsp;&nbsp; <div class="startTimeBox">13:00</div> &nbsp;&nbsp; <div class="startTimeBox">14:00</div>
								</div>
								<div class="timdBoxWrap">
									<div class="startTimeBox">15:00</div> &nbsp;&nbsp; <div class="startTimeBox">16:00</div> &nbsp;&nbsp; <div class="startTimeBox">17:00</div>
								</div>
							</div>
							<br/>
							<div class="timeTitle">◈ 상담 시간</div>
							<div>
								<div class="timeBox">30분</div> &nbsp;&nbsp; <div class="timeBox">1시간</div> &nbsp;&nbsp; <div class="timeBox">2시간</div>
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
								<div class="typeBtnOff">오프라인</div> <div class="typeBtnOn">온라인</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input class="reservationBtn" type="submit" value="예약하기" />
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