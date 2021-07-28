<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>쪽지함</title>

	<link rel="stylesheet" href="../components/css/header.css"/>
    <link rel="stylesheet" href="/message/css/message.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/message/js/message.js"></script>
    <script>
        var user_id = '${user_id}';
    </script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>

<body id="messageBodyBg">
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
	
	        <img src="images/bell.svg" id="alertIcon"/>
	    </div>
	</div>
    
    <table id="reservationWrap">
        <tr>
            <td>
                <ul id="mylist">
                    <li id="selectProf"><img src="/message/images/email_black_24dp.svg"/>&nbsp;&nbsp;쪽지함</li>
                    <%-- 쪽지 가능한 member list 출력 --%>
                    <c:choose>
                        <c:when test="${mem_dto.getRole() =='0'}">
                            <c:forEach items="${requestScope.msg_mem}" var="member">
                                <li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg"
                                                                id="labelIcon"/>
                                    ${member.value.get(0)} ${member.value.get(1)} 교수
                                </li>
                                <input type='hidden' class='mem_usr_name' value='${member.value.get(1)}'/>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.msg_mem}" var="member">
                                <li id="list" class="list"><img src="/message/images/label_important_black_24dp.svg"
                                                                id="labelIcon"/>
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