<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>쪽지함</title>
    <meta charset="UTF-8"/>
    <!--<link rel="stylesheet" href="/message/css/message.css"/>-->
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/message/js/message.js"></script>
    <script>
        var user_id = '${user_id}';
    </script>


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <style>

        #noticeImg {
            width: 14px;
            height: 14px;
        }

        #noticeImg:hover {
            cursor: pointer;
        }

        #noticeIcon:hover,
        #reserveIcon:hover,
        #messageIcon:hover {
            cursor: pointer;
        }

        #noticeIcon,
        #reserveIcon,
        #messageIcon {
            color: black;
        }

        a:link {
            color: black;
            text-decoration: none;
        }

        a:visited {
            color: black;
            text-decoration: none;
        }

        a:hover {
            color: black;
            text-decoration: none;
        }

        #title,
        #title a:link,
        #title a:visited,
        #title a:hover {
            color: #1abc9c;

        }

        #header {
            width: 100%;
            height: 80px;
            background: white;
            border-bottom: 1px solid #EAEAEA;
        }

        #headerInner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 auto;
            width: 1194px;
            height: 100%;
        }

        #headerInnerL {
            display: flex;
            align-items: center;
        }

        #title {
            font-family: 'Yellowtail', cursive;
            font-size: 18px;
            font-weight: bold;
        }

        #gnb {
            margin-left: 140px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 300px;
            font-size: 14px;
        }

        #headerInnerR {
            display: flex;
            align-items: center;
        }

        #dropdown {
            position: relative;
            display: inline-block;
            font-size: 14px;
            padding: 14px;
        }

        #dropdown-button:hover {
            cursor: pointer;
        }

        #dropdown-button div {
            justify-content: flex-end;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            margin-top: 14px;
            min-width: 130px;
            padding: 4px;
            border-radius: 5px;
            box-shadow: 0px 4px 8px 0px rgba(0, 0, 0, 0.2);
        }

        #dropdown-content a {
            color: black;
            padding: 8px;
            text-decoration: none;
            display: block;
        }

        #dropdown-content a:hover {
            background-color: #FAFAFA;
            border-radius: 5px;
        }

        #dropdown:hover #dropdown-content {
            display: block;
        }

        #headerInnerR img {
            margin-left: 60px;
        }

        #receiveMsg {
            padding-left: 25px;
            color: #3296B6;
            font-size: 14px;
            margin-bottom: 4px;
        }

        @charset "UTF-8";

        a {
            text-decoration: none;
            list-style: none;
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

        #mylist {
            margin-top: 80px;
            width: 318px;
            height: 840px;
            border: none;
            border-radius: 10px;
        }

        #selectProf {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 40px;
            font-size: 18px;
            border: 1px solid #EAEAEA;
            background: white;
            border-radius: 5px 5px 0px 0px;
        }

        .list {
            display: flex;
            align-items: center;
            padding-left: 20px;
            width: 298px;
            line-height: 40px;
            font-size: 14px;
            cursor: pointer;
            border-left: 1px solid #EAEAEA;
            border-right: 1px solid #EAEAEA;
            background: white;
        }

        .list:hover {
            background: #1abc9c;
            color: white;
            cursor: pointer;
        }

        .clicked {
            background: #1abc9c;
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

        #messageBodyBg {
            background: #FAFAFA;
        }

        #sender {
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
            border-bottom: 1px solid #eee;
            border-left: 1px solid #eee;
            border-right: 1px solid #eee;
        }

        #messageTextWrap {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0px 20px;
            margin-left: 80px;
            width: 790px;
            height: 50px;
            background: white;
            border-radius: 0 0 10px 10px;
            border-bottom: 1px solid #eee;
            border-left: 1px solid #eee;
            border-right: 1px solid #eee;
        }

        #messageTextInnerWrap {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0px 10px;
            width: 100%;
            height: 34px;
            border-radius: 50px;
            border: 1px solid #EAEAEA;
        }

        #messageText {
            width: 700px;
            height: 30px;
            border: none;
            border-radius: 0 0 10px 10px;
        }

        #messageText:focus {
            outline: none;
        }

        #receiveMessageText {
            width: 400px;
            margin-left: 20px;
            padding: 10px;
            border-radius: 10px 10px 10px 0px;
            background: white;
            border: 1px solid #535353;
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
            margin-top: 20px;
        }

        #sendMessageText {
            width: 400px;
            margin-left: 10px;
            padding: 10px;
            border-radius: 10px 10px 0px 10px;
            background: #f1f1f1;
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

        #sendMessageText {
            margin-right: 20px;
        }

        #textBtn:hover {
            cursor: pointer;
        }

    </style>
</head>

<body id="messageBodyBg">

<div id="header">
    <div id="headerInner">
        <div id="headerInnerL">
            <div id="title"><a href="index.do">MEETU</a></div>
            <div id="gnb">
                <div><a id="noticeIcon" href="notice.do">공지사항</a></div>
                <c:if test="${mem_dto.getRole()=='0'}">
                    <div><a id="reserveIcon" href="reservation.do">상담예약</a></div>
                </c:if>
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

<table id="reservationWrap">
    <tr>
        <td>
            <ul id="mylist">
                <li id="selectProf">쪽지함</li>
                <%-- 쪽지 가능한 member list 출력 --%>
                <c:choose>
                    <c:when test="${mem_dto.getRole() =='0'}">
                        <c:forEach items="${requestScope.msg_mem}" var="member">
                            <li id="list" class="list">
                                ${member.value.get(0)} ${member.value.get(1)} 교수
                            </li>
                            <input type='hidden' class='mem_usr_name' value='${member.value.get(1)}'/>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${requestScope.msg_mem}" var="member">
                            <li id="list" class="list">
                                ${member.value.get(0)} ${member.value.get(1)} 학생
                            </li>
                            <input type='hidden' class='mem_usr_name' value='${member.value.get(1)}'/>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </ul>
        </td>

        <td id="messageInner">
            <div id="sender"></div>
            <div id="messageInnerWrap">
                <div id="messageResult">
                   
                </div>
                <div id="messageTextWrap">
                    <div id="messageTextInnerWrap">
                        <input type="text" placeholder="메시지를 입력하세요." id="messageText"/>
                        <img src="../images/send.svg" id="textBtn" onclick="sendMessage()"/>
                    </div>
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
