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
        	display: flex;
            line-height: 40px;
            font-size: 14px;
            border-bottom: 1px dotted black;
            cursor: pointer;
        }
        
        .list img {
			display: flex;
			align-items: center;
			padding-right: 10px;
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

        .startTimeBox:hover > a {
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

        .timeBox:hover > a {
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
    </style>
</head>

<body id="reservationContentBodyBg">
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

<form method="post" name="reservation_form" action="reservation.do" onsubmit="return ck_reservation_form()">
    <div class="reservationWrap">
        <div>
            <ul class="mylist">
                <li class="selectProf">상담예약</li>
                <li class="list" id="name"><img src="/reservation/images/profName.svg"/> 교수명: ${param.name}</li>
                <li class="list" id="dept"><img src="/reservation/images/dept.svg"/> 학과: ${param.major}</li>
                <li class="list" id="course"><img src="/reservation/images/book.svg"/> 담당과목: ${param.course}</li>
                <li class="list" id="email"><img src="/reservation/images/email.svg"/> 이메일: ${param.email}</li>
                <li class="list" id="office"><img src="/reservation/images/office.svg"/> 연구실 위치: ${param.office}</li>
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
