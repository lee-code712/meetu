<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>쪽지함</title>
    
    <link rel="stylesheet" href="../components/css/header.css" />
	<!-- <link rel="stylesheet" href="/message/css/message.css" />  -->
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/message/js/message.js"></script>

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">

    <style>
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

        #mylist {
            margin-top: 80px;
            width: 18rem;
            height: 840px;
            border: none;
            border-radius: 10px;
        }

        #selectProf {
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

        body {
            background: #F4F4F4;
        }

        #sender {
            margin-left: 80px;
            margin-top: 80px;
            padding-bottom: 10px;
            padding-top: 14px;
            padding-left: 20px;
            width: 820px;
            font-size: 16px;
            font-weight: bold;
            color: #3E454D;
            background: white;
            border-radius: 10px 10px 0 0;
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

        #banner {
            display: table;
            margin: 0 auto;
            width: 100%;
            height: 120px;
            background-color: white;
            border-radius: 5px;
        }

        #banner div {
            display: table-cell;
            width: 1920px;
            height: 100%;
            background-image: url('/message/images/bannerThing.svg');
            background-position: center;
            background-size: cover;
            text-align: center;
            font-size: 24px;
            color: #333330;
            font-family: 'Gugi', cursive;
            vertical-align: middle;
        }

        #messageInner {
            display: block;
            width: 894px;
            height: 840px;
        }

        #messageInnerWrap {
            width: 900px;
            height: 550px;
        }

        #messageResult {
            display: block;
            margin-left: 80px;
            width: 830px;
            height: 500px;
            overflow-y: scroll;
            border-left: 5px solid white;
            border-right: 5px solid white;
            background: white;
        }

        #messageTextWrap {
            margin-left: 80px;
            width: 840px;
            height: 50px;
            background: white;
            border-radius: 0 0 10px 10px;
            border-top: 1px solid #C2C2C2;
        }

        #messageText {
            padding-left: 20px;
            width: 700px;
            height: 50px;
            background: white;
            border: none;
            border-radius: 0 0 10px 10px;
        }

        #receiveMessageText {
            width: 500px;
            margin-left: 20px;
            padding: 10px;
            border-radius: 10px;
            background: #DFE7F4;
            font-size: 14px;
        }

        #receiveDate {
            margin-top: 4px;
            padding-left: 25px;
            font-size: 12px;
            color: #848484;
        }

        #sendMessage {
            float: right;
        }

        #sendMessageText {
            width: 500px;
            margin-left: 10px;
            padding: 10px;
            border-radius: 10px;
            background: #FFF1DC;
            font-size: 14px;
        }

        #sendDate {
            margin-top: 4px;
            padding-left: 15px;
            font-size: 12px;
            color: #848484;
        }

        #receiveMessage {
            display: inline-block;
            margin-top: 10px;
        }

        #receiveMsg {
       	 	padding-left: 25px;
            color: #3296B6;
            font-size: 14px;
            margin-bottom: 4px;
        }
        
        #textBtn {
        	text-align: center;
        	padding: 14px 33px;
        	background: black;
        	color: white;
        	border-bottom: 4px solid black;
        }

        #textBtn:hover {
            cursor: pointer;
        }
        
        #reserveIcon,
        #noticeIcon {
            color: #8B8B8B;
        }
        
        #messageIcon {
        	color: white;
        }
    
      	a:link { color: white; text-decoration: none;}
 		a:visited { color: white; text-decoration: none;}
 		a:hover { color: white; text-decoration: underline;}
 		
 		#sendMessageText {
 			margin-right: 20px;
 		}
 		
    </style>
</head>

<body>
<header>
    <nav id="header_inner">
        <div id="title"><a href="index.do">MEETU</a></div>
        <div id="gnb">
            <a id="noticeIcon" href="notice.do">공지사항</a>
            <a id="reserveIcon" href="reservationPro.do">상담예약</a>
            <a id="messageIcon" href="message.do">쪽지함</a>
        </div>
        <div id="dropdown">
            <button id="dropBtn">${mem_dto.getName()}님 ▽</button>
            <div id="dropdown-content">
                <a href="#">마이페이지</a>
                <a href="logout.do">로그아웃</a>
            </div>
        </div>
        <img src="/components/images/notifications_black_24dp.svg" id="alertIcon"/>
    </nav>
</header>

<div id="banner">
    <div>쪽지함</div>
</div>

<table id="reservationWrap">
    <tr>
        <td>
            <ul id="mylist">
                <li id="selectProf"><img src="/message/images/school_black_24dp.svg"/>&nbsp;&nbsp;교수 선택</li>
                <%-- 쪽지 가능한 member list 출력 --%>
                <c:choose>
                    <c:when test="${mem_dto.getRole() =='0'}">
                        <c:forEach items="${requestScope.msg_mem}" var="member">
                            <li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg"  id="labelIcon"/>
                                ${member.value.get(0)} ${member.value.get(1)} 교수
                            </li>
                            <input type='hidden' class='mem_usr_name' value='${member.value.get(1)}'/>
                            <input type='hidden' class='mem_usr_id' value='${member.key}'/>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${requestScope.msg_mem}" var="member">
                            <li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg" id="labelIcon"/>
                            ${member.value.get(0)} ${member.value.get(1)} 학생
                            </li>
                            <input type='hidden' class='mem_usr_name' value='${member.value.get(1)}'/>
                            <input type='hidden' class='mem_usr_id' value='${member.key}'/>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </ul>
        </td>

        <td id="messageInner">
            <div id="sender"> </div>
            <div id="messageInnerWrap">
                <div id="messageResult">

                </div>
                <div id="messageTextWrap">
                    <input type="text" placeholder="메시지를 입력하세요." id="messageText"/>
                    <span id="textBtn" onclick="sendMessage()">보내기</span>
                </div>
            </div>
        </td>
    </tr>
</table>

<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-8216c69d01441f36c0ea791ae2d4469f0f8ff5326f00ae2d00e4bb7d20e24edb.js"></script>

<script id="rendered-js">
    var div2 = document.getElementsByClassName("list");

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


<script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>

</body>
</html>
