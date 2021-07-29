<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>

	<link rel="stylesheet" href="../components/css/header.css"/>
    <link rel="stylesheet" href="/notice/css/noticeContent.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/notice/js/noticeContent.js"></script>
    <script>
    	var notice_id = "${notice_dto.getNoticeId()}";
    </script>
</head>

<body id="noticeContentBodyBg">
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
    
    
    <div id="noticeContent">
        <div id="contentHeader">
        	<c:if test="${mem_dto.getRole()=='2'}">
	            <div id="moreDropdown">
	                <div id="moreDropBtn">
	                    <div id="moreDropBtnTitle"><img src="/notice/images/more_vert_black_24dp.svg" id="moreIcon"/></div>
	                </div>
	                <div id="moreDropdownContent">
	                    <a href="#" onclick="deleteNotice()">삭제하기</a>
	                </div>
	            </div>
            </c:if>
            <div id="contentTitle">
                <span>◈</span> ${notice_dto.getTitle()} <span>◈</span>
            </div>
        </div>
        <div id="contentDate">
            <div id="writeDate">${notice_dto.getWriteDate()}</div>
        </div>
        <div id="content">${notice_dto.getContent()}</div>
        <button id="listBtn" onclick="location.href='notice.do'">목록</button>
    </div>
</body>
</html>