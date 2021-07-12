<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>쪽지함</title>
    
    <link rel="stylesheet" href="../components/css/header.css" />
	<!-- <link rel="stylesheet" href="/message/css/message1.css" />  -->
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



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

        .list:hover {
            background: #363B40;
            color: white;
        }
        
        .list.selected {
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
            width: 830px;
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
        }

        #messageTextWrap {
            margin-left: 80px;
            width: 830px;
            height: 50px;
            background: white;
            border-radius: 0 0 10px 10px;
        }

        #messageText {
            padding-left: 20px;
            width: 780px;
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
            padding-left: 20px;
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
            padding-left: 20px;
            font-size: 12px;
            color: #848484;
        }

        #receiveMessage {
            display: inline-block;
            margin-top: 10px;
        }

        #receiveMsg {
            color: #3296B6;
            font-size: 14px;
            margin-bottom: 4px;
        }

        #sendMsg {
            color: #72d468;
            font-size: 14px;
            margin-bottom: 4px;
        }

        #textBtn {
            margin-bottom: 6px;
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
                <a href="#">로그아웃</a>
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
				<li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg"/>컴퓨터학과 000교수님
				<li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg"/>컴퓨터학과 000교수님
                <%-- 쪽지 가능한 member list 출력 --%>
                <c:choose>
                    <c:when test="${mem_dto.getRole() =='0'}">
                        <c:forEach items="${requestScope.msg_mem}" var="member">
                            <li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg"/>
                                ${member.value.get(0)} ${member.value.get(1)} 교수
                            </li>
                            <input type='hidden' class='mem_usr_id' value='${member.key}'/>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${requestScope.msg_mem}" var="member">
                            <li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg"/>${member.value.get(0)}
                                ${member.value.get(1)} 학생
                            </li>
                            <input type='hidden' class='mem_usr_id' value='${member.key}'/>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </ul>
        </td>

        <td id="messageInner">
            <div id="sender">
                컴퓨터학과 000교수님
            </div>
            <div id="messageInnerWrap">
                <div id="messageResult">
                    <div id="receiveMessage">
                        <div id="receiveMessageText">
                            <div id="receiveMsg">받는 쪽지</div>
                            <div id="messageContent">(메시지 내용)</div>
                        </div>
                        <div id="receiveDate">2021-07-11 오전 9:00</div>
                    </div>

                    <div id="sendMessage">
                        <div id="sendMessageText">
                            <div id="sendMsg">보낸 쪽지</div>
                            <div id="messageContent">(메시지 내용)</div>
                        </div>
                        <div id="sendDate">2021-07-11 오전 9:00</div>
                    </div>
                </div>
                <div id="messageTextWrap">
                    <input type="text" placeholder="메시지를 입력하세요." id="messageText"/>
                    <img src="/message/images/send_black_24dp.svg" id="textBtn" onclick="sendMessage()"/>
                </div>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
