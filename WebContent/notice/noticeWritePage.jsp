<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항 내용</title>
    <link href="https://fonts.googleapis.com/css2?family=Yellowtail&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/notice/css/noticeWritePage.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/notice/js/noticeWrite.js"></script>
</head>

<body id="ntContentPgBg">
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
	                	<div><a id="reserveIcon" href="#"/></div>
	                </c:if>
	            </div>
	        </div>
	        <div id="headerInnerR">
	            <div id="dropdown">
	                <div id="dropdown-button">${mem_dto.getName()}님 😊</div>
	                <div id="dropdown-content">
	                    <c:if test="${mem_dto.getRole()!='2'}">
	                        <a href="myPage.do">마이페이지</a>
	                    </c:if>
	                    <a href="logout.do">로그아웃</a>
	                </div>
	            </div>
	            <img src="/images/bellOn.svg" id="noticeOnImg" onclick="readNewAlerts();"/><div id="noticeCount">${count_alert}</div>
	        </div>
	    </div>
	</div>
	
	<div id="noticeContentWrap">
	    <div id="ntContentHeader">
	        <div id="ntContentTit"><input type="text" placeholder="제목을 입력하세요." id="titleInput"/></div>
	    </div>
	    <div id="ntContentWrap">
	        <div id="content"><textarea cols="50" rows="24" id="contentInput" placeholder="내용을 입력하세요."></textarea></div>
	    </div>
	    <div id="listBtnWrap">
	        <button id="listBtn" onclick="addNotice()">완료</button>
	    </div>
	</div>
</body>
</html>
