<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>쪽지함</title>
    
    <meta charset="UTF-8"/>
   	<link rel="stylesheet" href="/message/css/message.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/message/js/message.js"></script>
    <script>
    	var role = '${mem_dto.getRole()}';
        var user_id = '${user_id}';
    </script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
	                    <div><a id="messageIcon" href="message.do">쪽지함</a></div>
	                </c:if>
	               	<c:if test="${mem_dto.getRole()=='1'}">             
	                	<div><a id="messageIcon" href="message.do">쪽지함</a></div>
	                	<div id="blankDiv"></div>
	                </c:if>
	            </div>
	        </div>
	        <div id="headerInnerR">
	            <div id="dropdown">
	                <div id="dropdown-button">${mem_dto.getName()}님 😊</div>
	                <div id="dropdown-content">
	                    <a href="myPage.do">마이페이지</a>
	                    <a href="logout.do">로그아웃</a>
	                </div>
	            </div>
	            <img src="/images/bellOn.svg" id="noticeOnImg" onclick="readNewAlerts();"/><div id="noticeCount">${count_alert}</div>
	        </div>
	    </div>
	</div>
	
	<div id="reservationWrap">
		<div>
			<div id="selectProf">쪽지함</div>
		    <ul id="mylist">
		        <c:choose>
		            <c:when test="${mem_dto.getRole() =='0'}">
		                <c:forEach items="${requestScope.msg_mem}" var="member">
		                    <li id="list" class="list">
		                        ${member.value.get(0)} ${member.value.get(1)} 교수
		                    </li>
		                    <input type='hidden' class='mem_usr_name' value='${member.value.get(1)}'/>
		                    <input type='hidden' id='mem_usr_res_id' value='${member.value.get(2)}'/>
		                </c:forEach>
		            </c:when>
		            <c:otherwise>
		                <c:forEach items="${requestScope.msg_mem}" var="member">
		                    <li id="list" class="list">
		                        ${member.value.get(0)} ${member.value.get(1)} 학생
		                    </li>
		                    <input type='hidden' class='mem_usr_name' value='${member.value.get(1)}'/>
		                    <input type='hidden' id='mem_usr_res_id' value='${member.value.get(2)}'/>
		                </c:forEach>
		            </c:otherwise>
		        </c:choose>
		    </ul>
	    </div>
	
	    <div id="messageInner">
	        <div id="sender"></div>
	        <div id="messageInnerWrap">
	            <div id="messageResult"></div>
	            <div id="messageTextWrap">
	                <div id="messageTextInnerWrap">
	                    <input type="text" placeholder="메시지를 입력하세요." id="messageText"/>
	                    <img src="/images/send.svg" id="textBtn" onclick="sendMessage()"/>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
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